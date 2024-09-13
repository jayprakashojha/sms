package com.management.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface repositoryinterface {

	//public abstract List<beean> findBySqlQuery(String paramString);
		public void savadata(String fname,String fathname,String email,String mobile, String gender, String address,
				String jobtype,String cd,String enqury);
		public String savaRegistrationdata(String fname,String fathname,String email,String mob1, String dob1
				,String adhar1,String gender1,String cat1,String qualification1 ,String address1 ,
				String pin1,String job1 ,String classadmission1,MultipartFile file2, String pwd
				);
		public beean findregistrationdetail(String enqno);
		public void stdfeedbacksave(String stdname, String stdemail, String stdfeedback);
		public void teacherfeedbacksave(String tname, String temail, String tcourse, String texp, String tfeedback);
		public Boolean loginteacherstd(String username1, String password1, String logintype1);

		
		public String savecertificate(String classname1, MultipartFile lkg, String stdid);
		public String teacherregistrationafterlogin(String name, String fathername, String email, String mob, String gender,
				String address, String sub1, String sub2, String sub3, String pwd);
		public String getdetailofloginuser(String email, String logintype);
		public certificatemodel downloadcertificate(String classname1, String stdid) throws SQLException;
		public List<String> TeacherNamedata();
		public String subjectnameallocate(String tid, String sname, String classname) throws SQLException, SQLException;
}
