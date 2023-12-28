package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Outer;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.OutersContactService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ClientController 
{	
	@Autowired
	private OutersContactService outersContactService;
	
	@Value("${spring.mail.username}") 
    private String adminMail;
	
	@RequestMapping("/")
	public String main()
	{
		return "index";
	}		   
		
	@GetMapping("index")               
    public ModelAndView index()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("index");
	   return mv;
	}
	
	
	@GetMapping("student/settings")               
    public ModelAndView ssettings()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("student/settings");
	   return mv;
	}
	
	@GetMapping("faculty/settings")               
    public ModelAndView fsettings()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("faculty/settings");
	   return mv;
	}
	
	
	@GetMapping("login")               
    public ModelAndView login()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("login");
	   return mv;
	}
	
	@GetMapping("landing/forgotpassword")               
    public ModelAndView forgotpassword()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("landing/forgotpassword");
	   return mv;
	}
	
	@PostMapping("outerscontact")
	public ModelAndView insertouterscontact(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		
		String msg=null;
		try
		{	
			String name = request.getParameter("name");
			String fromMail = request.getParameter("email");
			String phonenum = request.getParameter("number");
			String subject = request.getParameter("subject");
			String text = request.getParameter("text");
			
			
			Outer outer = new Outer();
			outer.setName(name);
			outer.setFromMail(fromMail);
			outer.setPhoneNo(phonenum);
			outer.setSubject(subject);
			outer.setText(text);
			
			msg = outersContactService.addOuterContact(outer);
			
			outersContactService.sendEmail(adminMail ,fromMail, subject, text); //outer
			outersContactService.sendEmailAd(adminMail, adminMail, subject, text); //admin
			
			mv.setViewName("displaymsg");
			mv.addObject("message",msg);
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			mv.setViewName("displayerror");
			mv.addObject("message",msg);
		}
		return mv;
	}
	
	 @GetMapping("logout")
     public ModelAndView logout()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("index");
	    mv.addObject("message", "Logout Successfully");
	    return mv;
	  }
	 
	}
