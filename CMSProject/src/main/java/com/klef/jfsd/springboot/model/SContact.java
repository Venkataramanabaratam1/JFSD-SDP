package com.klef.jfsd.springboot.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_contact")
public class SContact 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id; 
	@Column(name="sc_name",nullable=false,length = 50)
    private String name;
	@Column(name="sc_frommail",nullable=false,length = 50)
    private String fromMail;
	@Column(name="sc_phoneNo",nullable=false,length = 50)
    private String phoneNo;
	@Column(name="sc_subject",nullable=false,length = 50)
    private String subject;
	@Column(name="sc_text",nullable=false,length = 100)
    private String text;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFromMail() {
		return fromMail;
	}
	public void setFromMail(String fromMail) {
		this.fromMail = fromMail;
	}
	public String getPhoneNo() {
		return phoneNo;
	}
	public void setPhoneNo(String phoneNo) {
		this.phoneNo = phoneNo;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	@Override
	public String toString() {
		return "SContact [id=" + id + ", name=" + name + ", fromMail=" + fromMail + ", phoneNo="
				+ phoneNo + ", subject=" + subject + ", text=" + text + "]";
	}

}
