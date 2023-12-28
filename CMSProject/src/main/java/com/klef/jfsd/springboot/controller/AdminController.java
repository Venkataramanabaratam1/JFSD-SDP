package com.klef.jfsd.springboot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Course;
import com.klef.jfsd.springboot.model.Document;
import com.klef.jfsd.springboot.model.FContact;
import com.klef.jfsd.springboot.model.Faculty;
import com.klef.jfsd.springboot.model.SContact;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.model.StudentCourseMapping;
import com.klef.jfsd.springboot.service.AdminService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class AdminController 
{
	@Autowired
	private AdminService adminService;
	
	@Value("${spring.mail.username}") 
    private String adminMail;
	
	@GetMapping("adminlogin")
	public ModelAndView adminlogin()
	{
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("login");
	   return mv;
	}
		
	@PostMapping("checkadminlogin")
	  public ModelAndView checkadminlogin(HttpServletRequest request)
	  {
	    ModelAndView mv=new ModelAndView();
	    
	    String id = request.getParameter("username");
	      int aid=Integer.parseInt(id);
	    String pwd=request.getParameter("password");
	    Admin a = adminService.checkadminlogin(aid, pwd);
	    if(a!=null)
	    {
	      HttpSession session=request.getSession();
	      session.setAttribute("aid", a.getId());     //aid is a session variable
	      session.setAttribute("aname", a.getName());
	      
	      mv.setViewName("adminhome");

	      long facultycount=adminService.facultycount();
	      long studentcount=adminService.studentcount();
	      long coursecount = adminService.coursecount();
	      
	      mv.addObject("facultycount", facultycount);
	      mv.addObject("studentcount", studentcount);
	      mv.addObject("coursecount", coursecount);
	      mv.addObject("aid", aid);
	  
	    }
	    else
	    {
	      mv.setViewName("login");
	      mv.addObject("message", "Login Failed");
	    }
	    return mv;
	  }
	  
	     @GetMapping("adminhome")
	     public ModelAndView adminhome(HttpServletRequest request)
	     {
	       HttpSession session=request.getSession();
	        
	        int aid=(int)session.getAttribute("aid"); //eid is a session variable
	        String aname=(String) session.getAttribute("aname"); 
	       
	      long facultycount = adminService.facultycount();
	      long studentcount = adminService.studentcount();
	      long coursecount = adminService.coursecount();
	       ModelAndView mv = new ModelAndView();
	       mv.addObject("studentcount", studentcount);
	       mv.addObject("facultycount", facultycount);
	       mv.addObject("coursecount", coursecount);
	       mv.setViewName("adminhome");
	       
	        mv.addObject("aid", aid);
	        mv.addObject("aname", aname);
	        
	       return mv;
	     }
	
	   @GetMapping("admin/add-student")
		public ModelAndView addstudent(HttpServletRequest request)
		{
		   HttpSession session=request.getSession();
		   int aid=(int)session.getAttribute("aid"); 
		   String aname=(String) session.getAttribute("aname");
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("admin/add-student");
		   mv.addObject("aid", aid);
		   mv.addObject("aname", aname);
		   return mv;
		}
		
		@PostMapping("admin/insertstudent")
		public ModelAndView insertstudent(HttpServletRequest request,@RequestParam("studentimg") MultipartFile file) throws IOException, SerialException, SQLException
		{
			ModelAndView mv=new ModelAndView();
			
			String msg=null;
			try
			{
				String fname = request.getParameter("studentfname");
				String lname = request.getParameter("studentlname");
				String email = request.getParameter("studentemail");
				String regdate = request.getParameter("studentregdate");
				String pwd = request.getParameter("studentpass");
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
				s.setPassword(pwd);
				s.setRegdate(regdate);
				s.setYear(year);
				s.setStudentimg(blob);
				
				msg = adminService.addStudent(s); 
				
				adminService.sendEmails(adminMail, email, id, pwd); //student
				adminService.sendEmailAds(adminMail, adminMail, id, pwd); //admin
				
				mv.setViewName("admin/displaymsg");
				mv.addObject("message",msg);
			}
			catch(Exception e)
			{
				msg=e.getMessage();
				mv.setViewName("admin/displayerror");
				mv.addObject("message",msg);
			}
			return mv;
		}
		
		@GetMapping("admin/add-professor")
		public ModelAndView addprofessor(HttpServletRequest request)
		{
		   HttpSession session=request.getSession();
		   int aid=(int)session.getAttribute("aid"); 
		   String aname=(String) session.getAttribute("aname");	
		   ModelAndView mv = new ModelAndView();
		   mv.setViewName("admin/add-professor");
		   mv.addObject("aid", aid);
		   mv.addObject("aname", aname);
		   return mv;
		}
		
		@PostMapping("admin/insertprofessor")
		public ModelAndView insertprofessor(HttpServletRequest request, @RequestParam("facultyimg") MultipartFile file) throws IOException, SerialException, SQLException
		{
			ModelAndView mv=new ModelAndView();
			
			String msg=null;
			try
			{
				String fname = request.getParameter("facultyfname");
				String lname = request.getParameter("facultylname");
				String email = request.getParameter("facultyemail");
				String jod = request.getParameter("facultyjod");
				String pwd = request.getParameter("facultypass");
				String id = request.getParameter("facultyid");
				int sid=Integer.parseInt(id);
		
				String deg = request.getParameter("facultydeg");
				String gender = request.getParameter("facultygender");
				String mobile = request.getParameter("facultymobile");
				String dept = request.getParameter("facultydept");
				String sal = request.getParameter("facultysal");
				double fsal=Double.parseDouble(sal);
				
				String address = request.getParameter("facultyaddress");
				String dob = request.getParameter("facultydob");
				
				byte[] bytes = file.getBytes();
				Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
				
				Faculty f=new Faculty();
				f.setFirstname(fname);
				f.setLastname(lname);
				f.setEmail(email);
				f.setJoiningdate(jod);
				f.setPassword(pwd);
				f.setId(sid);
				f.setDesignation(deg);
				f.setGender(gender);
				f.setContact(mobile);
				f.setDepartment(dept);
				f.setSalary(fsal);
				f.setAddress(address);
				f.setDateofbirth(dob);
				f.setFacultyimg(blob);
				
				msg=adminService.addFaculty(f);
				
				adminService.sendEmailf(adminMail, email, id, pwd); //faculty
				adminService.sendEmailAdf(adminMail, adminMail, id, pwd); //admin
				
				mv.setViewName("admin/displaymsg");
				mv.addObject("message",msg);
			}
			catch(Exception e)
			{
				msg=e.getMessage();
				mv.setViewName("admin/displayerror");
				mv.addObject("message",msg);
			}
			return mv;
		}
		
		@GetMapping("admin/add-course")
		public ModelAndView addcourse(HttpServletRequest request)
		{
			HttpSession session=request.getSession();
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("admin/add-course");
		    mv.addObject("aid", aid);
		    mv.addObject("aname", aname);
		   
		   List<Faculty> professors =  adminService.viewallfaculty();
		   mv.addObject("professors", professors);
		   
		   return mv;
		}
		
		@PostMapping("admin/insertcourse")
		public ModelAndView insertCourse(HttpServletRequest request, @RequestParam("courseimage") MultipartFile courseImage,
		        @RequestParam("files") MultipartFile[] documentFiles) throws IOException {
		    ModelAndView mv = new ModelAndView();
		    String msg = null;
		    
		    try {
		        String code = request.getParameter("coursecode");
		        String title = request.getParameter("coursetitle");
		        String description = request.getParameter("coursedetails");
		        String department = request.getParameter("coursedept");
		        String prof = request.getParameter("professor");
		        int profId = Integer.parseInt(prof);
		        
		        // Process the course image
		        byte[] imageBytes = courseImage.getBytes();
		        Blob imageBlob = new javax.sql.rowset.serial.SerialBlob(imageBytes);
		        
		        // Create a Course object
		        Course course = new Course();
		        course.setCode(code);
		        course.setTitle(title);
		        course.setDescription(description);
		        course.setDepartment(department);
		        course.setFaculty(adminService.viewfacultybyid(profId));
		        course.setCimage(imageBlob);
		        
		        // Save course information to the database
		        msg = adminService.addCourse(course);
		        
		        // Process and save associated document files
		        for (MultipartFile documentFile : documentFiles) 
		        {
		            Document d = new Document();
		            String category = request.getParameter("coursetype");
		            d.setCourseocde(code);
		            d.setDocName(documentFile.getOriginalFilename());
		            d.setDocType(documentFile.getContentType());
		            d.setDocCategory(category);
		            
		            byte[] fileBytes = documentFile.getBytes();
		            d.setData(fileBytes);
		            adminService.addDocument(d);
		        }
		        
		        mv.setViewName("admin/displaymsg");
		        mv.addObject("message", msg);
		    } catch (Exception e) {
		        msg = e.getMessage();
		        mv.setViewName("admin/displayerror");
		        mv.addObject("message", msg);
		    }
		    
		    return mv;
		}

		
		@GetMapping("admin/all-students")
		public ModelAndView viewallstudents(HttpServletRequest request)
		{
			HttpSession session=request.getSession();
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/all-students");
			mv.addObject("aid", aid);
			mv.addObject("aname", aname);
			
			List<Student> students=adminService.viewallstudents();
			mv.addObject("students", students);
			return mv;
		}
		
		@GetMapping("admin/displaystudentimage")
		public ResponseEntity<byte[]> displaystudentimagedemo(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Student student = adminService.viewstudentbyid(id);
		  byte [] imageBytes = null;
		  imageBytes = student.getStudentimg().getBytes(1,(int) student.getStudentimg().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
		}
		
		@GetMapping("admin/all-professors")
		public ModelAndView viewallprofessors(HttpServletRequest request)
		{
			HttpSession session=request.getSession();
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/all-professors");
			mv.addObject("aid", aid);
			mv.addObject("aname", aname);
			
			List<Faculty> professors = adminService.viewallfaculty();			
			mv.addObject("professors", professors);
			return mv;
		}
		
		@GetMapping("admin/displayfacultyimage")
		public ResponseEntity<byte[]> displayfacultyimagedemo(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Faculty faculty = adminService.viewfacultybyid(id);
		  byte [] imageBytes = null;
		  imageBytes = faculty.getFacultyimg().getBytes(1,(int) faculty.getFacultyimg().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
		}
		
		@GetMapping("admin/all-courses")
		public ModelAndView viewallcourses(HttpServletRequest request)
		{
			HttpSession session=request.getSession();  
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/all-courses");
			mv.addObject("aid", aid);
			mv.addObject("aname", aname);
			
			List<Course> courses=adminService.viewallcourses();
			
			mv.addObject("courses", courses);
			return mv;
		}
		
		@GetMapping("admin/displaycourseimage")
		public ResponseEntity<byte[]> displaycourseimagedemo(@RequestParam("id") int id) throws IOException, SQLException
		{
		  Course course = adminService.viewcoursebyid(id);
		  
		  byte [] imageBytes = null;
		  imageBytes = course.getCimage().getBytes(1,(int) course.getCimage().length());

		  return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
		}
		
		@GetMapping("admin/deletestudent")
		public ModelAndView deletestudent()
		{
		    ModelAndView mv = new ModelAndView();
		    mv.setViewName("admin/all-students");
		     
		    List<Student> students =  adminService.viewallstudents();
		     
		    mv.addObject("students", students);
		     
		    return mv;
		 }
		 @GetMapping("admin/deletestudent/{id}")
		 public String sdeleteaction(@PathVariable("id") int sid)
		 {
		     adminService.deletestudent(sid);
		     return "redirect:/admin/all-students";
		 }
		 
		 @GetMapping("admin/deleteprofessor")
		 public ModelAndView deleteprofessor()
		 {
			  ModelAndView mv = new ModelAndView();
			  mv.setViewName("admin/all-professors");
			     
			  List<Faculty> professors =  adminService.viewallfaculty();
			     
			  mv.addObject("professors", professors);
			     
			  return mv;
		  }
		  @GetMapping("admin/deleteprofessor/{id}")
		  public String pdeleteaction(@PathVariable("id") int pid)
		  {
			     adminService.deletefaculty(pid);
			     return "redirect:/admin/all-professors";
		  }
		  
		   @GetMapping("admin/deletecourse")
		    public ModelAndView deletecourse()
			{
				  ModelAndView mv = new ModelAndView();
				  mv.setViewName("admin/all-courses");
				     
				  List<Course> courses =  adminService.viewallcourses();
				     
				  mv.addObject("courses", courses);
				     
				  return mv;
			 }
		  
		  @GetMapping("admin/deletecourse/{id}")
		   public String cdeleteaction(@PathVariable("id") int cid)
		   {
			   adminService.deletecourse(cid);
			   return "redirect:/admin/all-courses";
		   }
			 
		   
		 
		  @GetMapping("admin/edit-student")
	      public ModelAndView updatestudentprofile(HttpServletRequest request, @RequestParam("id") int sid)
	      {
			 HttpSession session=request.getSession();  
			 int aid=(int)session.getAttribute("aid"); 
			 String aname=(String) session.getAttribute("aname");  
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("admin/edit-student");
	        mv.addObject("aid", aid);
	        mv.addObject("aname", aname);
	        
	        
	        Student s = adminService.viewstudentbyid(sid);
	        
	        mv.addObject("s", s);
	        
	        return mv;
	      }
	      
	      @PostMapping("admin/updatestudent")
	      public ModelAndView updateaction(HttpServletRequest request,@RequestParam("studentimg") MultipartFile file) throws IOException, SerialException, SQLException
	      {
	        String msg = null;
	        
	        ModelAndView mv = new ModelAndView();
	        
	        HttpSession session = request.getSession();
	        
	        mv.addObject("aid", session.getAttribute("aid"));
	        mv.addObject("aname", session.getAttribute("aname"));
	        
	        
	       try
	       {
	            String fname = request.getParameter("studentfname");
	        String lname = request.getParameter("studentlname");
	        String email = request.getParameter("studentemail");
	        String regdate = request.getParameter("studentregdate");
	        String pwd = request.getParameter("studentpass");
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
	        s.setPassword(pwd);
	        s.setRegdate(regdate);
	        s.setYear(year);
	        s.setStudentimg(blob);
	          
	          
	          msg = adminService.updatestudent(s);
	          
	          mv.setViewName("admin/displaymsg");
	          mv.addObject("message",msg);
	         
	       }
	       catch(Exception e)
	       {
	          msg = e.getMessage();
	         
	          mv.setViewName("admin/edit-student");
	          mv.addObject("message",msg);
	       }
	     
	    return mv;

	   }
	      
	      @GetMapping("admin/edit-professor")
	      public ModelAndView updatefacultyprofile(HttpServletRequest request, @RequestParam("id") int fid)
	      {
	    	  HttpSession session=request.getSession();
	    	  int aid=(int)session.getAttribute("aid"); 
	    	 String aname=(String) session.getAttribute("aname");  
	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("admin/edit-professor");
	        mv.addObject("aid", aid);
	        mv.addObject("aname", aname);
	        
	        Faculty f= adminService.viewfacultybyid(fid);
	        mv.addObject("p", f);
	        
	        return mv;
	      }
	      
	      @PostMapping("admin/updatefaculty")
	      public ModelAndView updateaction1(HttpServletRequest request,@RequestParam("facultyimg") MultipartFile file) throws IOException, SerialException, SQLException
	      {
	        String msg = null;
	        
	        ModelAndView mv = new ModelAndView();
	        
	        HttpSession session = request.getSession();
	        
	        mv.addObject("aid", session.getAttribute("aid"));
	        mv.addObject("aname", session.getAttribute("aname"));
	        
	        
	       try
	       {
	            String fname = request.getParameter("facultyfname");
	        String lname = request.getParameter("facultylname");
	        String email = request.getParameter("facultyemail");
	        String jod = request.getParameter("facultyjod");
	        String pwd = request.getParameter("facultypass");
	        String id = request.getParameter("facultyid");
	        int sid=Integer.parseInt(id);
	    
	        String deg = request.getParameter("facultydeg");
	        String gender = request.getParameter("facultygender");
	        String mobile = request.getParameter("facultymobile");
	        String dept = request.getParameter("facultydept");
	        String sal = request.getParameter("facultysal");
	        double fsal=Double.parseDouble(sal);
	        
	        String address = request.getParameter("facultyaddress");
	        String dob = request.getParameter("facultydob");
	        
	        byte[] bytes = file.getBytes();
			Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	        
	        Faculty f=new Faculty();
	        f.setFirstname(fname);
	        f.setLastname(lname);
	        f.setEmail(email);
	        f.setJoiningdate(jod);
	        f.setPassword(pwd);
	        f.setId(sid);
	        f.setDesignation(deg);
	        f.setGender(gender);
	        f.setContact(mobile);
	        f.setDepartment(dept);
	        f.setSalary(fsal);
	        f.setAddress(address);
	        f.setDateofbirth(dob);
	        f.setFacultyimg(blob);
	          
	          
	          msg = adminService.updatefaculty(f);
	          
	          mv.setViewName("admin/displaymsg");
	          mv.addObject("message",msg);
	         
	       }
	       catch(Exception e)
	       {
	          msg = e.getMessage();
	         
	          mv.setViewName("admin/displayerror");
	          mv.addObject("message",msg);
	       }
	     
	    return mv;

	   }
	      
	      @GetMapping("admin/edit-courses")
	      public ModelAndView updatecourses(HttpServletRequest request, @RequestParam("id") int cid)
	      {
	    	  
	    	ModelAndView mv = new ModelAndView();
	    	mv.setViewName("admin/edit-courses");
	    	
	    	Course c= adminService.viewcoursebyid(cid);
	    	mv.addObject("c", c);
	    	
	    	List<Document> doc = adminService.viewDocumentByCode(c.getCode());
			mv.addObject("docs", doc);

	    	
	    	List<Faculty> professors =  adminService.viewallfaculty();
	    	mv.addObject("professors", professors);
	    	
	    	HttpSession session=request.getSession(); 
	    	int aid=(int)session.getAttribute("aid"); 
	        mv.addObject("aid", aid);
	        
	        
	        
	        return mv;
	      }
	      
	      @PostMapping("admin/updatecourses")
	      public ModelAndView updateaction3(HttpServletRequest request, @RequestParam("courseimage") MultipartFile courseImage,
			        @RequestParam("files") MultipartFile[] documentFiles) throws IOException, SerialException, SQLException
	      {
	        String msg = null;
	        
	        ModelAndView mv = new ModelAndView();
		    try 
		    {
		        String code = request.getParameter("coursecode");
		        String title = request.getParameter("coursetitle");
		        String description = request.getParameter("coursedetails");
		        String department = request.getParameter("coursedept");
		        String prof = request.getParameter("professor");
		        int profId = Integer.parseInt(prof);
		        
		        String id = request.getParameter("courseid");
				int cid=Integer.parseInt(id);
		        
		        // Process the course image
		        byte[] imageBytes = courseImage.getBytes();
		        Blob imageBlob = new javax.sql.rowset.serial.SerialBlob(imageBytes);
		        
		        // Create a Course object
		        Course course = new Course();
		        course.setCode(code);
		        course.setTitle(title);
		        course.setDescription(description);
		        course.setDepartment(department);
		        course.setFaculty(adminService.viewfacultybyid(profId));
		        course.setCimage(imageBlob);
		        course.setId(cid);
		        
		        // Save course information to the database
		        msg = adminService.updatecourse(course);
		        
		        // Process and save associated document files
		        for (MultipartFile documentFile : documentFiles) 
		        {
		        	if (documentFile != null && !documentFile.isEmpty()) {
		            Document d = new Document();
		            String category = request.getParameter("coursetype");
		            d.setCourseocde(code);
		            d.setDocName(documentFile.getOriginalFilename());
		            d.setDocType(documentFile.getContentType());
		            d.setDocCategory(category);
		            
		            try {
	                    byte[] fileBytes = documentFile.getBytes();
	                    d.setData(fileBytes);
	                    adminService.addDocument(d);
	                } catch (IOException e) {
	                    // Handle the exception if necessary
	                    e.printStackTrace();
	                }
	              }
		        } 
		        mv.setViewName("admin/displaymsg");
		        mv.addObject("message", msg);
		    } 
		    
		    catch (Exception e) 
		    {
		        msg = e.getMessage();
		        mv.setViewName("admin/displayerror");
		        mv.addObject("message", msg);
		    }
		    
		    return mv;

	   }
	      
	      @GetMapping("admin/student-issue")
	  	public ModelAndView studentissue(HttpServletRequest request)
	  	{
	    	  HttpSession session=request.getSession();   
	    	  int aid=(int)session.getAttribute("aid"); 
	    	 String aname=(String) session.getAttribute("aname");  
	  		ModelAndView mv=new ModelAndView();
	  		mv.setViewName("admin/student-issue");
	  		mv.addObject("aid", aid);
	  		mv.addObject("aname", aname);
	  		
	  		List<SContact> scontact=adminService.viewallscontacts();
	  		
	  		mv.addObject("scontact", scontact);
	  		return mv;
	  	}
	      
	      @GetMapping("admin/deletescontact")
	  	public ModelAndView deletescontact()
	  	{
	  	    ModelAndView mv = new ModelAndView();
	  	    mv.setViewName("admin/student-issue");
	  	     
	  	    List<SContact> scontact =  adminService.viewallscontacts();
	  	     
	  	    mv.addObject("scontact", scontact);
	  	     
	  	    return mv;
	  	 }
	  	 @GetMapping("admin/deletescontact/{id}")
	  	 public String scdeleteaction(@PathVariable("id") int scid)
	  	 {
	  	     adminService.deletescontact(scid);
	  	     return "redirect:/admin/student-issue";
	  	 }
	  	 
	  	 
	  	    
	  	    @GetMapping("admin/professor-issue")
	  		public ModelAndView facultyissue(HttpServletRequest request)
	  		{
	  	    	HttpSession session=request.getSession();
	  	        
	  	    	int aid=(int)session.getAttribute("aid"); 
	  	    	String aname=(String) session.getAttribute("aname");
	  			ModelAndView mv=new ModelAndView();
	  			mv.setViewName("admin/professor-issue");
	  			mv.addObject("aid", aid);
	  			mv.addObject("aname", aname);
	  			List<FContact> fcontact=adminService.viewallfcontacts();
	  			
	  			mv.addObject("fcontact", fcontact);
	  			return mv;
	  		}
	  	    
	  	    @GetMapping("admin/deletefcontact")
	  		public ModelAndView deletefcontact()
	  		{
	  		    ModelAndView mv = new ModelAndView();
	  		    mv.setViewName("admin/professor-issue");
	  		     
	  		    List<FContact> fcontact =  adminService.viewallfcontacts();
	  		     
	  		    mv.addObject("fcontact", fcontact);
	  		     
	  		    return mv;
	  		 }
	  	    
	  		 @GetMapping("admin/deletefcontact/{id}")
	  		 public String fcdeleteaction(@PathVariable("id") int fcid)
	  		 {
	  		     adminService.deletefcontact(fcid);
	  		     return "redirect:/admin/professor-issue";
	  		 }   
	  		 
	  	  @GetMapping("admin/add-admin")
	  	  public ModelAndView addadmin(HttpServletRequest request)
	  	  {
	  		HttpSession session=request.getSession(); 
	  		 int aid=(int)session.getAttribute("aid"); 
	  		String aname=(String) session.getAttribute("aname"); 
	  	     ModelAndView mv = new ModelAndView();
	  	     mv.setViewName("admin/add-admin");
	  	     mv.addObject("aid", aid);
	  	     mv.addObject("aname", aname);
	  	     return mv;
	  	  }
	  	  
	  	  @PostMapping("admin/insertadmin")
	  	  public ModelAndView insertadmin(HttpServletRequest request,@RequestParam("adminimg") MultipartFile file) throws IOException, SerialException, SQLException
	  	  {
	  	    ModelAndView mv=new ModelAndView();
	  	    
	  	    String msg=null;
	  	    try
	  	    {
	  	      String name = request.getParameter("adminname");
	  	      String role = request.getParameter("adminrole");
	  	      String email = request.getParameter("adminemail");
	  	      String about = request.getParameter("adminabout");
	  	      String pwd = request.getParameter("adminpass");
	  	      String id = request.getParameter("adminid");
	  	      int aid=Integer.parseInt(id);
	  	  
	  	      String gender = request.getParameter("admingender");
	  	      String mobile = request.getParameter("adminmobile");
	  	      String github = request.getParameter("admingithub");
	  	      String insta = request.getParameter("admininsta");
	  	      String linkedin = request.getParameter("adminlinkedin");
	  	      String address = request.getParameter("adminaddress");
	  	      
	  	      byte[] bytes = file.getBytes();
	  	      Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	  	      
	  	      Admin a=new Admin();
	  	      a.setName(name);
	  	      a.setRole(role);
	  	      a.setAbout(about);
	  	      a.setEmail(email);
	  	      a.setPassword(pwd);
	  	      a.setId(aid);
	  	      a.setGender(gender);
	  	      a.setContact(mobile);
	  	      a.setGithub(github);
	  	      a.setInsta(insta);
	  	      a.setLinkedin(linkedin);
	  	      a.setAddress(address);
	  	      a.setAdminimg(blob);
	  	      
	  	      msg = adminService.addAdmin(a); 
	  	      
	  	      adminService.sendEmaila(adminMail, email, id, pwd); //student
	  	      
	  	      mv.setViewName("admin/displaymsg");
	  	      mv.addObject("message",msg);
	  	    }
	  	    catch(Exception e)
	  	    {
	  	      msg=e.getMessage();
	  	      mv.setViewName("admin/displayerror");
	  	      mv.addObject("message",msg);
	  	    }
	  	    return mv;
	  	  }
	 
	  	@GetMapping("admin/profile") // URI & method name can be different
	      public ModelAndView adminprofile(HttpServletRequest request)
	      {
	        HttpSession session=request.getSession();
	        
	        int aid=(int)session.getAttribute("aid"); 
	        String aname=(String) session.getAttribute("aname");
	        
	          ModelAndView mv = new ModelAndView();
	          mv.setViewName("admin/profile");
	           
	          mv.addObject("aid", aid);
	          mv.addObject("aname", aname);
	          Admin a = adminService.viewadminbyid(aid);
	          
	         
	            
	          mv.addObject("a", a);
	          
	          return mv;
	      }
	     
	        @PostMapping("admin/updateadminprofile")
	        public ModelAndView updateaction5(HttpServletRequest request,@RequestParam("adminimg") MultipartFile file) throws IOException, SerialException, SQLException
	        {
	          String msg = null;
	          
	          ModelAndView mv = new ModelAndView();
	          
	          HttpSession session = request.getSession();
	        
	          mv.addObject("aid", session.getAttribute("aid"));
	          mv.addObject("aname", session.getAttribute("aname"));
	          
	          
	         try
	         {
	              String name = request.getParameter("adminname");
	      String role = request.getParameter("adminrole");
	      String email = request.getParameter("adminemail");
	      String about = request.getParameter("adminabout");
	      String id = request.getParameter("adminid");
	          int aid=Integer.parseInt(id);
	  
	      String gender = request.getParameter("admingender");
	      String mobile = request.getParameter("adminmobile");
	      String github = request.getParameter("admingithub");
	      String insta = request.getParameter("admininsta");
	      String linkedin = request.getParameter("adminlinkedin");
	      String address = request.getParameter("adminaddress");
	      
	      byte[] bytes = file.getBytes();
	      Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
	      
	      Admin a=new Admin();
	      a.setName(name);
	      a.setId(aid);
	      a.setRole(role);
	      a.setAbout(about);
	      a.setEmail(email);
	      a.setGender(gender);
	      a.setContact(mobile);
	      a.setGithub(github);
	      a.setInsta(insta);
	      a.setLinkedin(linkedin);
	      a.setAddress(address);
	      a.setAdminimg(blob);
	          
	      
	          Admin ad = adminService.viewadminbyid(aid);
	          a.setPassword(ad.getPassword());
	          msg = adminService.updateadmin(a);
	            
	            mv.setViewName("admin/displaymsg");
	            mv.addObject("message",msg);
	           
	         }
	         catch(Exception e)
	         {
	            msg = e.getMessage();
	           
	            mv.setViewName("admin/displayerror");
	            mv.addObject("message",msg);
	         }
	       
	      return mv;

	     }
	        
	        @GetMapping("admin/displayadminimage")
	        public ResponseEntity<byte[]> displayadminimagedemo(@RequestParam("id") int id) throws IOException, SQLException
	        {
	          Admin admin = adminService.viewadminbyid(id);
	          byte [] imageBytes = null;
	          imageBytes = admin.getAdminimg().getBytes(1,(int) admin.getAdminimg().length()); 	
	          return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	        }
	        
	        @GetMapping("displayadminimage")
	        public ResponseEntity<byte[]> displayadminimage(@RequestParam("id") int id) throws IOException, SQLException
	        {
	          Admin admin = adminService.viewadminbyid(id);
	          byte [] imageBytes = null;
	          imageBytes = admin.getAdminimg().getBytes(1,(int) admin.getAdminimg().length()); 	
	          return ResponseEntity.ok().contentType(MediaType.IMAGE_JPEG).body(imageBytes);
	        }
	        
	        
	        @PostMapping("admin/updateadminpassword")
	        public ModelAndView updateadminpassword(HttpServletRequest request)
	        {
	          String msg = null;
	          
	          ModelAndView mv = new ModelAndView();
	          
	          HttpSession session = request.getSession();
	        
	          int aid=(int)session.getAttribute("aid");
	          mv.addObject("aid", session.getAttribute("aid"));
	          mv.addObject("aname", session.getAttribute("aname"));
	          
	          
	         try
	         {
	           Admin ad = adminService.viewadminbyid(aid);      
	         String pwd = request.getParameter("currentpassword");
	         String pwd1 = request.getParameter("newpassword");
	         String pwd2 = request.getParameter("renewpassword");
	       
	       if(ad.getPassword().equals(pwd) && pwd1.equals(pwd2))
	       {
	         ad.setPassword(pwd1);
	           msg = adminService.updatepassword(ad);
	              
	           mv.setViewName("admin/displaymsg");
	             mv.addObject("message",msg); 
	       }
	       else
	       {
	         msg = "Error in Updating Password";
	              
	           mv.setViewName("admin/displayerror");
	             mv.addObject("message",msg); 
	       } 
	         }
	         catch(Exception e)
	         {
	            msg = e.getMessage();
	           
	            mv.setViewName("admin/displayerror");
	            mv.addObject("message",msg);
	         }
	       
	      return mv;

	     }
	        
	   @GetMapping("admin/logout")
	   public ModelAndView logout1()
	   {
	   	  ModelAndView mv = new ModelAndView();
	   	  mv.setViewName("admin/index");
	   	  mv.addObject("message", "Logout Successfully");
	   	  return mv;
	   }     
	  
	   @GetMapping("admin/StudentRegisteredCourses")
		public ModelAndView StudentRegisteredCourses(HttpServletRequest request)
		{
			HttpSession session=request.getSession();
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/StudentRegisteredCourses");
			mv.addObject("aid", aid);
			mv.addObject("aname", aname);
			
			List<StudentCourseMapping> scm = adminService.viewallStudentCourseMapping();
			mv.addObject("scmdata", scm);
			return mv;
		}
	   
	   @GetMapping("admin/deleteStudentRegisteredCourses")
	    public ModelAndView deleteStudentRegisteredCourses()
		{
			  ModelAndView mv = new ModelAndView();
			  mv.setViewName("admin/StudentRegisteredCourses");
			     
			  List<StudentCourseMapping> scm = adminService.viewallStudentCourseMapping();
			     
			  mv.addObject("scmdata", scm);
			     
			  return mv;
		 }
	  
	  @GetMapping("admin/deleteStudentRegisteredCourses/{id}")
	   public String cdeleteaction1(@PathVariable("id") int scmid)
	   {
		   StudentCourseMapping scm=adminService.viewallStudentCourseMappingbyid(scmid);
		   scm.setCourse(null);
		   scm.setStudent(null);
		   adminService.deleteStudentRegisteredCourses(scmid);
		   return "redirect:/admin/StudentRegisteredCourses";
	   }
	  
	  @GetMapping("admin/FacultyRegisteredCourses")
		public ModelAndView FacultyRegisteredCourses(HttpServletRequest request)
		{
			HttpSession session=request.getSession();
			int aid=(int)session.getAttribute("aid"); 
			String aname=(String) session.getAttribute("aname");
			ModelAndView mv=new ModelAndView();
			mv.setViewName("admin/FacultyRegisteredCourses");
			mv.addObject("aid", aid);
			mv.addObject("aname", aname);
			
			List<Course> courses=adminService.viewallcourses();
			mv.addObject("courses", courses);
			return mv;
		}
	   
	   @GetMapping("admin/deleteFacultyRegisteredCourses")
	    public ModelAndView deleteFacultyRegisteredCourses()
		{
			  ModelAndView mv = new ModelAndView();
			  mv.setViewName("admin/StudentRegisteredCourses");
			     
			  List<Course> c = adminService.viewallcourses();
			     
			  mv.addObject("courses", c);
			     
			  return mv;
		 }
	  
	  @GetMapping("admin/deleteFacultyRegisteredCourses/{id}")
	   public String cdeleteaction2(@PathVariable("id") int fid)
	   {
		   adminService.deletecourse(fid);
		   return "redirect:/admin/FacultyRegisteredCourses";
	   }
	  
	  @GetMapping("admin/download")
	  public ResponseEntity<ByteArrayResource> downloadFile2(@RequestParam int id)
	  {
			Document doc = (Document) adminService.viewdocumentbyid(id);
			return ResponseEntity.ok()
					.contentType(MediaType.parseMediaType(doc.getDocType()))
					.header(HttpHeaders.CONTENT_DISPOSITION,"attachment:filename=\""+doc.getDocName()+"\"")
					.body(new ByteArrayResource(doc.getData()));
	  }
	  
	  @GetMapping("admin/deletematerial")
	  public ModelAndView deletematerial()
		{
			  ModelAndView mv = new ModelAndView();
			  mv.setViewName("admin/edit-courses");
			     
			  return mv;
		 }
	  
	  @GetMapping("admin/deletematerial/{id}")
	   public String cdeleteaction4(@PathVariable("id") int mid)
	   {
		   adminService.deletematerial(mid);
		   return "redirect:/admin/all-courses";
	   }
	  
}
