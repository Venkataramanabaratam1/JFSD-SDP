package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.repository.CourseRepository;

@Service
public class CourseServiceImpl implements CourseService
{
    
	@Autowired
	public CourseRepository courseRepository;
		
	@Override
	public List<Course> getCoursesByFacultyId(int fid)
	{
		return courseRepository.getCoursesByFacultyId(fid);
	}
	

}
