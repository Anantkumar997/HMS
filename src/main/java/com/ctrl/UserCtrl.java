package com.ctrl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

import com.dao.UserDao;
import com.entities.Patient;
import com.entities.User;

@Controller
public class UserCtrl {

	@Autowired
	UserDao userDao;

	@RequestMapping("/users")
	public String users(Model m) {
		m.addAttribute("page", "users");
		List<User> list = this.userDao.getAll();
		m.addAttribute("users", list);
		return "home";
	}

	@RequestMapping("/addUser")
	public String addUser(Model m) {
		User user = new User();
		m.addAttribute("page", "addUser");
		m.addAttribute("user", user);
		return "home";
	}

	@RequestMapping(value = "/saveUser", method = RequestMethod.POST)
	public String saveUser(@ModelAttribute("user") User user, Model m) {
		System.out.println(user);
		this.userDao.save(user);
		return "home";
	}

	// delete handler
	@RequestMapping("users/delete/{userId}")
	public RedirectView deleteUser(@PathVariable("userId") int userId, HttpServletRequest request) {
		this.userDao.delete(userId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/users");
		return redirectView;
	}

	@RequestMapping("users/update/{userId}")
	public String update(@PathVariable("userId") int userId, Model m) {
		User user = this.userDao.getPatient(userId);
		m.addAttribute("user", user);
		return "userUpdateForm";
	}
}
