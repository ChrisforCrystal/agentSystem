package org.agent.service.logs;

import java.util.List;

import org.agent.dao.logs.LogsMapper;
import org.agent.pojo.Logs;
import org.springframework.beans.factory.annotation.Autowired;

public class LogsServiceImpl implements LogsService {

	@Autowired
	private LogsMapper mapper;
	
	@Override
	public List<Logs> getList(Logs logs)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getList(logs);
	}

	@Override
	public int hladdLogs(Logs logs)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addLogs(logs);
	}

	@Override
	public int count(Logs logs) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(logs);
	}

}
