package com.rw.web.controller;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

@Controller
public class SampleController extends AbstractController {

	@Override
	@RequestMapping("/sample")
	protected ModelAndView handleRequestInternal(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		mav.addObject("controller", SampleController.class.getName() + "SampleController");
		mav.addObject("message", "Hello World!");
		ServletContext context = getServletContext();
		mav.addObject("servletContext", context);
		return mav;
	}
}
