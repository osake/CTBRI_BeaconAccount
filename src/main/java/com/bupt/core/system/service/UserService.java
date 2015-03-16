package com.bupt.core.system.service;

import java.io.InputStream;
import java.util.List;

import com.bupt.core.base.service.BaseService;
import com.bupt.core.system.dto.DepartmentPrivilegeDTO;
import com.bupt.core.system.dto.UserAddForm;
import com.bupt.core.system.dto.UserCheckForm;
import com.bupt.core.system.dto.UserDTO;
import com.bupt.core.system.dto.UserModifyForm;
import com.bupt.core.system.model.Department;
import com.bupt.core.system.model.Role;
import com.bupt.core.system.model.User;
import com.bupt.core.system.model.UserInfo;

public interface UserService extends BaseService<User,UserDTO>{

	boolean validate(String username, String password);
	
	
	boolean insertUserAndRoles(UserAddForm userAddForm);
	
	boolean updateUserAndRoles(UserModifyForm userModifyForm);

	boolean deleteUser(String userId);
	
	boolean recoverUserPass(String userId);
	
	List<Role> getAllRoles();
	
	List<User> getUsersByRoleName(String roleName);

	List<Department> getAllDepartments();

	String  validateExcel(InputStream is, String sessionId);
	
	String[]  importExcel(String sessionId);
	
	User getUserByLoginName(String loginName);
	/**
	 * 检查用户名是否存在
	 * @param loginName
	 * @return
	 * @author 李彤 2013-8-20 下午3:05:50
	 */
	User validateExist(String loginName);
	
	UserModifyForm getUserRolesAndInfo(String userId);

	UserCheckForm getInfoForCheck(String userId);

	/**
	 * @param userLoginName
	 * @param newPassWord
	 * @return
	 * @author 贺群 2013-11-9 下午2:04:32
	 */
	boolean changePassword(String userLoginName, String newPassWord);

	/**
	 * @param userId
	 * @return
	 * @author 贺群 2013-11-10 下午1:40:04
	 */
	boolean lockUser(String userId);

	/**
	 * @param userId
	 * @return
	 * @author 贺群 2013-11-10 下午1:40:10
	 */
	boolean expireUser(String userId);

	/**
	 * @param userId
	 * @return
	 * @author 贺群 2013-11-10 下午3:24:21
	 */
	boolean unLockUser(String userId);

	/**
	 * @param userId
	 * @return
	 * @author 贺群 2013-11-10 下午3:24:24
	 */
	boolean recoverUser(String userId);
	
	List<DepartmentPrivilegeDTO> getUserByCriteria(String privilegeId);

	UserDTO validatePNExist(String permitNum);	
	boolean insertUserInfo(UserInfo ui);
	boolean updateUserInfo(UserInfo ui);
		
	//导入用户时，导入角色
    boolean insertUserRole(Integer userId,String type);


	/**
	 * @param originalPw
	 * @return
	 * @author 贺群 2014-3-9 上午10:09:05
	 */
	boolean checkOriginalPW(String originalPw);
}
