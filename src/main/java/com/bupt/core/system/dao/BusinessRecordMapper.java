package com.bupt.core.system.dao;

import com.bupt.core.system.model.BusinessRecord;
import com.bupt.core.system.model.BusinessRecordExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BusinessRecordMapper {
    int countByExample(BusinessRecordExample example);

    int deleteByExample(BusinessRecordExample example);

    int deleteByPrimaryKey(Integer recordId);

    int insert(BusinessRecord record);

    int insertSelective(BusinessRecord record);

    List<BusinessRecord> selectByExample(BusinessRecordExample example);

    BusinessRecord selectByPrimaryKey(Integer recordId);

    int updateByExampleSelective(@Param("record") BusinessRecord record, @Param("example") BusinessRecordExample example);

    int updateByExample(@Param("record") BusinessRecord record, @Param("example") BusinessRecordExample example);

    int updateByPrimaryKeySelective(BusinessRecord record);

    int updateByPrimaryKey(BusinessRecord record);
    
	/**
	 * 百万级分页优化
	 */
	public List<BusinessRecord> listResults(@Param("start") int start, @Param("limit") int limit, @Param("sortName") String sortName, @Param("sortOrder") String sortOrder, @Param("BusinessRecordExample") BusinessRecordExample example);

}