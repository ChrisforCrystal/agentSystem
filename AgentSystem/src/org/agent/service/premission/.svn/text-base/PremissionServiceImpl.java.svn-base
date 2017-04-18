package org.agent.service.premission;

import java.util.List;

import org.agent.dao.premission.PremissionMapper;
import org.agent.pojo.Premission;
import org.springframework.beans.factory.annotation.Autowired;

public class PremissionServiceImpl implements PremissionService {

	@Autowired
	private PremissionMapper mapper;
	
	@Override
	public List<Premission> getList(Premission premission)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getList(premission);
	}

	@Override
	public int addPremission(Premission premission)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addPremission(premission);
	}

	@Override
	public int modifyPremission(Premission premission)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyPremission(premission);
	}

	@Override
	public int deletePremission(Premission premission)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deletePremission(premission);
	}

	@Override
	public boolean hl_delAddPremission(Premission premission,String checkFuncList) throws Exception{
		// TODO Auto-generated method stub
		String[] funcList = null;
		if(!checkFuncList.equals("") && null != checkFuncList){
			funcList = checkFuncList.split(",");
		}
		mapper.deletePremission(premission);
		if(null != funcList && !funcList.equals("")){
			for(int i = 0; i < funcList.length; i++){
				premission.setFunctionId(Integer.valueOf(funcList[i]));
				mapper.addPremission(premission);
			}
		}
		return true;
	}

}
