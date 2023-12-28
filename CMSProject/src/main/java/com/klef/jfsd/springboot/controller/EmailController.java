package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;

@Controller
public class EmailController
{

	@Value("${spring.mail.username}") 
    private String adminMail;
	
}
