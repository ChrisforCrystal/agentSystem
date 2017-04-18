package org.agent.service.systemconfig;

import java.util.List;

import org.agent.dao.systemconfig.SystemConfigMapper;
import org.agent.pojo.SystemConfig;
import org.springframework.beans.factory.annotation.Autowired;

public class SystemConfigServiceImpl implements SystemConfigService {

	@Autowired
	private SystemConfigMapper mapper;
	
	@Override
	public List<SystemConfig> getSystomConfigs(SystemConfig systemConfig)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getSystomConfigs(systemConfig);
	}

	@Override
	public int addSystemConfig(SystemConfig systemConfig)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addSystemConfig(systemConfig);
	}

	@Override
	public int modifySystemConfig(SystemConfig systemConfig)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifySystemConfig(systemConfig);
	}

	@Override
	public int deleteSystemConfig(SystemConfig systemConfig)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteSystemConfig(systemConfig);
	}

	@Override
	public int maxTypeValueByType(int type)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.maxTypeValueByType(type);
	}

	@Override
	public List<SystemConfig> getSystomConfigsIsStart(SystemConfig systemConfig)
			throws Exception {
		// TODO Auto-generated method stub
		return mapper.getSystomConfigsIsStart(systemConfig);
	}

	@Override
	public int isPeatConfig(SystemConfig systemConfig) throws Exception {
		// TODO Auto-generated method stub
		return mapper.isPeatConfig(systemConfig);
	}

}
