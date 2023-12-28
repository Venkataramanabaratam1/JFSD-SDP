package com.klef.jfsd.springboot.service;

import java.io.IOException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Document;
import com.klef.jfsd.springboot.model.FContact;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.SContact;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentCourseMapping;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.CourseRepository;
import com.klef.jfsd.springboot.repository.DocumentRepository;
import com.klef.jfsd.springboot.repository.FContactRepository;
import com.klef.jfsd.springboot.repository.FacultyRepository;
import com.klef.jfsd.springboot.repository.SContactRepository;
import com.klef.jfsd.springboot.repository.StudentCourseMappingRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class AdminServiceImpl implements AdminService
{
	@Autowired
	private AdminRepository adminRepository;
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	public FacultyRepository facultyRepository;
	
	@Autowired
    private JavaMailSender javaMailSender;
	
	@Autowired
	public CourseRepository courseRepository;
	
	@Autowired
	public SContactRepository sContactRepository;
	
	@Autowired
	public FContactRepository fContactRepository;
	
	@Autowired
	public StudentCourseMappingRepository studentCourseMappingRepository;
	
	@Autowired
	public DocumentRepository documentRepository;
	
	@Override
	public List<Faculty> viewallfaculty() 
	{
		return facultyRepository.findAll();
	}

	public List<Student> viewallstudents() 
	{
		return studentRepository.findAll();
	}
	
	public List<Course> viewallcourses() 
	{
		return courseRepository.findAll();
	}
	
	public List<SContact> viewallscontacts() 
	{
		return sContactRepository.findAll();
	}
	
	public List<FContact> viewallfcontacts() 
	{
		return fContactRepository.findAll();
	}
	
	
	public String deletefaculty(int fid) 
	{
		Optional<Faculty> obj =  facultyRepository.findById(fid);
        String msg = null;
        
        if(obj.isPresent())
        {
          Faculty f = obj.get();
          facultyRepository.delete(f);
          msg = "Faculty Deleted Successfully";
        }
        else
        {
          msg = "Faculty Not Found";
        }
        return msg;
	}

	@Override
	public String deletestudent(int sid) 
	{
		Optional<Student> obj = studentRepository.findById(sid);
        String msg = null;
        
        if(obj.isPresent())
        {
          Student s = obj.get();
          studentRepository.delete(s);
          msg = "Student Deleted Successfully";
        }
        else
        {
          msg = "Student Not Found";
        }
        return msg;
	}
	
	public String deletecourse(int cid) 
	{
		
		Optional<Course> obj = courseRepository.findById(cid);
        String msg = null;
        
        if(obj.isPresent())
        {
          Course c = obj.get();
          courseRepository.delete(c);
          msg = "Course Deleted Successfully";
        }
        else
        {
          msg = "Course Not Found";
        }
        return msg;
	}
	
	public String deletescontact(int scid) 
	{
		Optional<SContact> obj = sContactRepository.findById(scid);
		String msg = null;
		
		if(obj.isPresent())
		{
			SContact sc = obj.get();
			sContactRepository.delete(sc);
			msg = "Student Issue Solved";
		}
		else
		{
			msg = "Student Issue Not Solved";
		}
		return msg;
	}
	
	public String deletefcontact(int fcid) 
	{
		Optional<FContact> obj = fContactRepository.findById(fcid);
		String msg = null;
		
		if(obj.isPresent())
		{
			FContact fc = obj.get();
			fContactRepository.delete(fc);
			msg = "Professor Issue Solved";
		}
		else
		{
			msg = "Professor Issue Not Solved";
		}
		return msg;
	}

	public Faculty viewfacultybyid(int fid) 
	{
        Optional<Faculty> obj =  facultyRepository.findById(fid);
        
        if(obj.isPresent())
        {
          Faculty f = obj.get();
          
          return f;
        }
        else
        {
          return null;
        }
	}

	@Override
	public Student viewstudentbyid(int sid) 
	{
		Optional<Student> obj = studentRepository.findById(sid);
        
        if(obj.isPresent())
        {
          Student s = obj.get();
          
          return s;
        }
        else
        {
          return null;
        }
	}
	
	public Course viewcoursebyid(int cid) 
	{
        Optional<Course> obj = courseRepository.findById(cid);
        
        if(obj.isPresent())
        {
        	Course c = obj.get();
          
            return c;
        }
        else
        {
            return null;
        }
	}

	public Admin checkadminlogin(int id, String pwd) 
	{
		return adminRepository.checkadminlogin(id, pwd);
	}

	@Override
	public String addStudent(Student s) 
	{
		studentRepository.save(s);
		return "Student Added Successfully";
	}
	
	public void sendEmails(String adminMail, String email, String id, String pwd) 
	{
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(adminMail);
        mailMessage.setTo(email);
        mailMessage.setSubject("AcadameX Student Credentials");
        
        String emailBody = "Id: " + id + "\nPassword: " + pwd;
        mailMessage.setText(emailBody);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
		
	}

	public String addFaculty(Faculty f) 
	{
		facultyRepository.save(f);
		return "Faculty Added Successfully";
	}
	
	public void sendEmailf(String adminMail, String email, String id, String pwd) 
	{
        SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(adminMail);
        mailMessage.setTo(email);
        mailMessage.setSubject("AcadameX Faculty Credentials");
        
        String emailBody = "Id: " + id + "\nPassword: " + pwd;
        mailMessage.setText(emailBody);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
	}
	
	public String addCourse(Course c) 
	{
		courseRepository.save(c);
		return "Course Added Successfully";
	}

	@Override
	public long studentcount() 
	{
		return studentRepository.count();
	}

	@Override
	public long facultycount() 
	{
		return facultyRepository.count();
	}
	
	public long coursecount() 
	{
		return courseRepository.count();
	}

	@Override
	public String updatefaculty(Faculty faculty) 
	{
        Faculty f = facultyRepository.findById(faculty.getId()).get();    
	    
	    f.setFirstname(faculty.getFirstname());
	    f.setLastname(faculty.getLastname());
	    f.setEmail(faculty.getEmail());
	    f.setDepartment(faculty.getDepartment());
	    f.setAddress(faculty.getAddress());
	    f.setDateofbirth(faculty.getDateofbirth());
	    f.setContact(faculty.getContact());
	    f.setDesignation(faculty.getDesignation());
	    f.setJoiningdate(faculty.getJoiningdate());
	    f.setPassword(faculty.getPassword());
	    f.setSalary(faculty.getSalary());
	    f.setGender(faculty.getGender());
	    f.setFacultyimg(faculty.getFacultyimg());
	    
	    
	    facultyRepository.save(f);
	    
	    return "Faculty Updated Successfully";
	}

	@Override
	public String updatestudent(Student student) 
	{
		Student s = studentRepository.findById(student.getId()).get();    
	    
	    s.setFirstname(student.getFirstname());
	    s.setLastname(student.getLastname());
	    s.setEmail(student.getEmail());
	    s.setRegdate(student.getRegdate());
	    s.setAddress(student.getAddress());
	    s.setDateofbirth(student.getDateofbirth());
	    s.setContact(student.getContact());
	    s.setParentname(student.getParentname());
	    s.setParentcontact(student.getParentcontact());
	    s.setPassword(student.getPassword());
	    s.setYear(student.getYear());
	    s.setGender(student.getGender());
	    s.setStudentimg(student.getStudentimg());
	    
	    studentRepository.save(s);
	    
	    return "Student Updated Successfully";
	}
	
	public String updatecourse(Course crs) 
	{
        Course c = courseRepository.findById(crs.getId()).get();    
	    
	    c.setCimage(crs.getCimage());
	    c.setCode(crs.getCode());
	    c.setTitle(crs.getTitle());
	    c.setFaculty(crs.getFaculty());
	    c.setDepartment(crs.getDepartment());
	    c.setDescription(crs.getDescription());
	    
	    courseRepository.save(c);
	    
	    return "Course Updated Successfully";
	}
	
	public void sendEmailAds(String adminMail, String email, String id, String pwd) 
	{
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(adminMail);
        mailMessage.setTo(email);
        mailMessage.setSubject("New Student Credentials");
        
        
        String emailBody = "New Student Added Successfully"+"\nId: " + id + "\nPassword: " + pwd;
        mailMessage.setText(emailBody);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
		
	}
	
	public void sendEmailAdf(String adminMail, String email, String id, String pwd) 
	{
		SimpleMailMessage mailMessage = new SimpleMailMessage();
		
        mailMessage.setTo(adminMail);
        mailMessage.setTo(email);
        mailMessage.setSubject("New Faculty Credentials");
        
        String emailBody = "New Faculty Added Successfully"+"\nId: " + id + "\nPassword: " + pwd;
        mailMessage.setText(emailBody);

        try 
        {
            javaMailSender.send(mailMessage);
        } 
        catch (MailException e) 
        {
            e.printStackTrace();
        }
		
	}
	
	public Admin viewadminbyid(int aid) 
	  {
	    Optional<Admin> obj = adminRepository.findById(aid);
	        
	        if(obj.isPresent())
	        {
	          Admin a = obj.get();
	          
	            return a;
	        }
	        else
	        {
	            return null;
	        }
	  }

	public String addAdmin(Admin a) 
	  {
	    adminRepository.save(a);
	    return "Admin Added Successfully";
	  }

	  
	  public void sendEmaila(String adminMail, String email, String id, String pwd) 
	  {
	    SimpleMailMessage mailMessage = new SimpleMailMessage();
	    
	        mailMessage.setTo(adminMail);
	        mailMessage.setTo(email);
	        mailMessage.setSubject("Admin Credintals");
	        
	        String emailBody = "Id: " + id + "\nPassword: " + pwd;
	        mailMessage.setText(emailBody);

	        try 
	        {
	            javaMailSender.send(mailMessage);
	        } 
	        catch (MailException e) 
	        {
	            e.printStackTrace();
	        }
	    
	  }

	public String updateadmin(Admin admin) 
	  {
	    Admin a = adminRepository.findById(admin.getId()).get();
	    
	    a.setName(admin.getName());
	    a.setId(admin.getId());
	    a.setRole(admin.getRole());
	    a.setAbout(admin.getAbout());
	    a.setAddress(admin.getAddress());
	    a.setGender(admin.getGender());
	    a.setEmail(admin.getEmail());
	    a.setContact(admin.getContact());
	    a.setAdminimg(admin.getAdminimg());
	    a.setGithub(admin.getGithub());
	    a.setInsta(admin.getInsta());
	    a.setLinkedin(admin.getLinkedin());
	    
	    adminRepository.save(a);
	    
	    return "Admin Updated Successfully";
	  }

	public String updatepassword(Admin admin) 
	  {
	        Admin a = adminRepository.findById(admin.getId()).get();
	    
	    a.setPassword(admin.getPassword());
	    
	    adminRepository.save(a);
	    
	    return "Admin Password Updated Successfully";
	  }

	@Override
	  public String studentcoursemapping(StudentCourseMapping scm) 
	  {
	    studentCourseMappingRepository.save(scm);
	    return "Mapping Done";
	  }

	  @Override
	  public List<StudentCourseMapping> viewallStudentCourseMappings(int sid) 
	  {
	        List<StudentCourseMapping> obj = studentCourseMappingRepository.viewallStudentCourseMappings(sid);
	        
	        if(!obj.isEmpty())
	        {
	          List<StudentCourseMapping> scm = (List<StudentCourseMapping>) obj;
	          
	            return scm;
	        }
	        else
	        {
	            return null;
	        }
	  }

	  @Override
	  public long checkfcoursemapping(Student s, Course c) 
	  {
	    return studentCourseMappingRepository.checkStudentCourseMapping(s, c);
	  }

	  @Override
	  public List<StudentCourseMapping> viewallStudentCourseMapping() 
	  {
	    return studentCourseMappingRepository.findAll();
	  }

	  @Override
	  public StudentCourseMapping viewallStudentCourseMappingbyid(int scmid) 
	  {
	        Optional<StudentCourseMapping> obj = studentCourseMappingRepository.findById(scmid);
	        
	        if(obj.isPresent())
	        {
	          StudentCourseMapping scm = obj.get();
	          
	            return scm;
	        }
	        else
	        {
	            return null;
	        }
	  }

	@Override
	public String deleteStudentRegisteredCourses(int scmid) 
	{
		Optional<StudentCourseMapping> obj = studentCourseMappingRepository.findById(scmid);
		String msg = null;
		
		if(obj.isPresent())
		{
			StudentCourseMapping scm = obj.get();
			studentCourseMappingRepository.delete(scm);
			msg = "StudentCourseMapping Deleted Successfully";
		}
		else
		{
			msg = "StudentCourseMapping Not Found";
		}
		return msg;
	}

	@Override
	public List<Document> viewalldocuments() 
	{
		return documentRepository.findAll();
	}

	@Override
	public Document viewdocumentbyid(int id) 
	{
        Optional<Document> obj = documentRepository.findById(id);
        
        if(obj.isPresent())
        {
        	Document d = obj.get();
          
            return d;
        }
        else
        {
            return null;
        }
	}

	@Override
	public String addDocument(Document d) 
	{
		documentRepository.save(d);
		return "Document Added Successfully";
	}

	@Override
	public List<Document> viewDocumentByCode(String code) 
	{
		return documentRepository.viewDocumentByCode(code);
	}

	@Override
	public String deletematerial(int mid) 
	{
		Optional<Document> obj = documentRepository.findById(mid);
		String msg = null;
		
		if(obj.isPresent())
		{
			Document d = obj.get();
			documentRepository.delete(d);
			msg = "Document Deleted Successfully";
		}
		else
		{
			msg = "Document Not Found";
		}
		return msg;
	}

}
