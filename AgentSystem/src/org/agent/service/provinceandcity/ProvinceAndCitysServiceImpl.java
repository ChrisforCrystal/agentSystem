package org.agent.service.provinceandcity;

import java.util.List;

import org.agent.dao.provinceandcity.ProvinceAndCitysMapper;
import org.agent.pojo.Area;
import org.agent.pojo.City;
import org.agent.pojo.Province;
import org.springframework.beans.factory.annotation.Autowired;

public class ProvinceAndCitysServiceImpl implements ProvinceAndCitysService {

	@Autowired
	private ProvinceAndCitysMapper mapper;
	
	@Override
	public List<Province> getProvinceList()  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getProvinceList();
	}

	@Override
	public List<City> getCitys(Province province)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getCitys(province);
	}

	@Override
	public List<Area> getAreas(City city)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAreas(city);
	}

}
