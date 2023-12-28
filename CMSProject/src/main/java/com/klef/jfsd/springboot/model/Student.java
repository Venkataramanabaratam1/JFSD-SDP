package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="student_table")
public class Student 
{
	@Id
	@Column(name="stu_id", length=10)
	private int id;
	@Column(name="stu_fname",nullable=false,length = 50)
	private String firstname;
	@Column(name="stu_lname",nullable=false,length = 50)
	private String lastname;
	@Column(name="stu_email",nullable=false,unique = true,length = 100)
	private String email;
	@Column(name="stu_regdate",nullable=false,length = 20)
	private String regdate;
	@Column(name="stu_password",nullable=false,length = 30)
	private String password;
	@Column(name="stu_year",nullable=false,length = 20)
	private String year;
	@Column(name="stu_gender",nullable=false,length = 10)
	private String gender;
	@Column(name="stu_contact",nullable=false,unique = true)
	private String contact;
	@Column(name="stu_parentname",nullable=false,length = 50)
	private String parentname;
	@Column(name="stu_parentcontact",nullable=false,unique = true)
	private String parentcontact;
	@Column(name="stu_dob",nullable=false,length = 20)
	private String dateofbirth;
	private Blob studentimg;
	@Column(name="stu_address",nullable=false)
	private String address;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getParentname() {
		return parentname;
	}
	public void setParentname(String parentname) {
		this.parentname = parentname;
	}
	public String getParentcontact() {
		return parentcontact;
	}
	public void setParentcontact(String parentcontact) {
		this.parentcontact = parentcontact;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	
	public Blob getStudentimg() {
		return studentimg;
	}
	public void setStudentimg(Blob studentimg) {
		this.studentimg = studentimg;
	}
	
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	@Override
	public String toString() {
		return "Student [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", regdate=" + regdate + ", password=" + password + ", year=" + year + ", gender=" + gender
				+ ", contact=" + contact + ", parentname=" + parentname + ", parentcontact=" + parentcontact
				+ ", dateofbirth=" + dateofbirth + ", studentimg=" + studentimg + ", address=" + address + "]";
	}
	
}
