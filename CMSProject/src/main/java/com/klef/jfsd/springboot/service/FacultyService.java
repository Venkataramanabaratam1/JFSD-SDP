package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;

public interface FacultyService 
{
	public String updatefaculty(Faculty faculty);
	public Faculty checkfacultylogin(int id, String pwd);
	
	public List<Student> viewallStudentsByFaculty(int professorId);
	public List<Student> viewallStudentsByCourse(int professorId, int courseId);
	
	public String updatepassword(Faculty f);
}
