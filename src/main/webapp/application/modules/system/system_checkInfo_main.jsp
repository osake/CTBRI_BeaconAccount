<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="../common/init.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" />
	<jsp:include page="../common/meta.jsp" flush="true"/>
	<jsp:include page="../common/style.jsp" flush="true"/>
<title>北京邮电大学数媒学院信息管理系统</title>
<style type="text/css">
	.select_opt{float:left; width:35px; height:100%; margin-left:20px;vertical-align:center;}
	.select_opt p{width:20px; height:13px; margin-top:20px; background:url(<%=templatePath%>/images/arr.gif) no-repeat; cursor:pointer; text-indent:-999em}
	.select_opt p#toright{background-position:2px 0}
	.select_opt p#toleft{background-position:2px -16px}
</style>
</head>

<body id="activity_pane">
<div class="rightSide">
	<div class="top">
    	<div class="left"></div>
        <div class="current">
        	当前位置：&gt; 客户管理
        </div>
    </div>
    <div class="content" id="main-content">
    	<div class="sear" id="query_form"> 
    	   <label>客户名：<input type="text" id="query_name"/></label>
            <label><input type="button" value="查询" class="butt" onclick="query()"/></label>
        </div>
        <div class="toolBar">&nbsp;
            <!-- <input type="button" value="新增" class="new auth" authKey = "business_add"  onclick="addBusinessIn();"/> -->
        </div>
		<table id="businessList"></table>
		<div id="businessListPager"></div>
    </div>
    <div class="bottom">
    	<div class="left"></div>
        <div class="right"><div class="center"></div></div>
    </div>

<!-- 弹窗定义 -->
	<div id="businessDialog">
	</div>
	<!--引入提示告警和确认  -->
	<%@ include file="../common/alert_dialog.jsp" %>
	<%@ include file="../common/confirm_dialog.jsp" %>
	<jsp:include page="../common/script.jsp" flush="true"/>	
	<script type="text/javascript" src="<%=templatePath%>js/system/system_checkInfo_main.js"></script>
</body>
</html>
