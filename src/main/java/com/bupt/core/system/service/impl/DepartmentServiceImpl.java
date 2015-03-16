package com.bupt.core.system.service.impl;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.bupt.core.system.dao.DepartmentMapper;
import com.bupt.core.system.dao.UserMapper;
import com.bupt.core.system.dto.DepartmentDTO;
import com.bupt.core.system.model.Department;
import com.bupt.core.system.model.DepartmentAndInfo;
import com.bupt.core.system.model.DepartmentExample;
import com.bupt.core.system.model.DepartmentTeacherTree;
import com.bupt.core.system.model.DepartmentUserTree;
import com.bupt.core.system.model.UserExample;
import com.bupt.core.system.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{
	@Resource(name="departmentMapper")
	private DepartmentMapper departmentMapper;

	@Resource(name="userMapper")
	private UserMapper userMapper;
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return departmentMapper.deleteByPrimaryKey(id);
	}
	@Override
	public int insert(Department record) {
		return departmentMapper.insert(record);
	}

	@Override
	public int insertSelective(Department record) {
		return departmentMapper.insertSelective(record);
	}

	@Override
	public Department selectByPrimaryKey(Integer id) {
		return departmentMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(Department record) {
		return updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Department record) {
		return updateByPrimaryKey(record);
	}

	
	@Override
	public List<Department> getDepartmentTree(String types) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public Department getDepartmentTreeById(int id) {
		return departmentMapper.selectByPrimaryKey(id);
	}
	@Override
	public String deleteDepartment(int id) {
		String result;
		try{
			Department temp = departmentMapper.selectByPrimaryKey(id);
			Integer parentId = temp.getParentId();
			//删除节点(hide)
			temp.setLevel("-1");
			temp.setParentId(null);
			departmentMapper.updateByPrimaryKey(temp);//数据库层级的级联，用户在此部门下的会被直接删除
			//判断是否父节点要为叶节点
			boolean flag = false;
			Department deParent = departmentMapper.selectByPrimaryKey(parentId);
			List<DepartmentAndInfo> listD = departmentMapper.getDepartmentList();
			for (Iterator<DepartmentAndInfo> iterator = listD.iterator(); iterator.hasNext();) {
				DepartmentAndInfo department = (DepartmentAndInfo) iterator.next();
				if(department.getParentId()==deParent.getDepartmentId()){
					flag = true;
					break;
				}
			}
			if(flag == false){
				deParent.setIsLeaf(true);
				departmentMapper.updateByPrimaryKey(deParent);
			}
			result = "success";
		}catch(Exception e){
			e.printStackTrace();
			result = "删除"+"节点失败!";
		}
		return result;
	}
	@Override
	public String modifyDepartment(DepartmentAndInfo record) {
		String result;
		try{
			departmentMapper.updateByPrimaryKeySelectiveDep(record);
			if(record.getDepartmentInfoId()==null) {
				departmentMapper.insertDepInfo(record);
			}
			else departmentMapper.updateByPrimaryKeySelectiveDepInfo(record);
			result = "success";
		}catch(Exception e){
			e.printStackTrace();
			result = "failure";
		}
		return result;
	}
	
	
	@Override
	public String addDepartment(Department record) {
		String result;
		try{
			departmentMapper.insert(record);
			//找到父节点并修改属性 lsleaf
			Department deParent = departmentMapper.selectByPrimaryKey(record.getParentId());
			if (deParent.getIsLeaf()==true) {
				deParent.setIsLeaf(false);
				departmentMapper.updateByPrimaryKey(deParent);
			}
			result = "success";
		}catch(Exception e){
			e.printStackTrace();
			result = "删除"+"节点失败!";
		}
		return result;
	}
	@Override
	public int getTotalRecords(HttpServletRequest request, Boolean search) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public List<DepartmentDTO> listResults(int start, int limit,
			String sortName, String sortOrder, HttpServletRequest request,
			Boolean search) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<DepartmentUserTree> selectTree() {
		return departmentMapper.selectTree();
	}
	@Override
	public List<DepartmentTeacherTree> selectTeacherTree() {
		return departmentMapper.selectTeacherTree();
	}
	@Override
	public boolean checkUserBydeId(Integer departmentId) {
		UserExample ue = new UserExample();
		ue.createCriteria().andDepartmentIdEqualTo(departmentId).andStatusNotEqualTo("冻结态");
		int num = userMapper.countByExample(ue);
		if(num==0)
			return false;
		else 
			return true;
	}
	@Override
	public List<Department> getAllTeachingAndResearch() {
		int parentId = this.departmentMapper.selectDepIdByName("研究生学科");
		DepartmentExample de = new DepartmentExample();
	    de.createCriteria().andParentIdEqualTo(parentId);
		return this.departmentMapper.selectByExample(de);
	}

}


