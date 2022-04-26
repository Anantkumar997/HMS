package com.ctrl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dao.AssetDao;

@Controller
public class HomeCtrl {

	@Autowired
	AssetDao assetDao;

	@RequestMapping("/home")
	public String home(Model m) {

		m.addAttribute("page", "home");
		return "home";
	}

	

	@RequestMapping("/login")
	public String login(Model m) {
		m.addAttribute("page", "login");
		return "home";
	}
}
