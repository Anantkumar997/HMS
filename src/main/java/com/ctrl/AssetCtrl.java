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

import com.dao.AssetDao;
import com.entities.Asset;

@Controller
public class AssetCtrl {

	@Autowired
	AssetDao assetDao;

	@RequestMapping("/assets")
	public String assets(Model m) {

		m.addAttribute("page", "assets");
		List<Asset> list = this.assetDao.getAll();
		m.addAttribute("assets", list);
		return "home";
	}

	@RequestMapping("/addAsset")
	public String addAsset(Model m) {
		Asset As = new Asset();
		m.addAttribute("page", "addAsset");
		m.addAttribute("asset", As);
		return "home";
	}

	@RequestMapping(value = "/saveAsset", method = RequestMethod.POST)
	public RedirectView saveAsset(@ModelAttribute("asset") Asset As, Model m, HttpServletRequest request) {
		System.out.println(As);
		this.assetDao.save(As);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/assets");
		m.addAttribute("msg", "successfully added...");
		return redirectView;
	}

	// delete handler
	@RequestMapping("HMS/assets/delete/{id}")
	public RedirectView deleteAsset(@PathVariable("id") int id, HttpServletRequest request) {
		this.assetDao.delete(id);
		RedirectView redirectView = new RedirectView();
		redirectView.setUrl(request.getContextPath() + "/");
		return redirectView;
	}

	@RequestMapping("assets/update/{id}")
	public String update(@PathVariable("id") int id, Model m) {
		Asset asset = this.assetDao.getAsset(id);
		m.addAttribute("asset", asset);
		return "assetUpdateForm";
	}
}
