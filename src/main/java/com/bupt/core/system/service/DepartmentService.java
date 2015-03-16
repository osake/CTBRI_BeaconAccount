package com.bupt.core.system.service;
import java.util.List;

import com.bupt.core.base.service.BaseService;
import com.bupt.core.system.dto.DepartmentDTO;
import com.bupt.core.system.model.Department;
import com.bupt.core.system.model.DepartmentAndInfo;
import com.bupt.core.system.model.DepartmentTeacherTree;
import com.bupt.core.system.model.DepartmentUserTree;
public interface DepartmentService extends BaseService <Department,DepartmentDTO> {
	public List<Department> getDepartmentTree(String types);
	
	public Department getDepartmentTreeById(int id);
	
	public String deleteDepartment(int id);
	
	public String modifyDepartment(DepartmentAndInfo record);
	
	public String addDepartment(Department record);
	
	public List<DepartmentUserTree> selectTree();
	
	public List<DepartmentTeacherTree> selectTeacherTree();

	public boolean checkUserBydeId(Integer departmentId);
	
	public List<Department> getAllTeachingAndResearch();
}
