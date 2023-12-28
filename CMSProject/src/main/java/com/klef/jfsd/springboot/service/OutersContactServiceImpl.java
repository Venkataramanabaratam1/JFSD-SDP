package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Outer;
import com.klef.jfsd.springboot.repository.OutersContactRepository;

@Service
public class OutersContactServiceImpl implements OutersContactService 
{  
	@Autowired
	public OutersContactRepository outersContactRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	public String addOuterContact(Outer outer) 
	{
		outersContactRepository.save(outer);
		return "Thank you for Contacting AcadameX.. \n Your Issue Sent Successfully \n You will get one copy mail regarding this and our team will respond to you shortly..";
	}
	
	public void sendEmail(String fromMail, String adminMail, String subject, String text) 
	{
       SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(fromMail);
        mailMessage.setTo(adminMail);
        mailMessage.setSubject("Mail from AcadameX regarding.."+subject);
        mailMessage.setText("Thank you for visiting us !...."+"\n"+"This is copy mail of Question(s), that what you have asked "+"\n"+text+"\n"+"\n"+"\n"+"Thankyou...Team AcadameX."+"\n"+"...If this was not done by you, please Ignore this message!..");

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
		
	}

	public void sendEmailAd(String fromMail, String adminMail, String subject, String text) 
	{
       SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(fromMail);
        mailMessage.setTo(adminMail);
        mailMessage.setSubject("Question asked by a Stranger in the *AcadameX* about "+subject);
        mailMessage.setText("The question(s) is asked as given below :"+"\n"+text);

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
