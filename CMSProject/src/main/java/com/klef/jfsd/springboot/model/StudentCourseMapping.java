package com.klef.jfsd.springboot.model;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;



@Entity
@Table(name="studentcoursemapping_table")
public class StudentCourseMapping 
{

	 @Id
	 @GeneratedValue(strategy = GenerationType.IDENTITY)
	 private int id;
	  
	 @ManyToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name="student_id")
	 private Student student;
	 
	 
	 @ManyToOne(cascade = CascadeType.ALL)
	 @JoinColumn(name="course_id")
	 private Course course;


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public Student getStudent() {
		return student;
	}


	public void setStudent(Student student) {
		this.student = student;
	}


	public Course getCourse() {
		return course;
	}


	public void setCourse(Course course) {
		this.course = course;
	}


	@Override
	public String toString() {
		return "StudentCourseMapping [id=" + id + ", student=" + student + ", course=" + course + "]";
	}
	 

}
