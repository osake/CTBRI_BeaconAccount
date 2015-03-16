$(function(){
	//主页面表格
	varlastsel=null;
	$("#userList").jqGrid({
	url:golbal_context+"/system/user/list.do",
	datatype:"json",
	mtype:"GET",
	width:"100%",
	height:"auto",
	autowidth:true,
	//cellEdit:true,//不要轻易间celledit，会导致onselectrow等都失效
	//multiselect:true,//是否在首列加入复选框
	//multiselectWidth:30,//复选框的宽度
	colModel:[
			{name:"userId",index:"user_id",label:"用户ID",width:30,align:"center",hidden:true,key:true},
			{name:"permitNum",index:"permit_num",label:"工作证号",width:30,align:"center",sortable:true,
editable:true,
edittype:'text',
editoptions:{size:10,maxlength:15},
editrules:{required:true},
formoptions:{elmprefix:'(*)'}
			},
		{name:"loginName",index:"login_name",label:"登录名",width:30,sortable:true,align:"center"},		
	{name:"userName",index:"user_name",label:"姓&nbsp;名",width:30,sortable:true,align:"center",
editable:true,
edittype:'text',
editoptions:{size:10,maxlength:15},
editrules:{required:true},
formoptions:{elmprefix:'(*)'}
	},
	{name:"roleNames",index:"roleNames",label:"角&nbsp;色",width:30,sortable:false,align:"center"},
	{name:"status",index:"status",label:"账号状态",width:30,sortable:false,align:"center"},
	{name:"departmentName",index:"departmentName",label:"所属机构",width:30,sortable:false,align:"center"},
	{name:"setup",label:"配&nbsp;置",width:50,sortable:false,align:"center"}
		],
	pager:"#userListPager",	
	sortname:"user_id",
	sortorder:"asc",
	//rowNum:-1,
	rowNum:20,
	rowList:[10,20,50],
	viewrecords:true,
	gridview:true,
	pgbuttons:true,
	pginput:true,
	prmNames:{
		page:"pageNo",//表示请求页码的参数名称
		rows:"rows",//表示请求行数的参数名称
		totalrows:"totalrows",//表示需从Server得到总共多少行数据的参数名称，参见jqGrid选项中的rowTotal
			search:"search",//表示是否是搜索请求的参数名称
			sort:"sortName",//表示用于排序的列名的参数名称
		order:"sortOrder"//表示采用的排序方式的参数名称
		},
		jsonReader:{
	root:"contents",
	page:"pageNo",
	total:"totalPages",
	records:"totalRecords",
	id:"pageNo",
	repeatitems:false
	},
	gridComplete:function(){//在此事件中循环为每一行添加详细信息		
		varids=$(this).jqGrid('getDataIDs');
			for(vari=0;i<ids.length;i++){
				varid=ids[i];
				varsetupstr=null;
				setupstr="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/user_modify.gif'title='修改'style='cursor:pointer;'onclick='modifyUserIn(this.id);'/>&nbsp;&nbsp;";
				setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/user_check.gif'title='查看'style='cursor:pointer;'onclick='checkUser(this.id);'/>&nbsp;&nbsp;";
				/*******test******/
				setupstr+="<inputid='"+id+"'height:12px;width:20px;'type='button'value='编辑'onclick='selectEditRow(this.id);'/>";
				setupstr+="<inputid='"+id+"'height:12px;width:20px;'type='button'value='保存'onclick='saveEditRow(this.id);'/>";
				/*************/
				varrowData=$(this).jqGrid('getRowData',id);
				if(rowData.status=="normal"){
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/reset.gif'title='恢复密码'style='cursor:pointer;'onclick='recoverUserPassIn(this.id);'/>&nbsp;&nbsp;";
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/lockUser.gif'title='冻结'style='cursor:pointer;'onclick='lockUserCF(this.id);'/>&nbsp;&nbsp;";
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/expireUser.gif'title='废弃'style='cursor:pointer;'onclick='expireUserCF(this.id);'/>&nbsp;&nbsp;";
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/user_del.gif'title='删除'style='cursor:pointer;'onclick='delUserCF(this.id);'/>";
				}elseif(rowData.status=="locked"){
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/unlockUser.gif'title='解冻'style='cursor:pointer;'onclick='unLockUserCF(this.id);'/>";
				}elseif(rowData.status=="expired"){
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/recoverUser.gif'title='启用'style='cursor:pointer;'onclick='recoverUserCF(this.id);'/>&nbsp;&nbsp;";
					setupstr+="<imgid='"+id+"'src='"+golbal_context+"/application/template/themes/base/images/user_del.gif'title='删除'style='cursor:pointer;'onclick='delUserCF(this.id);'/>";
				}
				$(this).jqGrid("setCell",id,"setup",setupstr,{'padding':'2px000'});
			}
			varbodyObj=document.getElementById('main-content');
			if(bodyObj.scrollHeight>bodyObj.clientHeight||bodyObj.offsetHeight>bodyObj.clientHeight){
				$("#main-content.toolBar").css('width',$(this).width()-12);
			}
},
		onSelectRow:function(id){
		if(id&&id!==lastsel){
		$('#userList').restoreRow(lastsel);
		$('#userList').editRow(id,true);
		lastsel=id;
		}
	},
	editurl:golbal_context+"/system/user/edit.do",
	});
	
	//先定义navGrid，才能使用inlineNav
$('#userList').jqGrid('navGrid','#userListPager',{
edit:false,
add:false,
del:false,
search:false
});
$("#userList").jqGrid("inlineNav","#userListPager",{
	edit:true,
	editicon:"ui-icon-pencil",
	add:false,
	addicon:"ui-icon-plus",
	save:true,
	saveicon:"ui-icon-disk",
	cancle:true,
	cancleicon:"ui-icon-cancle",
	refresh:false,
	alerttext:"请选择需要操作的数据行!",//当未选中任何行而点击编辑、删除、查看按钮时，弹出的提示信息
editParams:{
keys:false,
oneditfunc:null,
successfunc:function(val){
if(val.responseText!=""){
alert(val.responseText);
$(this).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
}
},
url:'/test.do',
extraparam:{
passedId:function(){
varsel_id=$('#userList').jqGrid('getGridParam','selrow');
varvalue=$('#userList').jqGrid('getCell',sel_id,'userId');
returnvalue;
}
},
aftersavefunc:null,
errorfunc:null,
afterrestorefunc:null,
restoreAfterError:true,
mtype:"POST"
}/*,
addParams:{
useDefValues:true,
addRowParams:{
keys:true,
extraparam:{},
//oneditfunc:function(){alert();},
successfunc:function(val){
if(val.responseText!=""){
alert(val.responseText);
$(this).jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
}
}
}
}*/
}
);

	//查询下拉列表初始化
	$.post(golbal_context+"/system/user/info.do",function(data){
		domsLoadData("query_form",data);
	});
	//功能配置信息对话框
	$("#userDialog").dialog({
		title:'增加用户',
		autoOpen:false,
		width:'auto',
		//height:550,
		modal:true,
		resizable:true,
		show:'fade',
		hide:'fade',
		close:function(){
			$(this).empty();
		}
	});		
	
	//导入弹窗
	$("#importDialog").dialog({
		autoOpen:false,
		width:'500',
		height:'400',
		modal:true,
		resizable:true,
		show:'fade',
		hide:'fade',
		buttons:{
			"校验":validateExcel,
			"确定":importExcel,
			"取消":function(){
				$(this).dialog("close");
			}
		},
		close:function(){
			$("#importDialog").empty();
		}
	});
	
	initConfirmDialog("confirmDialog");
	initAlertDialog("alertDialog");
});	

