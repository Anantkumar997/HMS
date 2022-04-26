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

import com.dao.PatientDao;
import com.entities.Doctor;
import com.entities.Patient;

@Controller
public class PatientCtrl {

	@Autowired
	PatientDao patientDao;

	@RequestMapping("/patients")
	public String patients(Model m) {
		m.addAttribute("page", "patients");
		List<Patient> list = this.patientDao.getAll();
		m.addAttribute("patients", list);
		return "home";
	}

	@RequestMapping("/addPatient")
	public String addPatient(Model m) {
		Patient ps = new Patient();
		m.addAttribute("page", "addPatient");
		m.addAttribute("patient", ps);
		return "home";
	}

	@RequestMapping(value = "/savePatient", method = RequestMethod.POST)
	public RedirectView savePatient(@ModelAttribute("patient") Patient ps, Model m, HttpServletRequest request) {
		this.patientDao.save(ps);
		System.out.println(ps);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/patients");
		m.addAttribute("msg", "successfully added...");
		return redirectView;
	}

	// delete handler
	@RequestMapping("patients/delete/{pId}")
	public RedirectView deletePatient(@PathVariable("pId") int pId, HttpServletRequest request) {
		this.patientDao.delete(pId);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/patients");
		return redirectView;
	}

	@RequestMapping("patients/update/{pId}")
	public String update(@PathVariable("pId") int pId, Model m) {
		Patient patient = this.patientDao.getPatient(pId);
		m.addAttribute("patient", patient);
		return "patientUpdateForm";
	}
}
