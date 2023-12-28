package com.klef.jfsd.springboot.model;

import java.sql.Blob;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="admin_table")
public class Admin 
{
	@Id
	@Column(length=4)
	private int id;
	@Column(nullable=false)
	private String password;
	@Column(name="ad_name",nullable=false,length = 50)
	private String name;
	@Column(name="ad_email",nullable=false,unique = true,length = 50)
	private String email;
	@Column(name="ad_gender",nullable=false,length = 10)
	private String gender;
	@Column(name="ad_contact",nullable=false,unique = true)
	private String contact;
	private Blob adminimg;
	@Column(name="ad_address",nullable=false)
	private String address;
	@Column(name="ad_role",nullable=false,length = 30)
	private String role;
	@Column(name="ad_abt",nullable=false,length = 1000)
	private String about;
	@Column(name="ad_github",nullable=false,length = 100)
	private String github;
	@Column(name="ad_insta",nullable=false,length = 100)
	private String insta;
	@Column(name="ad_linkedin",nullable=false,length = 100)
	private String linkedin;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public Blob getAdminimg() {
		return adminimg;
	}
	public void setAdminimg(Blob adminimg) {
		this.adminimg = adminimg;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getAbout() {
		return about;
	}
	public void setAbout(String about) {
		this.about = about;
	}
	public String getGithub() {
		return github;
	}
	public void setGithub(String github) {
		this.github = github;
	}
	public String getInsta() {
		return insta;
	}
	public void setInsta(String insta) {
		this.insta = insta;
	}
	public String getLinkedin() {
		return linkedin;
	}
	public void setLinkedin(String linkedin) {
		this.linkedin = linkedin;
	}
	@Override
	public String toString() {
		return "Admin [id=" + id + ", password=" + password + ", name=" + name + ", email=" + email + ", gender="
				+ gender + ", contact=" + contact + ", adminimg=" + adminimg + ", address=" + address + ", role=" + role
				+ ", about=" + about + ", github=" + github + ", insta=" + insta + ", linkedin=" + linkedin + "]";
	}
	
}
