package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Outer;

public interface OutersContactService 
{
   public String addOuterContact(Outer outer);
	
   public void sendEmail(String fromMail, String adminMail, String subject, String text);
   
   public void sendEmailAd(String fromMail, String adminMail, String subject, String text);
	
}
