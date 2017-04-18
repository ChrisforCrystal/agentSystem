package org.agent.service.function;

import java.util.List;

import org.agent.dao.function.FunctionMapper;
import org.agent.pojo.Function;
import org.springframework.beans.factory.annotation.Autowired;

public class FunctionServiceImpl implements FunctionService {
	
	@Autowired
	private FunctionMapper mapper;
	@Override
	public List<Function> getFunctionList()  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getFunctionList();
	}
	@Override
	public Function getFunctionById(Function function) throws Exception {
		// TODO Auto-generated method stub
		return mapper.getFunctionById(function);
	}
	@Override
	public List<Function> getMenuFunction() throws Exception {
		// TODO Auto-generated method stub
		return mapper.getMenuFunction();
	}

}
