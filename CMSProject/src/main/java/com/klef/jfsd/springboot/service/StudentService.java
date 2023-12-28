package com.klef.jfsd.springboot.service;

import com.klef.jfsd.springboot.model.Student;

public interface StudentService 
{
	public String updatestudent(Student student);
	public Student checkstudentlogin(int id, String pwd);
	
	public String updatepassword(Student s);
}
