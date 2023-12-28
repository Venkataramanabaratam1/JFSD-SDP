package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="course_table")
public class Course 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	@Column(name="c_code")
	private String code;
	@Column(name="c_name",nullable=false,length = 50)
	private String title;
	@Column(name="c_desc",nullable=false,length = 2000)
	private String description;
	@Column(name="c_dept",nullable=false,length = 50)
	private String department;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="faculty_id")
	private Faculty faculty;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="document_id")
	private Document document;
	
	private Blob cimage;
	

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public Blob getCimage() {
		return cimage;
	}

	public void setCimage(Blob cimage) {
		this.cimage = cimage;
	}

	@Override
	public String toString() {
		return "Course [id=" + id + ", code=" + code + ", title=" + title + ", description=" + description
				+ ", department=" + department + ", faculty=" + faculty + ", document=" + document + ", cimage="
				+ cimage + "]";
	}

}
