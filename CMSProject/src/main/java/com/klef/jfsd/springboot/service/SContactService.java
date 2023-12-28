package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.SContact;

public interface SContactService 
{
	public String addSContact(SContact sc);
	
	public void sendEmail(String fromMail, String adminMail, String subject, String text);
	
	public void sendEmailAd(String fromMail, String adminMail, String subject, String text);
}
