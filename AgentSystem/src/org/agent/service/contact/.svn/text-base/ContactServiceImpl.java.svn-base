package org.agent.service.contact;

import java.util.List;

import org.agent.dao.contact.ContactMapper;
import org.agent.pojo.Contact;
import org.springframework.beans.factory.annotation.Autowired;

public class ContactServiceImpl implements ContactService {
	@Autowired
	private ContactMapper mapper;
	@Override
	public List<Contact> getContactList(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.getContactList(contact);
	}

	@Override
	public int addContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.addContact(contact);
	}

	@Override
	public int modifyContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.modifyContact(contact);
	}

	@Override
	public int deleteContact(Contact contact)  throws Exception{
		// TODO Auto-generated method stub
		return mapper.deleteContact(contact);
	}

}
