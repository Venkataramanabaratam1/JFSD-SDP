package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Document;
import com.klef.jfsd.springboot.model.FContact;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.SContact;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentCourseMapping;

public interface AdminService 
{
	public List<Faculty> viewallfaculty();
	public List<Student> viewallstudents();
	public List<Course> viewallcourses();
	public List<SContact> viewallscontacts();
	public List<FContact> viewallfcontacts();
	public List<StudentCourseMapping> viewallStudentCourseMapping();
	
 	public String deletefaculty(int fid);
	public String deletestudent(int sid);
	public String deletecourse(int cid);
	public String deletescontact(int scid);
	public String deletefcontact(int fcid);
	public String deleteStudentRegisteredCourses(int scmid);
	
	public Faculty viewfacultybyid(int fid);
	public Student viewstudentbyid(int sid);
	public Course viewcoursebyid(int cid);
	
	public Admin checkadminlogin(int id, String pwd);
	public String addStudent(Student s);
	public void sendEmails(String adminMail, String email, String id, String pwd);
	public String addFaculty(Faculty f);
	public void sendEmailf(String adminMail, String email, String id, String pwd);
	public String addCourse(Course c);
	
	public String updatefaculty(Faculty f);
	public String updatestudent(Student s);
	public String updatecourse(Course c);
	
	public long studentcount();   //count(*)
	public long facultycount();  //count(*)
    public long coursecount();  //count(*)
    
    public void sendEmailAds(String adminMail, String email, String id, String pwd); //confirmation to admin
    public void sendEmailAdf(String adminMail, String email, String id, String pwd); //confirmation to admin
    
    public Admin viewadminbyid(int aid);
    public String addAdmin(Admin a);
    public void sendEmaila(String adminMail, String email, String id, String pwd);
    public String updateadmin(Admin a);
    public String updatepassword(Admin a);
    
    public String studentcoursemapping(StudentCourseMapping Scm);
    public List<StudentCourseMapping> viewallStudentCourseMappings(int sid);
    public long checkfcoursemapping(Student s,Course c);
    
    public StudentCourseMapping viewallStudentCourseMappingbyid(int scmid);
    
    public List<Document> viewalldocuments();
    public Document viewdocumentbyid(int id);
    public String addDocument(Document d);
    public List<Document> viewDocumentByCode(String code);
    public String deletematerial(int mid);
}
