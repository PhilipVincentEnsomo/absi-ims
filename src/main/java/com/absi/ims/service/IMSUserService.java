package com.absi.ims.service;

import java.util.List;

import com.absi.ims.domain.IMSUser;

public interface IMSUserService {

	void addIMSUser(IMSUser imsUser);

	List<IMSUser> getAllIMSUsers();

}
