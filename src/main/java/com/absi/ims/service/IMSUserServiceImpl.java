package com.absi.ims.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.absi.ims.dao.IMSUserDao;
import com.absi.ims.domain.IMSUser;

@Service
public class IMSUserServiceImpl implements IMSUserService {

	@Autowired
	private IMSUserDao imsUserDao;

	@Override
	public void addIMSUser(IMSUser imsUser) {
		imsUserDao.save(imsUser);
	}

	@Override
	public List<IMSUser> getAllIMSUsers() {
		return (List<IMSUser>) imsUserDao.findAll();
	}
	
}
