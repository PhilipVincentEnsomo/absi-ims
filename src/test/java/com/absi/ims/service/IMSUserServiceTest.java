package com.absi.ims.service;

import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.springframework.util.Assert.notEmpty;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.runners.MockitoJUnitRunner;

import com.absi.ims.dao.IMSUserDao;
import com.absi.ims.domain.IMSUser;
import com.absi.ims.mock.IMSUserMock;

@RunWith(MockitoJUnitRunner.class)
public class IMSUserServiceTest {

	@Mock
	private IMSUserDao imsUserDao;

	@InjectMocks
	private IMSUserService imsUserService = new IMSUserServiceImpl();

	@Test
	public void shouldGetAllIMSUsers() {
		// given
		
		// when
		when(imsUserDao.findAll()).thenReturn(IMSUserMock.generateIMSUserList());
		List<IMSUser> imsUserList = imsUserService.getAllIMSUsers();
		
		// then
		notEmpty(imsUserList);
		verify(imsUserDao).findAll();
	}
	
	@Test
	public void shouldAddImsUserDao() {
		// given
		IMSUser imsUserMock = IMSUserMock.generateIMSUser();

		// when
		imsUserService.addIMSUser(imsUserMock);

		// then
		verify(imsUserDao).save(imsUserMock);
	}
}
