package gy.attdnc.admin.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import gy.attdnc.admin.service.TestServiceI;

@Controller
@RequestMapping(value="test")
public class TestController extends CommonController {

	@Autowired
	TestServiceI testServiceI;
	
	
	
	/*
	 * 테스트 화면 이동
	 */
	@RequestMapping(value="testManage")
	public ModelAndView test(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("test/test");
		
		System.out.println("testManage !");
		
		return mv;
	}
}
