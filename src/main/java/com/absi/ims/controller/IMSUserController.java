package com.absi.ims.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.service.IMSUserService;

@Controller
@RequestMapping(value = "/ims-user")
public class IMSUserController {

	@Autowired
	private IMSUserService imsUserService;

	@RequestMapping(method = RequestMethod.GET)
	public String loadIMSUserList(Model model) {
		model.addAttribute("imsUserList", imsUserService.getAllIMSUsers());
		return "imsUserList";
	}

	public String loadIMSUserForm(Model model) {
		model.addAttribute("imsUser", new IMSUser());
		return "imsUserForm";
	}

}
