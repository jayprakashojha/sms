package com.management.controller;




import java.awt.image.BufferedImage;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpSession;

//import javax.servlet.RequestDispatcher;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletOutputStream;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.xml.bind.DatatypeConverter;






@WebServlet("/redirect")
@Controller
@RequestMapping("/")
public class LoginController extends HttpServlet {

	@Autowired(required=true)
	private repositoryinterface daoobj;
	jakarta.servlet.http.HttpSession session;
	
	@RequestMapping("/login")
	public ModelAndView login(ModelAndView mv)
	{
		mv.setViewName("login");
		return mv;
	}
	
	@RequestMapping("/Uploadcertificates")
	public ModelAndView Uploadcertificates(ModelAndView mv)
	{
		mv.setViewName("fileUpload");
		return mv;
	}
	
	@RequestMapping("/AllocationSubjectTeacher")
	public ModelAndView AllocationSubjectTeacher(ModelAndView mv)
	{
		mv.setViewName("AllocationSubjectTeacher");
		return mv;
	}
	
	 
	
	
	
	
	@RequestMapping("/attendence")
	public ModelAndView lattendenceogin(ModelAndView mv)
	{
		mv.setViewName("attendence");
		return mv;
	}
	
	
	
	@PostMapping("/sendtocontroller")
	@ResponseBody
    public String handlePostRequest(@RequestBody @RequestParam("name2") String fname,
    		@RequestParam("email") String email,@RequestParam("mobile") String mobile,
    		@RequestParam("gender") String gender,@RequestParam("address") String address,
    		@RequestParam("jobtype") String jobtype,@RequestParam("cd") String cd,@RequestParam("enqury") String enqury,
    		@RequestParam("fathname") String fathname,ModelAndView mv) 
	{
		
        
       
        this.daoobj.savadata(fname,fathname,email,mobile,gender,address,jobtype,cd,enqury);
       // System.out.println(b);
        return "success";

	
	}
	@RequestMapping("/index")
	public ModelAndView index(ModelAndView mv)
	{
		
		mv.setViewName("index");
		return mv;
	}
	
	@RequestMapping("/TeacherRegistration")
	public ModelAndView TeachersRegistration(ModelAndView mv)
	{
		
		mv.setViewName("TeacherRegistration");
		return mv;
	}
	@RequestMapping("/fileDownload")
	public ModelAndView fileDownload(ModelAndView mv)
	{
	
		mv.setViewName("fileDownload");
		return mv;
	}
	
	@RequestMapping("/enquery")
	public ModelAndView Enquery(ModelAndView mv)
	{
		mv.setViewName("Enquery");
		return mv;
	}
	
	@RequestMapping("/RegistraionStudent")
	public ModelAndView RegistrationStudent(ModelAndView mv)
	{
		
		mv.setViewName("RegistraionStudent");
		return mv;
	}
	@RequestMapping("/RegistrationFormInserte")
	@ResponseBody
	public String Registrationform(@RequestBody @RequestParam("name") String fname,
    			@RequestParam("fname") String fathname,@RequestParam("email") String email,
    			@RequestParam("mob") String mob1,@RequestParam("dob") String dob1,
    			@RequestParam("adhar") String adhar1,@RequestParam("gender") String gender1,
    			@RequestParam("cat") String cat1,@RequestParam("qualification") String qualification1,
    			@RequestParam("address") String address1,@RequestParam("pin") String pin1,
    			@RequestParam("job") String job1,@RequestParam("admissionclass") String classadmission1,
    			@RequestParam("file2") MultipartFile file2) 
	
	
	{
		System.out.println(pin1);
		System.out.println(file2.getOriginalFilename());
       
		//PasswordGenerate pd = new PasswordGenerate();
		String pwd=PasswordGenerate.generateRandomString(10);
		
       String b= this.daoobj.savaRegistrationdata(fname,fathname,email,mob1,dob1,adhar1,gender1,cat1,qualification1
    		   ,address1,pin1,job1,classadmission1,file2,pwd);
        
        System.out.println(b); 
       // String pwd=PasswordGenerate.generateRandomString(10);
        return pwd;

	
	}
	
	@RequestMapping("/showregistrationdetail")
	@ResponseBody
	public beean showregistrationdetail(@RequestParam("enqid") String enqno)
	{
		
		beean lis=this.daoobj.findregistrationdetail(enqno);
		System.out.println(lis);
		return lis;
	}
	
	@RequestMapping("/Pay_Fees_Page")
	public ModelAndView Pay_Fees_Page(ModelAndView mv)
	{
		mv.setViewName("Pay_Fees_Page");
		return mv;
	}
	
	
	
	@RequestMapping("/teacherafterlogin")
	public ModelAndView teacherafterlogin(ModelAndView mv)
	{
		mv.setViewName("teacherafterlogin");
		return mv;
	}
	
