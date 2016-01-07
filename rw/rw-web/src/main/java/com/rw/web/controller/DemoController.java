package com.rw.web.controller;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DemoController {
	private static Logger log = Logger.getLogger(DemoController.class);
	
	@RequestMapping("/index")
	public String index(){
		log.debug("Received request to show index page");
		return "index";
	}
	
	@RequestMapping(value="get",method=RequestMethod.GET)
	public String get(HttpServletRequest request){
		Enumeration<String> parNames = request.getParameterNames();
		log.debug("接收到的参数：" +parNames);
		if(parNames != null && parNames.hasMoreElements()){
			while(parNames.hasMoreElements()){
				String name = parNames.nextElement();
				String value = request.getParameter(name);
				System.out.println("接收到的参数["+name+"]["+value+"]");
			}
		}
		return "index";
	}
}
