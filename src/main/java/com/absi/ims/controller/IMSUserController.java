package com.absi.ims.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.absi.ims.domain.IMSUser;
import com.absi.ims.service.IMSUserService;

@Controller
@RequestMapping(value = "/ims-user")
public class IMSUserController {

	private static final Logger logger = LoggerFactory.getLogger(IMSUserController.class);

	@Autowired
	private IMSUserService imsUserService;

	@RequestMapping(method = RequestMethod.GET)
	public String loadIMSUserList(Model model) {
		logger.info("Getting all IMS Users");
		model.addAttribute("imsUserList", imsUserService.getAllIMSUsers());
		return "imsUserList";
	}

	@RequestMapping(value = "/new", method = RequestMethod.GET)
	public String loadIMSUserForm(Model model) {
		logger.info("Creating new IMS User");
		IMSUser imsUser = new IMSUser();
		model.addAttribute("imsUser", imsUser);
		return "imsNewUserForm";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/view/{id}")
	public String loadIMSUserForm(Model model, Long id) {
		IMSUser imsUser = imsUserService.getIMSUserById(id);
		model.addAttribute("imsUser", imsUser);
		return "imsViewUserForm";
	}

	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public String saveIMSUser(@Validated @ModelAttribute("imsUser") IMSUser imsUser, BindingResult result, Model model,
			RedirectAttributes redirectAttributes) {
		imsUserService.addIMSUser(imsUser);
		return "redirect:/ims-user";
	}

	@RequestMapping(method = RequestMethod.GET, value = "/delete")
	public String deleteIMSUser(Long id) {
		IMSUser imsUser = imsUserService.getIMSUserById(id);
		imsUserService.deleteIMSUser(imsUser);
		return "redirect:/ims-user";
	}

	@RequestMapping(method = RequestMethod.POST, value = "/update")
	public String updateIMSUser(IMSUser imsUser) {
		IMSUser imsUserToUpdate = imsUserService.getIMSUserById(imsUser.getId());

		imsUser.setCreatedBy(imsUserToUpdate.getCreatedBy());
		imsUser.setCreatedDate(imsUserToUpdate.getCreatedDate());

		imsUserService.updateIMSUser(imsUser);

		return "redirect:/view/" + imsUserToUpdate.getId();
	}

}