	@RequestMapping("/teacherregistration")
	@ResponseBody
	public String teacherregistration(@RequestParam("name") String name,@RequestParam("fathername") String fathername,
			@RequestParam("email") String email,@RequestParam("mob") String mob,@RequestParam("gender") String gender,
			@RequestParam("address") String address,@RequestParam("sub1") String sub1,@RequestParam("sub2") String sub2,
			@RequestParam("sub3") String sub3
			)
	{
		String pwd=PasswordGenerate.generateRandomString(10);
		String msg= this.daoobj.teacherregistrationafterlogin(name,fathername,email,mob,gender,address,sub1,sub2,sub3,pwd);
	    System.out.println("&&&&"+msg);
	    //String pwd=PasswordGenerate.generateRandomString(10);
	    System.out.println("passwordhhhh"+pwd);
		return pwd;
	}
	
	
	@RequestMapping("/Afterstudentlogin")
	public ModelAndView Afterstudentlogin(ModelAndView mv)
	{
		mv.setViewName("Afterstudentlogin");
		return mv;
	}
	@RequestMapping("/teacherFeedback")
	public ModelAndView teacherFeedback(ModelAndView mv)
	{
		mv.setViewName("teacherFeedback");
		return mv;
	}
	@RequestMapping("/studentFeedback")
	public ModelAndView studentFeedback(ModelAndView mv)
	{
		mv.setViewName("studentFeedback");
		return mv;
	}
	
	@PostMapping(value="/fbsendtoserver")
	@ResponseBody
	public void stdfeedback(@RequestParam("stdname1") String stdname,@RequestParam("stdemail1") String stdemail,@RequestParam("feedback1") String stdfeedback)
    {
		System.out.println(stdname);
		System.out.println(stdemail);
		System.out.println(stdfeedback);
    	this.daoobj.stdfeedbacksave(stdname,stdemail,stdfeedback);
    }
	
	@PostMapping(value="/teacherfbsendtoserver")
	@ResponseBody
	public void teacherfeedback(@RequestParam("tname1") String tname,@RequestParam("temail1") String temail,
			@RequestParam("tcourse1") String tcourse,@RequestParam("text1") String texp,@RequestParam("feedback1") String tfeedback)
    {
		System.out.println(tname);
		System.out.println(temail);
		System.out.println(tcourse);
		System.out.println(texp);
		System.out.println(tfeedback);
    	this.daoobj.teacherfeedbacksave(tname,temail,tcourse,texp,tfeedback);
    }
	
	@RequestMapping(value="/loginsercall")
	@ResponseBody
	public Boolean  loginsercall(HttpServletRequest req, Model model, HttpServletResponse resp,@RequestParam("username") String username1,@RequestParam("password") String password1,@RequestParam("logintype") String logintype1) throws IOException, ServletException
	{
		
		System.out.println("hhhhhhhhhhhh"+username1);
		System.out.println(password1);
		 
        
		Boolean b=this.daoobj.loginteacherstd(username1,password1,logintype1);
		if(b==true)
		{
       
		 session = req.getSession(true);
		session.setAttribute("user", username1);
	
		System.out.println("user name hego    "+session.getAttribute("user"));
		return b;
		}
		else
		{
			return false;
		}
		
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	    session.invalidate();
	    return "redirect:/login";
	}
	
	@PostMapping("/getDetailbyemialid")
	@ResponseBody
	public String getDetailbyemialid(@RequestParam("email") String email,@RequestParam("logintype") String logintype)
	{
		System.out.println("****"+email+"and ddddd&&& "+logintype);
		String msg = this.daoobj.getdetailofloginuser(email,logintype);
		
		return msg;
	}

	@PostMapping("/savecertificate")
	@ResponseBody
	public String savecertificate(@RequestParam("classname1") String classname1,@RequestParam("certificate1") MultipartFile lkg,@RequestParam("stdid2") String stdid)
	{
		
		System.out.println("ok");
		String msg = this.daoobj.savecertificate(classname1,lkg,stdid);
		
		return msg;
	}
	
	@PostMapping("/DownloadCertificate")
	@ResponseBody
	public String DownloadCertificate(HttpServletResponse response,@RequestParam("classname1") String classname1,@RequestParam("stdid2") String stdid) throws SQLException
	{
		
		
		certificatemodel cert = this.daoobj.downloadcertificate(classname1,stdid);
	    
		       System.out.println(cert);
		       
		      		
		return null;
	}
	
	@GetMapping("/getTeacherName")
	@ResponseBody
	public List<String> getTeacherName() 
	{
		
		
		List<String> teacherdata = this.daoobj.TeacherNamedata();
	    
		return teacherdata;
	}

	
	@PostMapping("/subjectnameallocate")
	@ResponseBody
	public String subjectnameallocate(@RequestParam("teacherid1") String tid,@RequestParam("sname1") String sname,@RequestParam("classname1") String classname) throws SQLException
	{
		
		System.out.println(tid+""+sname);
		String teacherdata = this.daoobj.subjectnameallocate(tid,sname,classname);
	    
		return teacherdata;
	}
	
	 @GetMapping("/logout")
	    public String logout(HttpServletRequest request) {
	        // Invalidate the session
	        request.getSession().invalidate();
	        
	        // Redirect to login or home page
	        return "redirect:/login?logout";
	    }
	 
		
		 @PostMapping(value ="/DashboardLogin")
		 @ResponseBody
		 public String teacherafterlogin1(ModelAndView mv,HttpServletRequest req,HttpServletResponse res) throws Exception 
		 { 
			 System.out.println("$$$$$$$$");
			// String username=null;
			String username= (String) session.getAttribute("user");
		  System.out.println("$$$$$$$$$$$$$    "+username);
			 if(username!=null)
			 {
				 System.out.println("success validation for login");
				 return "good";
			 }
		//	RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/views/index.jsp");
		//rd.forward(req, res);
//	return "login.jsp";
		//res.sendRedirect("index.jsp");
			 else
			 {
		   return null;
			 }
			
}		 }
		


