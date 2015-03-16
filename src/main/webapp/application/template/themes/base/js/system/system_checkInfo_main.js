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
	      	{name:"customerName",index:"customer_name",label : "客户名称",width:'15%',align:"center",sortable:true},
	      	{name:"contractSum",index:"contract_sum",label : "合同金额",width:'15%',sortable:true,align:"center"},
	      	{name:"dataOrigin",index:"data_origin",label : "数据源",width:'15%',hidden:false,sortable:false,align:"center"},
	      	{name:"dataVersion",index:"data_version",label : "数据版本",width:'15%',sortable:false,align:"center"},
	      	{name:"contractLast",index:"contract_last",label : "合同期限",width:'15%',sortable:false,align:"center"},
	      	{name:"dataShare",index:"data_share",label : "合同金额",width:'15%',sortable:false,align:"center"}
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
			var bodyObj=document.getElementById('main-content');
			if(bodyObj.scrollHeight>bodyObj.clientHeight||bodyObj.offsetHeight>bodyObj.clientHeight){
				$("#main-content .toolBar").css('width',$(this).width()-12);
			}
        }              
  	});

	initConfirmDialog("confirmDialog");
	initAlertDialog("alertDialog");
});	

//查询
function query() {

	var postData = {
		customerName : $("#query_name").val().trim()
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
