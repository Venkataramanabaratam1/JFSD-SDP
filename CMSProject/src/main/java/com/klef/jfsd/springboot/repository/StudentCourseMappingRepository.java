package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentCourseMapping;

public interface StudentCourseMappingRepository extends JpaRepository<StudentCourseMapping, Integer>
{
	@Query("SELECT COUNT(scm) FROM StudentCourseMapping scm WHERE scm.student = ?1 AND scm.course = ?2")
	public long checkStudentCourseMapping(Student student, Course course);
	
	@Query("SELECT scm FROM StudentCourseMapping scm WHERE scm.student.id = :studentId")
	public List<StudentCourseMapping> viewallStudentCourseMappings(int studentId);
	
	
}
