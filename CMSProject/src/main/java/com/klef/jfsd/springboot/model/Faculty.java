package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="faculty_table")
public class Faculty 
{
	@Id
	@Column(name="fac_id", length=4)
	private int id;
	@Column(name="fac_fname",nullable=false,length = 50)
	private String firstname;
	@Column(name="fac_lname",nullable=false,length = 50)
	private String lastname;
	@Column(name="fac_email",nullable=false,unique = true,length = 150)
	private String email;
	@Column(name="fac_jd",nullable=false,length = 20)
	private String joiningdate;
	@Column(name="fac_password",nullable=false,length = 30)
	private String password;
	@Column(name="fac_contact",nullable=false,unique = true)
	private String contact;
	@Column(name="fac_gender",nullable=false,length = 10)
	private String gender;
	@Column(name="fac_designation",nullable=false,length = 20)
	private String designation;
	@Column(name="fac_department",nullable=false,length = 100)
	private String department;
	@Column(name="fac_dob",nullable=false,length = 20)
	private String dateofbirth;
	@Column(name="fac_sal",nullable=false)
	private double salary;
	private Blob facultyimg;
	@Column(name="fac_address",nullable=false)
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
	public String getJoiningdate() {
		return joiningdate;
	}
	public void setJoiningdate(String joiningdate) {
		this.joiningdate = joiningdate;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getDesignation() {
		return designation;
	}
	public void setDesignation(String designation) {
		this.designation = designation;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getDateofbirth() {
		return dateofbirth;
	}
	public void setDateofbirth(String dateofbirth) {
		this.dateofbirth = dateofbirth;
	}
	public double getSalary() {
		return salary;
	}
	public void setSalary(double salary) {
		this.salary = salary;
	}
	public Blob getFacultyimg() {
		return facultyimg;
	}
	public void setFacultyimg(Blob facultyimg) {
		this.facultyimg = facultyimg;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "Faculty [id=" + id + ", firstname=" + firstname + ", lastname=" + lastname + ", email=" + email
				+ ", joiningdate=" + joiningdate + ", password=" + password + ", contact=" + contact + ", gender="
				+ gender + ", designation=" + designation + ", department=" + department + ", dateofbirth="
				+ dateofbirth + ", salary=" + salary + ", facultyimg=" + facultyimg + ", address=" + address + "]";
	}
}
