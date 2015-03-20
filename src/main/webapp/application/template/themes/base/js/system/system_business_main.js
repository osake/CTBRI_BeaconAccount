$(function(){
	refreshAuth();
	$("#businessList").jqGrid({
	    url:global_context+"/system/business/list.do",
	    datatype: "json",
	    mtype: "GET",
	    width:"100%",
	    height:"auto",
	    autowidth:true,
	    viewsortcols:[true,'vertical',true],
	    //multiselect:false, //是否在首列加入复选框
	    //multiselectWidth:30, //复选框的宽度
	    colModel : [
			{name:"recordId",index:"record_id",label : "记录ID",width:'100%',align:"center", key:true,hidden:true},
	      	{name:"customerName",index:"customer_name",label : "客户名称",width:'15%',align:"center",hidden:true},
	      	{name:"contractSum",index:"contract_sum",label : "合同金额",width:'15%',hidden:true,align:"center"},
	      	{name:"dataOrigin",index:"data_origin",label : "数据源",width:'15%',sortable:true,align:"center"},
	      	{name:"dataVersion",index:"data_version",label : "数据版本",width:'15%',sortable:true,align:"center"},
	      	{name:"contractLast",index:"contract_last",label : "合同概况",width:'15%',sortable:true,align:"center"},
	      	{name:"dataShare",index:"data_share",label : "数据分成",width:'15%',sortable:false,align:"center"},
	      	{name:"setup",label : "配&nbsp;置",width:'15%',sortable:false,align:"center" }
		 ],
	    pager: "#businessListPager",	    
	    sortname: "record_id",
	    sortorder: "asc",
	    rowNum:15,
	    rowList:[10,20,50],
	    viewrecords: true,
	    gridview: true,
	    pgbuttons:true,
	    pginput:true,
	    grouping: true,
	   	groupingView : {
	   		groupField : ['customerName','contractSum'],
	   		groupColumnShow : [false,false],
	   		groupText : [
	   		             '<div style=""><h3>客户名称：<span class="cusName">{0}</span></h3></div>',
	   		             '<div style="">' +
	   		             	 "<h3>合同总金额：<span class='contraSum'>{0}</span>万元   " +
		   		             "<img style='cursor:pointer;' src='"+global_context+"/application/template/themes/base/images/content-add.png' onclick='addNewRecordToCurrent(this,{0})' title='添加'/>   " +
		   		             "<span style='cursor:pointer;' onclick='modifyByBatch(this)'>修改</span>" +
		   		             "</h3>" +
	   		             "</div>"
	   		],
	   		groupCollapse : false,
			groupOrder: ['asc','asc'],
			groupSummary : [false,false],
			groupDataSorted : true
	   	},
	    prmNames : {  
		    page:"pageNo",     //表示请求页码的参数名称  
		    rows:"rows",     //表示请求行数的参数名称  
		    totalrows:"totalrows", // 表示需从Server得到总共多少行数据的参数名称，参见jqGrid选项中的rowTotal  
			search:"search",// 表示是否是搜索请求的参数名称
			sort:"sortName",// 表示用于排序的列名的参数名称  
		    order:"sortOrder"// 表示采用的排序方式的参数名称
		},
		jsonReader: {
	        root:"contents", 
	        page: "pageNo",
	        total: "totalPages",
	        records: "totalRecords",
	        id:"pageNo",
	        repeatitems : false 
	    },
	    gridComplete:function(){  //在此事件中循环为每一行添加详细信息	     	
	    	var ids=$(this).jqGrid('getDataIDs'); 
			for(var i=0; i<ids.length; i++){
				var id=ids[i];     
				var setupstr = "<img id='" + id + "' src='"+global_context+"/application/template/themes/base/images/user_modify.gif' title='修改' class='auth' authKey = 'business_mod' style='cursor:pointer;' onclick='modifyBusinessIn(this.id);'/>&nbsp;&nbsp;";
				setupstr += "<img id='" + id + "' src='"+global_context+"/application/template/themes/base/images/user_del.gif' title='删除' class='auth' authKey = 'business_del' style='cursor:pointer;' onclick='delBusinessCF(this.id);'/>";
				$(this).jqGrid("setCell",id,"setup",setupstr,{'padding':'2px 0 0 0'});
			}
			refreshAuth();
			var bodyObj=document.getElementById('main-content');
			if(bodyObj.scrollHeight>bodyObj.clientHeight||bodyObj.offsetHeight>bodyObj.clientHeight){
				$("#main-content .toolBar").css('width',$(this).width()-12);
			}
        }              
  	});
  	//查询下拉列表初始化
	//机构列表
	$.post(global_context+"/system/user/info.do", function(data){
  		domsLoadData("query_form", data);
  	});
  	//功能配置信息对话框
  	$( "#businessDialog" ).dialog({
  		title:'增加客户',
		autoOpen: false,
		width: 'auto',
		//height:450,
		modal: true,
		resizable:true,
		show: 'fade',
		hide: 'fade',
 		close:function(){
 			$( this ).empty();
 		}
	});	

	initConfirmDialog("confirmDialog");
	initAlertDialog("alertDialog");
});	

