package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.FContact;
import com.klef.jfsd.springboot.repository.FContactRepository;

@Service
public class FContactServiceImpl implements FContactService
{
	@Autowired
	public FContactRepository fContactRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	public String addFContact(FContact fc) 
	{
		fContactRepository.save(fc);
		return "Faculty Issue Saved Successfully";
	}

	public void sendEmail(String fromMail, String adminMail, String subject, String text) 
	{
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(fromMail);
        mailMessage.setTo(adminMail);
        mailMessage.setSubject("The Question you have asked in the AcadameX mentioning"+subject);
        mailMessage.setText("This is copy of a mail, which you have asked through the Contactus in the *AcadameX*"+"\n"+text);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
	}

	@Override
	public void sendEmailAd(String fromMail, String adminMail, String subject, String text)
	{
        SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(fromMail);
        mailMessage.setTo(adminMail);
        mailMessage.setSubject("Question asked by a Faculty in the *AcadameX* about "+subject);
        mailMessage.setText("The question is asked as given below :"+"\n"+text);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        } 
		
	}
}
