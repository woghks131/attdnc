package gy.attdnc.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import gy.attdnc.admin.common.util.DataMap;


@Controller
public class FrameController extends CommonController {
	@RequestMapping(value="/indexFrame")
	public ModelAndView indexFrame(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("frameset/indexFrame");
		
		return mv;
	}
	
	@RequestMapping(value="/leftFrame")
	public ModelAndView leftFrame(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("frameset/leftFrame");		
	    DataMap ynMap = new DataMap();
	    mv.addObject("info", ynMap);
		return mv;
	}
	
	@RequestMapping(value="/topFrame")
	public ModelAndView topFrame(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("frameset/topFrame");
		
		return mv;
	}
	
	@RequestMapping(value="/bottomFrame")
	public ModelAndView bottomFrame(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("frameset/bottomFrame");
		
		return mv;
	}
	
	@RequestMapping(value="/changeFrame")
	public ModelAndView changeFrame(HttpServletRequest request,HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("frameset/changeFrame");
		
		return mv;
	}
}
