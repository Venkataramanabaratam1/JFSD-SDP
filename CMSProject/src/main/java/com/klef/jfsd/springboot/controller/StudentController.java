package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.rowset.serial.SerialException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Document;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.SContact;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentCourseMapping;
import com.klef.jfsd.springboot.service.AdminService;
import com.klef.jfsd.springboot.service.SContactService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController 
{
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private SContactService sContactService;
	
	@Value("${spring.mail.username}") 
    private String adminMail;
	
	@GetMapping("student/faq")        // URI & method name can be different
    public ModelAndView faq()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("student/faq");
	   return mv;
	}
	
	@GetMapping("student/about")               
    public ModelAndView about()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("student/about");
	   return mv;
	}
	
	@GetMapping("studentlogin") // URI & method name can be different
    public ModelAndView studentlogin()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("login");
	   return mv;
	}
	
	@GetMapping("student/mycourses")
    public ModelAndView viewstudentcoursemapping(HttpServletRequest request)
    {
      ModelAndView mv = new ModelAndView("student/mycourses");
      
      HttpSession session=request.getSession();
      int sid=(int)session.getAttribute("sid");
      
      List<StudentCourseMapping> scmlist = adminService.viewallStudentCourseMappings(sid);
      mv.addObject("scmdata", scmlist);
      
      return mv;
    }
	
	@PostMapping("checkstudentlogin")
	public ModelAndView checkstudentlogin(HttpServletRequest request)
	{
	     ModelAndView mv = new ModelAndView();
	     
	     String id = request.getParameter("username");
	     int sid=Integer.parseInt(id);
	     String pwd = request.getParameter("password");
	     
	     Student s = studentService.checkstudentlogin(sid, pwd);
	       
	     if(s!=null)
	     {
	        //session
	    	 
	    	 HttpSession session=request.getSession();
	    	 session.setAttribute("sid", s.getId());  //eid is a session variable
	    	 session.setAttribute("sname", s.getFirstname()+" "+s.getLastname()); //ename is a session variable
	    	 
	    	//session
	        mv.setViewName("studenthome");
	        mv.addObject("message","Login Successful");
	     }
	     else
	     {
	        mv.setViewName("login");
	        mv.addObject("message", "Login Failed");
	     }
	       
	     return mv;
	}
	
	@GetMapping("studenthome") // URI & method name can be different
    public ModelAndView studenthome(HttpServletRequest request)
   {
      HttpSession session=request.getSession();
    
      int sid=(int)session.getAttribute("sid"); //eid is a session variable
      String sname=(String) session.getAttribute("sname"); //ename is a session variable
    
      ModelAndView mv = new ModelAndView();
      mv.setViewName("studenthome");
       
      mv.addObject("sid", sid);
      mv.addObject("sname", sname);
      
      return mv;
   }
	   
	@GetMapping("student/allcourses")
	public ModelAndView studentViewAllCourses(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    int sid = (int) session.getAttribute("sid");

	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("student/allcourses");
	    mv.addObject("sid", sid);

	    List<Course> allCourses = adminService.viewallcourses();

	    try {
	        List<StudentCourseMapping> scmlist = adminService.viewallStudentCourseMappings(sid);

	        if (scmlist != null) {
	            List<Course> coursesToRemove = new ArrayList<>();

	            for (Course c : allCourses) {
	                long n = adminService.checkfcoursemapping(adminService.viewstudentbyid(sid), adminService.viewcoursebyid(c.getId()));
	                if (n > 0) {
	                    mv.addObject("enroll" + c.getId(), "Go to Course");
	                    coursesToRemove.add(c);
	                } else {
	                    mv.addObject("enroll" + c.getId(), "Enroll Now");
	                }
	            }

	            // Remove courses that the student has registered from the list
	            for (StudentCourseMapping scm : scmlist) {
	                coursesToRemove.add(scm.getCourse());
	            }
	            allCourses.removeAll(coursesToRemove);
	        }

	        mv.addObject("courses", allCourses);
	    } catch (Exception e) {
	        // Handle the exception (e.g., log the error, provide a user-friendly message)
	        e.printStackTrace();
	        mv.addObject("errorMessage", "An error occurred while loading course information.");
	    }

	    return mv;
	}
	
	@GetMapping("student/displaycourseimage")
	public ResponseEntity<byte[]> displaycourseimagedemo1(@RequestParam("id") int id) throws IOException, SQLException
	{
	  Course course = adminService.viewcoursebyid(id);
	  
	  byte [] imageBytes = null;
	  imageBytes = course.getCimage().getBytes(1,(int) course.getCimage().length());

	  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	
	
      
    @GetMapping("student/contact")
  	public ModelAndView addscontact()
  	{
  	   ModelAndView mv = new ModelAndView();
  	   mv.setViewName("student/contact");
  	   return mv;
  	}
    
    @PostMapping("student/insertscontact")
	public ModelAndView insertscontact(HttpServletRequest request)
	{
		ModelAndView mv=new ModelAndView();
		
		String msg=null;
		try
		{	
			String name = request.getParameter("scontactname");
			String fromMail = request.getParameter("scontactfmail");
			String phoneNo = request.getParameter("scontactmobile");
			String subject = request.getParameter("scontactsubject");
			String text = request.getParameter("scontacttext");
			
			
			SContact sc=new SContact();
			sc.setName(name);
			sc.setFromMail(fromMail);
			sc.setPhoneNo(phoneNo);
			sc.setSubject(subject);
			sc.setText(text);
			
			msg = sContactService.addSContact(sc);
			
			sContactService.sendEmail(adminMail, fromMail, subject, text); //student
			sContactService.sendEmailAd(adminMail, adminMail, subject, text); //admin
			
			mv.setViewName("student/displaymsg");
			mv.addObject("message",msg);
		}
		catch(Exception e)
		{
			msg=e.getMessage();
			mv.setViewName("student/displayerror");
			mv.addObject("message",msg);
		}
		return mv;
	}
    
     @GetMapping("student/profile") // URI & method name can be different
	  public ModelAndView studentprofile(HttpServletRequest request)
	   {
		  HttpSession session=request.getSession();
		    
		  int sid=(int)session.getAttribute("sid"); 
		  String sname=(String) session.getAttribute("sname");
		    
		  ModelAndView mv = new ModelAndView();
		  mv.setViewName("student/profile");
		      
		  mv.addObject("sid", sid);
		  mv.addObject("sname", sname);
		  Student s = adminService.viewstudentbyid(sid);
		  
		  List<StudentCourseMapping> scmlist = adminService.viewallStudentCourseMappings(sid);
	      mv.addObject("scmdata", scmlist);
		        
		  mv.addObject("s", s);
		      
		  return mv;
	    }
		 
    @PostMapping("student/updatestudentprofile")
    public ModelAndView updateaction3(HttpServletRequest request,@RequestParam("studentimg") MultipartFile file) throws IOException, SerialException, SQLException
     {
		String msg = null;
		      
		ModelAndView mv = new ModelAndView();
		      
		 HttpSession session = request.getSession();
		      
		 mv.addObject("sid", session.getAttribute("sid"));
		 mv.addObject("sname", session.getAttribute("sname"));
		      
		  try
		   {
		      String fname = request.getParameter("studentfname");
		      String lname = request.getParameter("studentlname");
		      String email = request.getParameter("studentemail");
		      String regdate = request.getParameter("studentregdate");
		      String id = request.getParameter("studentid");
		      int sid=Integer.parseInt(id);
		      
		      String year = request.getParameter("studentyear");
		      String gender = request.getParameter("studentgender");
		      String mobile = request.getParameter("studentmobile");
		      String pname = request.getParameter("studentpname");
		      String pmobile = request.getParameter("studentpmobile");
		      String address = request.getParameter("studentaddress");
		      String dob = request.getParameter("studentdob");
		      
		      byte[] bytes = file.getBytes();
		      Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
		      
		      Student s=new Student();
		      s.setId(sid);
		      s.setAddress(address);
		      s.setContact(mobile);
		      s.setDateofbirth(dob);
		      s.setEmail(email);
		      s.setFirstname(fname);
		      s.setLastname(lname);
		      s.setGender(gender);
		      s.setParentcontact(pmobile);
		      s.setParentname(pname);
		      s.setRegdate(regdate);
		      s.setYear(year);
		      s.setStudentimg(blob);
		        
		      Student stud = adminService.viewstudentbyid(sid);
		      s.setPassword(stud.getPassword());
		        msg = adminService.updatestudent(s);
		        
		        mv.setViewName("student/displaymsg");
		        mv.addObject("message",msg);
		       
		     }
		     catch(Exception e)
		     {
		        msg = e.getMessage();
		       
		        mv.setViewName("student/displayerror");
		        mv.addObject("message",msg);
		     }
		   
		  return mv;

		 }
		 
	@GetMapping("student/displaystudentimage")
    public ResponseEntity<byte[]> displaystudentimagedemo1(@RequestParam("id") int id) throws IOException, SQLException
    {
		Student student = adminService.viewstudentbyid(id);
		byte [] imageBytes = null;
		imageBytes = student.getStudentimg().getBytes(1,(int) student.getStudentimg().length());

		 return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	}
	    
     @GetMapping("student/logout")
     public ModelAndView logout1()
	  {
	    ModelAndView mv = new ModelAndView();
	    mv.setViewName("student/index");
	    mv.addObject("message", "Logout Successfully");
	    return mv;
	  }
     
     @PostMapping("student/updatestudentpassword")
     public ModelAndView updatestudentpassword(HttpServletRequest request)
     {
       String msg = null;
       
       ModelAndView mv = new ModelAndView();
       
       HttpSession session = request.getSession();
     
       int sid=(int)session.getAttribute("sid");
       mv.addObject("sid", session.getAttribute("sid"));
       mv.addObject("sname", session.getAttribute("sname"));
       
       
      try
      {
        Student stu = adminService.viewstudentbyid(sid);      
        String pwd = request.getParameter("currentpassword");
        String pwd1 = request.getParameter("newpassword");
        String pwd2 = request.getParameter("renewpassword");
    
        if(stu.getPassword().equals(pwd) && pwd1.equals(pwd2))
        {
          stu.setPassword(pwd1);
          msg = studentService.updatepassword(stu);
           
          mv.setViewName("student/displaymsg");
          mv.addObject("message",msg); 
        }
        else
        {
          msg = "Error in Updating Password";
           
          mv.setViewName("student/displayerror");
          mv.addObject("message",msg); 
        }           
      }
      catch(Exception e)
      {
         msg = e.getMessage();
        
         mv.setViewName("student/displayerror");
         mv.addObject("message",msg);
      }
    
   return mv;

  }
     
     @GetMapping("student/studentcoursemapping")
     public ModelAndView studentcoursemapping()
     {
       ModelAndView mv = new ModelAndView("student/allcourses");
         
         List<Course> courselist = adminService.viewallcourses();
         mv.addObject("coursedata", courselist);
       
       List<Student> studentlist = adminService.viewallstudents();
       mv.addObject("studentdata", studentlist);
       
       return mv;
     }  
        
     @PostMapping("student/studentcoursemappinginsert")
     public ModelAndView studentcoursemappinginsert(HttpServletRequest request, @RequestParam("id") int cid) 
     {
         String msg = null;
         ModelAndView mv = new ModelAndView("student/allcourses");
         HttpSession session = request.getSession();
         int sid = (int) session.getAttribute("sid");

         long n = adminService.checkfcoursemapping(adminService.viewstudentbyid(sid), adminService.viewcoursebyid(cid));

         if (n > 0) 
         {
             msg = "Already Enrolled";
             mv.setViewName("student/displayerror");
             mv.addObject("message", msg);
             mv.addObject("enrolled", true);
         } 
         else 
         {
             StudentCourseMapping scm = new StudentCourseMapping();
             scm.setCourse(adminService.viewcoursebyid(cid));
             scm.setStudent(adminService.viewstudentbyid(sid));
             msg = adminService.studentcoursemapping(scm);
             mv.setViewName("student/displaymsg");
             mv.addObject("message", msg);
             mv.addObject("enrolled", false);
         }
         return mv;
     } 
     
     @GetMapping("student/courses-details")
	  public ModelAndView coursedetails(HttpServletRequest request,@RequestParam int id)
	  {
		    HttpSession session=request.getSession();  
			int sid=(int)session.getAttribute("sid"); 
			String sname=(String) session.getAttribute("sname");
			
			ModelAndView mv=new ModelAndView();
			mv.setViewName("student/courses-details");
			mv.addObject("sid", sid);
			mv.addObject("sname", sname);
			
			Course c= adminService.viewcoursebyid(id);
		    mv.addObject("c", c);
		    
		    Student s=adminService.viewstudentbyid(sid);
		    mv.addObject("s", s);
		    
		    List<Document> doc = adminService.viewDocumentByCode(c.getCode());
		    mv.addObject("docs", doc);
		    		    
			return mv;
		}
	  
	  @GetMapping("student/download")
	  public ResponseEntity<ByteArrayResource> downloadFile(@RequestParam int id)
	  {
			Document doc = (Document) adminService.viewdocumentbyid(id);
			return ResponseEntity.ok()
					.contentType(MediaType.parseMediaType(doc.getDocType()))
					.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+doc.getDocName()+"\"")
					.body(new ByteArrayResource(doc.getData()));
	  }
	  
	  @GetMapping("student/displayfacultyimage")
	   public ResponseEntity<byte[]> displayfacultyimagedemo1(@RequestParam("id") int id) throws IOException, SQLException
	   {
	     Faculty faculty = adminService.viewfacultybyid(id);
	     byte [] imageBytes = null;
	     imageBytes = faculty.getFacultyimg().getBytes(1,(int) faculty.getFacultyimg().length());

	     return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	  }
}
