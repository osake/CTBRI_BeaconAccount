package com.bupt.core.system.service;

import java.util.List;

import com.bupt.core.base.service.BaseService;
//import com.bupt.core.system.dto.PrivilegeAddForm;
import com.bupt.core.system.dto.PrivilegeDTO;
//import com.bupt.core.system.dto.PrivilegeModifyForm;
import com.bupt.core.system.model.Privilege;

public interface PrivilegeService extends BaseService<Privilege, PrivilegeDTO> {

	public List<Privilege> getPrivilegeTree(String types);

	public Privilege getPrivilegeTreeById(int id);
	
	public String deletePrivilege(int privilegeid);
	
	public String modifyPrivilege(Privilege record);
	
	public String addPrivilege(Privilege record);
	
	public List<Privilege> getPrivilegeIdsUrls();
}
