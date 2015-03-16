package com.bupt.core.system.service.impl;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.bupt.core.security.model.SpringSecurityUser;
import com.bupt.core.system.dao.BusinessRecordMapper;
import com.bupt.core.system.model.BusinessRecord;
import com.bupt.core.system.model.BusinessRecordExample;
import com.bupt.core.system.model.BusinessRecordExample.Criteria;
import com.bupt.core.system.service.BusinessService;

@Service("businessService")
public class BusinessServiceImpl implements BusinessService{

	@Resource(name="businessRecordMapper")
	private BusinessRecordMapper businessRecordMapper;

	private final Log log = LogFactory.getLog(getClass());
	private boolean debug = log.isDebugEnabled();
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#deleteByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return 0;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#insert(java.lang.Object)
	 */
	@Override
	public int insert(BusinessRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#insertSelective(java.lang.Object)
	 */
	@Override
	public int insertSelective(BusinessRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#selectByPrimaryKey(java.lang.Integer)
	 */
	@Override
	public BusinessRecord selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#updateByPrimaryKeySelective(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKeySelective(BusinessRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#updateByPrimaryKey(java.lang.Object)
	 */
	@Override
	public int updateByPrimaryKey(BusinessRecord record) {
		// TODO Auto-generated method stub
		return 0;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#getTotalRecords(javax.servlet.http.HttpServletRequest, java.lang.Boolean)
	 */
	@Override
	public int getTotalRecords(HttpServletRequest request, Boolean search) {
		BusinessRecordExample ue = new BusinessRecordExample();
		Criteria criteria = null;
		if (search) {
			criteria = addCriteria(request, ue);
		}
		
		if(SecurityContextHolder.getContext().getAuthentication()!=null&&(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser"))){
			SpringSecurityUser userDetails= (SpringSecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getUserType().equals("prouser")){
				if(criteria == null ) ue.createCriteria().andDataOriginEqualTo(userDetails.getDepartment().getName());
				else criteria.andDataOriginEqualTo(userDetails.getDepartment().getName());
			}
		}
		return businessRecordMapper.countByExample(ue);
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.base.service.BaseService#listResults(int, int, java.lang.String, java.lang.String, javax.servlet.http.HttpServletRequest, java.lang.Boolean)
	 */
	@Override
	public List<BusinessRecord> listResults(int start, int limit, String sortName,
			String sortOrder, HttpServletRequest request, Boolean search) {
		BusinessRecordExample ue = new BusinessRecordExample();
		ue.setOrderByClause(sortName + " " + sortOrder);
		ue.setStart(start);
		ue.setLimit(limit);
		Criteria criteria = null;
		if (search) {
			criteria = addCriteria(request, ue);
		}
		
		if(SecurityContextHolder.getContext().getAuthentication()!=null&&(!SecurityContextHolder.getContext().getAuthentication().getPrincipal().equals("anonymousUser"))){
			SpringSecurityUser userDetails= (SpringSecurityUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			if(userDetails.getUserType().equals("prouser")){
				if(criteria == null ) ue.createCriteria().andDataOriginEqualTo(userDetails.getDepartment().getName());
				else criteria.andDataOriginEqualTo(userDetails.getDepartment().getName());
			}
		}

		/* End */
		List<BusinessRecord> bList = businessRecordMapper.selectByExample(ue);

		return bList;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#insertBusinessRecord(com.bupt.core.system.dto.BusinessAddForm)
	 */
	@Override
	public boolean insertBusinessRecord(BusinessRecord businessRecord) {
		
		boolean result = true;
		try{
			businessRecordMapper.insertSelective(businessRecord);
		} catch (Exception e) {
			result = false;
		}
		
		return result;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#validate(java.lang.String, java.lang.String)
	 */
	@Override
	public boolean validate(String recordname, String password) {
		// TODO Auto-generated method stub
		return false;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#deleteBusiness(java.lang.String)
	 */
	@Override
	public boolean deleteBusiness(String recordId) {
		boolean result = true;
		try{
			businessRecordMapper.deleteByPrimaryKey(Integer.parseInt(recordId));
		} catch (Exception e) {
			result = false;
		}
		return result;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#validateExist(java.lang.String)
	 */
	@Override
	public BusinessRecord validateExist(String recordName) {
		// TODO Auto-generated method stub
		return null;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#getBusinessInfo(java.lang.String)
	 */
	@Override
	public BusinessRecord getBusinessInfo(String recordId) {
		// TODO Auto-generated method stub
		return null;
	}
	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#getInfoForCheck(java.lang.String)
	 */
	@Override
	public BusinessRecord getInfoForCheck(String recordId) {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.bupt.core.system.service.BusinessService#updateBusinessInfo(com.bupt.core.system.dto.BusinessModifyForm)
	 */
	@Override
	public boolean updateBusinessInfo(BusinessRecord businessRecord) {
		boolean result = true;
		try{
			businessRecordMapper.updateByPrimaryKeySelective(businessRecord);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}
	
	private Criteria addCriteria(HttpServletRequest request, BusinessRecordExample ue) {
		String rId = request.getParameter("recordId");
		Integer recordId = null;
		if (rId != null && !"".equals(rId)) recordId = Integer.parseInt(rId);
		String name = request.getParameter("customerName");
		String cSum = request.getParameter("contractSum");
		String dataOrigin = request.getParameter("dataOrigin");
		String dataVersion = request.getParameter("dataVersion");
		String contractLast = request.getParameter("contractLast");
		String dataShare = request.getParameter("dataShare");
		
		Criteria criteria = ue.createCriteria();
		if (rId != null && !"".equals(rId))
			criteria.andRecordIdEqualTo(recordId);
		if (name != null && !"".equals(name))
			criteria.andCustomerNameLike("%"+name+"%");
		if (cSum != null && !"".equals(cSum))
			criteria.andContractSumLike("%"+cSum+"%");
		if (dataOrigin != null && !"".equals(dataOrigin))
			criteria.andDataOriginLike("%"+dataOrigin+"%");
		if (dataVersion != null && !"".equals(dataVersion))
			criteria.andDataVersionLike("%"+dataVersion+"%");
		if (contractLast != null && !"".equals(contractLast))
			criteria.andContractLastLike("%"+contractLast+"%");
		if (dataShare != null && !"".equals(dataShare))
			criteria.andDataShareLike("%"+dataShare+"%");
		return criteria;
	}

	@Override
	public boolean batchUpdateBusiness(String cusNameNew, String conSumNew,String cusNameOld, String conSumOld) {
		boolean result = true;
		try{
			BusinessRecordExample businessRecordExample = new BusinessRecordExample();
			businessRecordExample.createCriteria().andCustomerNameEqualTo(cusNameOld).andContractSumEqualTo(conSumOld);
			BusinessRecord businessRecord = new BusinessRecord();
			businessRecord.setCustomerName(cusNameNew);
			businessRecord.setContractSum(conSumNew);
			businessRecordMapper.updateByExampleSelective(businessRecord, businessRecordExample);
		} catch (Exception e) {
			result = false;
		}
		return result;
	}
}
