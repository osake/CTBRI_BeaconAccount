<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="section">
	<div>
	<h1>修改机构</h1>
	</div>
	<form id="modifyOrganForm"  method="post">
	<div class="portlert-form-list">
 		<div class="portlert-form-row" style="display:none;">
			<label class="portlert-form-label"><em>*</em>机构编号：</label>
			<div class="portlert-form-collection">
				<input id="modify_dep" name="departmentId" type="text" class="portlert-form-input-field" readOnly="readOnly" onfocus="this.blur()"/>
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>
		<div class="portlert-form-row" style="display:none;">
			<label class="portlert-form-label"><em>*</em>信息编号：</label>
			<div class="portlert-form-collection">
				<input id="modify_dep_info" name="departmentInfoId" type="text" class="portlert-form-input-field" readOnly="readOnly" onfocus="this.blur()"/>
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>
		<div class="portlert-form-row">
			<label class="portlert-form-label"><em>*</em>机构名称：</label>
			<div class="portlert-form-collection">
				<input id="modify_name" name="name" type="text" class="portlert-form-input-field" />
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>	
		<div class="portlert-form-row">
		<label class="portlert-form-label"><em>*</em>上线状态：</label>
			<div class="portlert-form-collection">
				<input  id="modify_status" name="status" class="portlert-form-input-field" type="text" />	
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>
		<div class="portlert-form-row">
			<label class="portlert-form-label"><em>*</em>上线版本：</label>
			<div class="portlert-form-collection">
				<input id="modify_version" name="dataVersion" type="text" class="portlert-form-input-field"/>
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>	
		<div class="portlert-form-row">
			<label class="portlert-form-label"><em>*</em>样本数量：</label>
			<div class="portlert-form-collection">
				<input id="modify_capacity" name="capacity" type="text" class="portlert-form-input-field"/>
				<span class="portlert-form-msg-alert">&nbsp;</span>
			</div>
		</div>	
		<div>
			<input type="submit" id="subButt" class="depSub" value="确认"/>
		</div>
	</div>
	</form>
</div>	