//保存当前选择的行Id
var selectId = "";

function saveTheEdit(dom,cusNameOld,conSumOld){
	var jDom = $(dom);
	
	var cusNameDom =  jDom.parents("tr").prev().find(".cusName");
	var conSumDom = jDom.prevAll(".contraSum");
	
	var cusNameNew =cusNameDom.find('input').val();
	var conSumNew = conSumDom.find('input').val();
	
	cusNameOld=cusNameOld.trim(), conSumOld=conSumOld.trim()
	cusNameNew=cusNameNew.trim(),conSumNew=conSumNew.trim()
	
	if(cusNameNew.length==0 || cusNameNew.length >20){
		alertJQ("数据格式填写不正确", 1000);
		return;
	}
	if(conSumNew.length==0 || conSumNew.length >20){
		alertJQ("数据格式填写不正确", 1000);
		return;
	}
	
	if(!(cusNameOld ===cusNameNew &&conSumOld===conSumNew)) {
		$('#activity_pane').showLoading();
		$.post(global_context+"/system/business/batchUpdateBusiness.do", 
				{cusNameNew : cusNameNew,conSumNew:conSumNew,cusNameOld : cusNameOld,conSumOld:conSumOld}, function(data) {
			$('#activity_pane').hideLoading();
			if (data == true) {
				alertJQ("操作成功，请等待页面刷新！", 1000);
			} else {
				alertJQ("服务器异常，请通知管理人员");
			}
			$("#businessList").trigger("reloadGrid");
		});
	}
	cusNameDom.html(cusNameNew);
	conSumDom.html(conSumNew);
	jDom.html("修改");
	jDom.attr('onclick','modifyByBatch(this)');
}

function modifyByBatch(dom){
	var jDom = $(dom);
	
	var cusNameDom =  jDom.parents("tr").prev().find(".cusName");
	var conSumDom = jDom.prevAll(".contraSum");
	
	var cusName =cusNameDom.html();
	var conSum = conSumDom.html();
	
	var inputName  = $("<input type='text' style='width:"+cusNameDom.width()+"px;' value='" + cusName + "'/>"); 
	var  inputSum= $("<input type='text' style='width:"+conSumDom.width()+"px;' value='" + conSum + "'/>"); 
	
	cusNameDom.html(inputName);
	conSumDom.html(inputSum);
	
	jDom.html("保存");
	jDom.attr('onclick','saveTheEdit(this,"'+cusName+'","'+conSum+'")');

}

function addNewRecordToCurrent(dom,contraSum){
	var jDom = $(dom);
	var cusName = jDom.parents("tr").prev().find(".cusName").html();
	contraSum+="";
	
	//showLoading提供加载等待的效果
	$('#activity_pane').showLoading();
	$("#businessDialog").dialog('option', 'title', '新增记录');
	$("#businessDialog").dialog('option', 'buttons', {
		"确定" : addBusinessOut,
		"取消" : function() {
			$(this).dialog("close");
		}
	});
	selectId = $("#businessList").jqGrid("getGridParam", "selrow");
	//加载基本信息页面
	$("#businessDialog").load(global_jsp_position+'/system/system_business_add_dialog.jsp',function(){	
		$.post(global_context+"/system/user/info.do",  addBusinessInCB);
		$("#customerName").val(cusName).parent().parent().hide();
		$("#contractSum").val(contraSum).parent().parent().hide();
	});
}
//增加客户入口
function addBusinessIn() {
	//showLoading提供加载等待的效果
	$('#activity_pane').showLoading();
	$("#businessDialog").dialog('option', 'title', '新增记录');
	$("#businessDialog").dialog('option', 'buttons', {
		"确定" : addBusinessOut,
		"取消" : function() {
			$(this).dialog("close");
		}
	});
	selectId = $("#businessList").jqGrid("getGridParam", "selrow");
	//加载基本信息页面
	$("#businessDialog").load(global_jsp_position+'/system/system_business_add_dialog.jsp',function(){	
		$.post(global_context+"/system/user/info.do",  addBusinessInCB);
	});
}

