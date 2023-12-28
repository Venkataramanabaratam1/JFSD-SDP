package com.klef.jfsd.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService
{
	@Autowired
	private StudentRepository studentRepository;
	
	public String updatestudent(Student student) 
	{
		Student s = studentRepository.findById(student.getId()).get();    
	    
	    s.setFirstname(student.getFirstname());
	    s.setLastname(student.getLastname());
	    s.setEmail(student.getEmail());
	    s.setRegdate(student.getRegdate());
	    s.setAddress(student.getAddress());
	    s.setDateofbirth(student.getDateofbirth());
	    s.setContact(student.getContact());
	    s.setParentname(student.getParentname());
	    s.setParentcontact(student.getParentcontact());
	    s.setPassword(student.getPassword());
	    s.setYear(student.getYear());
	    s.setGender(student.getGender());
	    s.setStudentimg(student.getStudentimg());
	    
	    studentRepository.save(s);
	    
	    return "Student Updated Successfully";
	}

	public Student checkstudentlogin(int id, String pwd) 
	{
		return studentRepository.checkstudentlogin(id, pwd);
	}

	public String updatepassword(Student student) 
	  {
	    Student s = studentRepository.findById(student.getId()).get();
	    
	    s.setPassword(student.getPassword());
	    
	    studentRepository.save(s);
	    
	    return "Student Password Updated Successfully";
	  }
	
}
