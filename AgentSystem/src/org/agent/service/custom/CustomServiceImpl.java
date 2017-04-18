package org.agent.service.custom;

import java.util.List;

import org.agent.dao.contact.ContactMapper;
import org.agent.dao.custom.CustomMapper;
import org.agent.pojo.Contact;
import org.agent.pojo.Custom;
import org.springframework.beans.factory.annotation.Autowired;

public class CustomServiceImpl implements CustomService {

	@Autowired
	private CustomMapper mapper;
	@Autowired
	private ContactMapper contactMapper;
	
	@Override
	public List<Custom> getList(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getList(custom);
	}

	@Override
	public Custom getCustomById(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getCustomById(custom);
	}

	@Override
	public List<Custom> getCustomBySearch(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getCustomBySearch(custom);
	}

	@Override
	public int modifyCustom(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyCustom(custom);
	}

	@Override
	public int addCustom(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addCustom(custom);
	}

	@Override
	public int deleteCustom(Custom custom)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteCustom(custom);
	}
	
	public boolean hl_addCustomContact(Custom custom,List<Contact> contactList) throws Exception{
			int addCustomId = 0;
			mapper.addCustom(custom);
			addCustomId = mapper.getAddCustomId();
			if(null != contactList && contactList.size() > 0 && addCustomId != 0){
				for(int i = 0; i <  contactList.size(); i++){
					if(null != contactList.get(i) 
							&& null != contactList.get(i).getContactName() && !contactList.get(i).getContactName().equals("")
							&& null != contactList.get(i).getContactTel() && !contactList.get(i).getContactTel().equals("")){
						contactList.get(i).setCustomId(addCustomId);
						contactMapper.addContact(contactList.get(i));
					}
				}
			}
		return true;
	}

	@Override
	public int getAddCustomId()  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getAddCustomId();
	}

	@Override
	public int modifyCustomStatus(Custom custom) throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyCustomStatus(custom);
	}

	@Override
	public boolean hl_modifyCustomContact(Custom custom,
			List<Contact> contactList) throws Exception {
		// TODO Auto-generated method stub
		mapper.modifyCustom(custom);
		int cid = custom.getId();
		Contact contact = new Contact();
		contact.setCustomId(cid);
		contactMapper.deleteContact(contact);
		if(null != contactList){
			for(int i = 0; i < contactList.size(); i++){
				if(null != contactList.get(i) 
						&& null != contactList.get(i).getContactName() && !contactList.get(i).getContactName().equals("")
						&& null != contactList.get(i).getContactTel() && !contactList.get(i).getContactTel().equals("")){
					contactList.get(i).setCustomId(cid);
					contactMapper.addContact(contactList.get(i));
				}
			}
		}
		return false;
	}

	@Override
	public int count(Custom custom) throws Exception {
		// TODO Auto-generated method stub
		return mapper.count(custom);
	}

	@Override
	public int isExitCustomName(Custom custom) throws Exception {
		// TODO Auto-generated method stub
		return mapper.isExitCustomName(custom);
	}

}