//新增用户入口回调
function addBusinessInCB(data) {
	//为表单填充数据
	domsLoadData("businessAddForm", data);
	//增加表单验证
	$("#businessAddForm").validate({
		rules : {
			customerName:{required:true,maxlength:20,byteRangeLength:[0,20]},
			contractSum:{required:true,maxlength:20,byteRangeLength:[0,20]},
			dataVersion:{required:true,maxlength:20,byteRangeLength:[0,20]},
			contractLast:{required:true,maxlength:20,byteRangeLength:[0,20]},
			dataShare:{required:true,maxlength:20,byteRangeLength:[0,20]},
			organ:{required:true}
		},
		onkeyup : false,
		onclick : false,
		errorPlacement : function(error, element) { //指定错误信息位置
			error.appendTo(element.parent().children().filter("span"));
		},
		submitHandler : function() { //验证通过后调用此函数
			addBusiness();
		}
	});

	//注册增加ajax表单
	$("#businessAddForm").ajaxForm();
	$('#activity_pane').hideLoading();
	$("#businessDialog").dialog("open");
}

//新增用户出口
function addBusinessOut() {
	$("#businessSelectR").find("option").each(function(){
		$(this).attr("SELECTED","SELECTED");
	});
	$(":input").val().trim();
	$("#businessAddForm").submit();
}
//新增用户，向后台发出请求
function addBusiness(){
	//禁用按钮
	disableButton();
	$('#activity_pane').showLoading();
	$("#businessAddForm").ajaxSubmit({
		url : global_context+"/system/business/addBusiness.do",
		data:{dataOrigin:$('#dataOrigin').val()},
		success : addBusinessOutCB
	});
}
//新增用户出口回调
function addBusinessOutCB(data) {
	//启用按钮
	enableButton();
	$('#activity_pane').hideLoading();
	if (data== true) {
		$("#businessDialog").dialog("close");
		alertJQ("操作成功，请等待页面刷新！", 1000);
		$("#businessList").trigger("reloadGrid");
	} else if (data == false) {
		alertJQ("服务器异常，请通知管理人员");
	}
}

//ƒ用户入口函数
function modifyBusinessIn(businessId) {
	$('#activity_pane').showLoading();
	$("#businessDialog").dialog('option', 'title', '修改客户');
	$("#businessDialog").dialog('option', 'buttons', {
		"保存" : modifyBusinessOut,
		"取消" : function() {
			$(this).dialog("close");
		}
	});
	//加载基本信息页面
	$("#businessDialog").load(global_jsp_position+'/system/system_business_modify_dialog.jsp',function() {
		$.post(global_context+"/system/user/info.do", function(data){
			domsLoadData("businessModifyForm", data);
			//根据id获取行数据,返回的是列表
			var rowDatas = $("#businessList").jqGrid('getRowData', businessId);
			$("#customerName").val(rowDatas.customerName);
			$("#contractSum").val(rowDatas.contractSum);
			$("#dataOrigin").val(rowDatas.dataOrigin);
			$("#dataVersion").val(rowDatas.dataVersion);
			$("#contractLast").val(rowDatas.contractLast);
			$("#dataShare").val(rowDatas.dataShare);
			$('#activity_pane').hideLoading();
			$("#businessDialog").dialog("open");
		});
		//修改表单验证
		$("#businessModifyForm").validate({
			rules : { 
				customerName:{required:true,maxlength:20,byteRangeLength:[0,20]},
				contractSum:{required:true,maxlength:20,byteRangeLength:[0,20]},
				dataVersion:{required:true,maxlength:20,byteRangeLength:[0,20]},
				contractLast:{required:true,maxlength:20,byteRangeLength:[0,20]},
				dataShare:{required:true,maxlength:20,byteRangeLength:[0,20]},
				organ:{required:true}
			},
			onkeyup : false,
			onclick : false,
			errorPlacement : function(error, element) { //指定错误信息位置
				error.appendTo(element.parent().children().filter("span"));
			},
			messages : {
				name:{remote:"此客户名已存在"}
			},
			submitHandler : function() { //验证通过后调用此函数
				//禁用按钮
				disableButton();
				$('#activity_pane').showLoading();

				$("#businessModifyForm").ajaxSubmit({
					url : global_context+"/system/business/modifyBusiness.do",
					data:{dataOrigin:$('#dataOrigin').val(),recordId:businessId},
					success : modifyBusinessOutCB
				});
			}
		});
		//注册增加用户ajax表单
		$("#businessModifyForm").ajaxForm();
	});
}

