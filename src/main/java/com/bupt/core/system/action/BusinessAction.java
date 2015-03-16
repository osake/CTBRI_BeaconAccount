package com.bupt.core.system.action;

import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bupt.core.base.action.JqGridBaseAction;
import com.bupt.core.system.model.BusinessRecord;
import com.bupt.core.system.service.BusinessService;

/**
 * 
 *  Copyright 2015 CTBRI
 *  All right reserved.
 *	<p></p>
 * @author 贺群
 * @Creat Time : 2015-3-14 下午4:49:46
 * @BusinessAction
 */
@Controller
@RequestMapping("/system/business")
public class BusinessAction extends JqGridBaseAction<BusinessRecord>{
	
//	private final Log log = LogFactory.getLog(getClass());
//	private boolean debug = log.isDebugEnabled();
	
	//将spring 配置文件中的bean 通过setter注入进来
	@javax.annotation.Resource(name="businessService")
	private BusinessService businessService=null;

	
	@Override
	public List<BusinessRecord> listResults(int start, int limit, String sortName,
			String sortOrder, HttpServletRequest request, Boolean search) {
		return this.businessService.listResults(start, limit, sortName, sortOrder, request,search);
	}

	@Override
	public Integer getTotalRecords(HttpServletRequest request, Boolean search) {
		return businessService.getTotalRecords(request,search);
	}	

	/**
	 * @author 贺群
	 * @param loginName 要注册的用户名称
	 * @return 后台验证是否重名，true为未重名，false为重名
	 */
	@RequestMapping("/validateLoginName.do")
	@ResponseBody
	public boolean validateLoginName(@RequestParam(value="loginName") String loginName){
		boolean validate = true;
		BusinessRecord u = this.businessService.validateExist(loginName);
		if(u!=null) validate=false;
		return validate;
	}

	@RequestMapping("/addBusiness.do")
	@ResponseBody
	public boolean addBusinessOut(BusinessRecord businessRecord){
		boolean validate = true;
		if(!this.businessService.insertBusinessRecord(businessRecord)) validate=false;
		return validate;
	}
	
	@RequestMapping("/modifyBusiness.do")
	@ResponseBody
	public boolean modifyBusinessOut(BusinessRecord businessRecord){
		boolean validate = true;
		if(!this.businessService.updateBusinessInfo(businessRecord)) validate=false;
		return validate;
	}
	
	@RequestMapping("/deleteBusiness.do")
	@ResponseBody
	public boolean deleteBusiness(@RequestParam(value="businessId") String businessId){
		boolean validate = true;
		if(!this.businessService.deleteBusiness(businessId)) validate=false;
		return validate;
	}
	
	@RequestMapping("/batchUpdateBusiness.do")
	@ResponseBody
	public boolean batchUpdateBusiness(@RequestParam(value="cusNameNew") String cusNameNew,
															   @RequestParam(value="conSumNew") String conSumNew,
															   @RequestParam(value="cusNameOld") String cusNameOld,
															   @RequestParam(value="conSumOld") String conSumOld){
		boolean validate = true;
		if(!this.businessService.batchUpdateBusiness(cusNameNew,conSumNew,cusNameOld,conSumOld)) validate=false;
		return validate;
	}
	
	public BusinessService getBusinessService() {
		return businessService;
	}

	public void setBusinessService(BusinessService businessService) {
		this.businessService = businessService;
	}
}
