package com.absi.ims.controller;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.runners.MockitoJUnitRunner;
import org.springframework.ui.ExtendedModelMap;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.mock.IMSUserMock;
import com.absi.ims.service.IMSUserService;

@RunWith(MockitoJUnitRunner.class)
public class IMSUserControllerTest {

	@Mock
	private IMSUserService imsUserService;

	@InjectMocks
	private IMSUserController imsUserController = new IMSUserController();

	@Test
	public void shouldLoadIMSUserList() {
		// given
		ExtendedModelMap model = new ExtendedModelMap();

		// when
		when(imsUserService.getAllIMSUsers()).thenReturn(IMSUserMock.generateIMSUserList());
		String page = imsUserController.loadIMSUserList(model);

		// then
		verify(imsUserService).getAllIMSUsers();
		assertEquals("imsUserList", page);
	}

	@Test
	public void shouldLoadIMSUserForm() {
		// given
		ExtendedModelMap model = new ExtendedModelMap();

		// when
		String page = imsUserController.loadIMSUserForm(model);
		IMSUser imsUser = (IMSUser) model.get("imsUser");

		// then
		assertNotNull(imsUser);
		assertEquals("imsUserForm", page);
	}

}
