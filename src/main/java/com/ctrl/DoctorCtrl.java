package com.ctrl;

import java.util.Date;
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

import com.dao.DoctorDao;
import com.entities.Doctor;

@Controller
public class DoctorCtrl {

	@Autowired
	DoctorDao doctorDao;

	@RequestMapping("/doctors")
	public String doctors(Model m) {

		m.addAttribute("page", "doctors");
		List<Doctor> list = this.doctorDao.getAll();
		m.addAttribute("doctors", list);
		return "home";
	}

	@RequestMapping("/addDoctor")
	public String addDoctor(Model m) {
		Doctor dr = new Doctor();
		m.addAttribute("page", "addDoctor");
		m.addAttribute("doctor", dr);
		return "home";
	}

	@RequestMapping(value = "/saveDoctor", method = RequestMethod.POST)
	public RedirectView saveDoctor(@ModelAttribute("doctor") Doctor dr, Model m, HttpServletRequest request) {
		dr.setJoinDate(new Date());
		this.doctorDao.save(dr);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/doctors");
		m.addAttribute("msg", "successfully added...");
		System.out.println(dr);
		return redirectView;
	}

	// delete handler
	@RequestMapping("doctors/delete/{dId}")
	public RedirectView deleteDoctor(@PathVariable("dId") int dId, HttpServletRequest request) {
		this.doctorDao.delete(dId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/doctors");
		return redirectView;
	}

	@RequestMapping("doctors/update/{dId}")
	public String update(@PathVariable("dId") int dId, Model m) {
		Doctor doctor = this.doctorDao.getDoctor(dId);
		m.addAttribute("doctor", doctor);
		return "doctorUpdateForm";
	}
}
