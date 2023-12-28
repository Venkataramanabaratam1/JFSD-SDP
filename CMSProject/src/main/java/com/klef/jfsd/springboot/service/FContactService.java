package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.FContact;

public interface FContactService 
{
	public String addFContact(FContact fc);
	public void sendEmail(String fromMail, String adminMail, String subject, String text);
	
	public void sendEmailAd(String fromMail, String adminMail, String subject, String text);
}
