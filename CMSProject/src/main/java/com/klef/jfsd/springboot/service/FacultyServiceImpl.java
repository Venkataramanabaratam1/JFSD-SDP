package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;

@Service
public class FacultyServiceImpl implements FacultyService
{
	@Autowired
	public FacultyRepository facultyRepository;
	
	@Autowired
	public CourseRepository courseRepository;
	
	public String updatefaculty(Faculty faculty) 
	{
		Faculty f = facultyRepository.findById(faculty.getId()).get();    
	    
	    f.setFirstname(faculty.getFirstname());
	    f.setLastname(faculty.getLastname());
	    f.setEmail(faculty.getEmail());
	    f.setDepartment(faculty.getDepartment());
	    f.setAddress(faculty.getAddress());
	    f.setDateofbirth(faculty.getDateofbirth());
	    f.setContact(faculty.getContact());
	    f.setDesignation(faculty.getDesignation());
	    f.setJoiningdate(faculty.getJoiningdate());
	    f.setPassword(faculty.getPassword());
	    f.setSalary(faculty.getSalary());
	    f.setGender(faculty.getGender());
	    f.setFacultyimg(faculty.getFacultyimg());
	    
	    facultyRepository.save(f);
	    
	    return "Faculty Updated Successfully";
	}

	@Override
	public Faculty checkfacultylogin(int id, String pwd)
	{
		return facultyRepository.checkfacultylogin(id, pwd);
	}

	public String updatepassword(Faculty faculty) 
	  {
	    Faculty f = facultyRepository.findById(faculty.getId()).get();
	    
	    f.setPassword(faculty.getPassword());
	    
	    facultyRepository.save(f);
	    
	    return "Faculty Password Updated Successfully";
	  }
	
	@Override
	  public List<Student> viewallStudentsByFaculty(int professorId) 
	  {
	    return courseRepository.viewallStudentsByFaculty(professorId);
	  }

	  @Override
	  public List<Student> viewallStudentsByCourse(int professorId, int courseId) 
	  {
	    return courseRepository.viewallStudentsByCourse(professorId, courseId);
	  }
	
}
