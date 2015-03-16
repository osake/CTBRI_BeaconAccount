package com.bupt.core.system.service;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jxl.write.WriteException;

import com.bupt.core.base.service.BaseService;
import com.bupt.core.system.dto.ExportLogForm;
import com.bupt.core.system.dto.LogDTO;
import com.bupt.core.system.model.Log;

public interface LogService extends BaseService<Log,LogDTO>{
	
	int insert(Log record);

	boolean exportLog(ExportLogForm logForm, HttpServletRequest request, HttpServletResponse response)throws IOException, ServletException, WriteException;

}