//修改用户出口
function modifyBusinessOut() {
	$("#businessSelectR").find("option").each(function(){
		$(this).attr("SELECTED","SELECTED");
	});
	$(":input").val().trim();
	$("#businessModifyForm").submit();
}

//修改用户出口回调函数
function modifyBusinessOutCB(data) {
	//启用按钮
	enableButton();
	$('#activity_pane').hideLoading();
	$("#businessList").trigger("reloadGrid");
	if (data == true) {
		$("#businessDialog").dialog("close");
		alertJQ("操作成功，请等待页面刷新！", 1000);

	} else if (data==false) {
		alertJQ("服务器异常，请通知管理人员");
	}
}

var businessId;

//确认删除
function delBusinessCF(businessId) {
		confirmJQ("删除后无法恢复，确认删除？", delBusiness, businessId);
}

//删除
function delBusiness(businessId) {
	$('#activity_pane').showLoading();
	$.post(global_context+"/system/business/deleteBusiness.do", {businessId : businessId}, function(data) {
		$('#activity_pane').hideLoading();
		if (data == true) {
			alertJQ("操作成功，请等待页面刷新！", 1000);
			$("#businessList").trigger("reloadGrid");
		} else {
			alertJQ("服务器异常，请通知管理人员");
		}
	});
}


//查询
function query() {

	var postData = {
		customerName : $("#query_name").val().trim(),
		dataOrigin : $("#query_organ").val().trim()
	};
	//合并数据 	
	postData = $.extend($("#businessList").getGridParam("postData"), postData);
	//将合并后的数据设置到表格属性中，记得加search:true 
	$("#businessList").setGridParam({
		search : true,
		postData : postData
	});
	$("#businessList").trigger("reloadGrid", [ {
		page : 1
	} ]);
}

//向表单填充内容
function domsLoadData(formId , data){
  		var id;
  		var name = "name";
  		for(var obj in data){
  			if($("#"+formId+" [name="+obj+"]") && $("#"+formId+" [name="+obj+"]").length>0){
  				var selectObj = $("#"+formId+" [name="+obj+"]");
  				if(obj=="business") id ="businessId";
  				else if(obj == "organ"){
  					id = "name";
  				}
  				//填充下拉框
  				if(selectObj.get(0).tagName=="SELECT")
  				    for(var i=0;i<data[obj].length; i++){
  				    	if(typeof(data[obj][i]["parentId"]) == undefined || data[obj][i]["parentId"] == null) continue;
  				    	if(data[obj][i][id]!=null&&data[obj][i][id]!=""){
  				    		if(data[obj][i]["selected"]==true)
  								selectObj.get(0).add(new Option(data[obj][i][name], data[obj][i][id], false, true));
  							else 
  								selectObj.get(0).add(new Option(data[obj][i][name], data[obj][i][id]));
  				    	}else{
  				    		if(data[obj][i]["selected"]==true)
  								selectObj.get(0).add(new Option(data[obj][i][name],"", false, true));
  							else 
  								selectObj.get(0).add(new Option(data[obj][i][name],""));
  				    	}
  				    }
  				else if(selectObj.get(0).tagName=="INPUT")
  					//填充文本框
  					if(selectObj.attr("type")!="file")//忽略上传控件
  						selectObj.val(data[obj]);
  				}
  			}
}
