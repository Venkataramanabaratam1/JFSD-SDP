package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Course;

public interface CourseService 
{
	public List<Course> getCoursesByFacultyId(int fid);
}