//保存当前选择的行Id
varselectId="";
vareditFlag=false;
functionselectEditRow(id){
	$('#userList').editRow(id,true);
	editFlag=true;
}

functionsaveEditRow(id){
	//$('#userList').saveRow(id);//配合editurl使用
	//	varsel_id=$('#userList').jqGrid('getGridParam','selrow');
		varsel_id=id;
		varrowData=$("#userList").jqGrid("getRowData",sel_id);
		//rowData.userName="test";看来只能reload了，因为不是简单的文本而是一个新的input不能直接赋值
		//$('#userList').jqGrid('setRowData',sel_id,rowData);
	selectId=id;
	if(editFlag==true){
		
	}	
}





$(function () { 
//获取class为caname的元素 
$(".caname").click(function () { 
var td = $(this); 
var txt = $.trim(td.text()); 
var input = $("<input type='text'value='" + txt + "'/>"); 
td.html(input); 
input.click(function () { return false; }); 
//获取焦点 
input.trigger("focus"); 
//文本框失去焦点后提交内容，重新变为文本 
input.blur(function () { 
var newtxt = $(this).val(); 
//判断文本有没有修改 
if (newtxt != txt) { 
td.html(newtxt); 

//不需要使用数据库的这段可以不需要 

//var Order_Id = $("#ID_Order").text(); 
var updateCol = $.trim(td.prev().attr("id"));//我重点要说的是着一句：td.prev();表示本td的上一个td。这句代码的意思是你所点击的td的上一个td的id（如果不明白可以看前面的03.aspx页面）。 
//ajax异步更改数据库,加参数date是解决缓存问题 
url = "../test/03.ashx?caname=" + newtxt + "&updateCol=" + updateCol + "&date=" + new Date(); 




//使用get()方法打开一个一般处理程序，data接受返回的参数（在一般处理程序中返回参数的方法 context.Response.Write("要返回的参数");） 
//数据库的修改就在一般处理程序中完成 
$.get(url, function (data) { 
// if (data == "1") { 
// alert("该类别已存在！"); 
// td.html(txt); 
// return; 
// } 
// alert(data); 
alert("修改成功"); 
td.html(newtxt); 
}); 
