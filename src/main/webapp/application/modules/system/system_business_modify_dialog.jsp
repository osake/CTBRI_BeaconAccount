<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<div class="section">
  	 <form id="businessModifyForm" method="post">
		<div class="portlert-form-list">
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>客户名称：</label>
				<div class="portlert-form-collection">
					<input id="customerName" name="customerName" type="text" class="portlert-form-input-field" />
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>	
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>合同金额：</label>
				<div class="portlert-form-collection">
					<input id="contractSum" name="contractSum" type="text" class="portlert-form-input-field" />
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>	
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>数据来源：</label>
				<div class="portlert-form-collection">
					<select id="dataOrigin" name="organ" class="portlert-form-input-field" >
						<option value=''>--请选择--</option>
	         	    </select>
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>数据版本：</label>
				<div class="portlert-form-collection">
					<input id="dataVersion" name="dataVersion" type="text" class="portlert-form-input-field" />
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>	
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>合同概况：</label>
				<div class="portlert-form-collection">
					<input id="contractLast" name="contractLast" type="text" class="portlert-form-input-field" />
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>	
			<div class="portlert-form-row">
				<label class="portlert-form-label"><em>*</em>数据分成：</label>
				<div class="portlert-form-collection">
					<input id="dataShare" name="dataShare" type="text" class="portlert-form-input-field" />
					<span class="portlert-form-msg-alert">&nbsp;</span>
				</div>
			</div>	
		</div>
	</form>
</div>	