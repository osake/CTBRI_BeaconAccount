package com.bupt.core.system.service;

import com.bupt.core.base.service.BaseService;
import com.bupt.core.system.model.BusinessRecord;

public interface BusinessService extends BaseService<BusinessRecord,BusinessRecord>{

	boolean insertBusinessRecord(BusinessRecord businessRecord);
	
	boolean validate(String username, String password);
	
	boolean deleteBusiness(String userId);

	BusinessRecord validateExist(String recordName);
	
	BusinessRecord getBusinessInfo(String recordId);

	BusinessRecord getInfoForCheck(String recordId);

	boolean updateBusinessInfo(BusinessRecord businessRecord);

	boolean batchUpdateBusiness(String cusNameNew, String conSumNew,String cusNameOld,String conSumOld);
}
