package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Student;

@Repository
public interface CourseRepository extends JpaRepository<Course, Integer>
{
	@Query("SELECT c FROM Course c JOIN Faculty f ON c.faculty.id = f.id WHERE f.id = ?1")
	public List<Course> getCoursesByFacultyId(int fid);

	@Query("SELECT DISTINCT s FROM Student s JOIN StudentCourseMapping scm ON s.id = scm.student.id WHERE scm.course.faculty.id = :professorId")
	public List<Student> viewallStudentsByFaculty(int professorId);
	  
	@Query("SELECT DISTINCT s FROM Student s JOIN StudentCourseMapping scm ON s.id = scm.student.id WHERE scm.course.faculty.id = :professorId AND scm.course.id = :courseId")
	public List<Student> viewallStudentsByCourse(int professorId, int courseId);
}
