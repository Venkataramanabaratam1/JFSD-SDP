package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.SContact;
import com.klef.jfsd.springboot.repository.SContactRepository;

@Service
public class SContactServiceImpl implements SContactService
{
	@Autowired
	public SContactRepository sContactRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	public String addSContact(SContact sc) 
	{
		sContactRepository.save(sc);
		return "Student Issue Saved Successfully";
	}

	public void sendEmail(String fromMail, String adminMail, String subject, String text) 
	{
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(fromMail);
        mailMessage.setTo(adminMail);
        mailMessage.setSubject("The Question you have asked in the *AcadameX* mentioning"+subject);
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
        mailMessage.setSubject("Question asked by a student in the *AcadameX* about "+subject);
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
