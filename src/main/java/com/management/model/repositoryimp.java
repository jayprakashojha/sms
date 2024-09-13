package com.management.controller;


import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class repositoryimp implements repositoryinterface {

	@Autowired
	public JdbcTemplate jt;
	
	public List<beean> findBySqlQuery(String sqlStr) {
		String q=sqlStr;
		return this.jt.query(q,BeanPropertyRowMapper.newInstance(beean.class));
	}

	@Override
	public void savadata(String fname,String fathname,String email,String mobile,String gender,String address,
			String jobtype,String cd,String enqury)
	{
		Connection connection=null;
		
		String query="insert into std_reg (name,fathername,email,mobile,Gender,District,qualification,category,purpose) values(?,?,?,?,?,?,?,?,?)";
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, fname);
			ps.setString(2, fathname);
			ps.setString(3, email);
			ps.setString(4, mobile);
			ps.setString(5, gender);
			ps.setString(6, address);
			ps.setString(7, jobtype);
			ps.setString(8, cd);
			ps.setString(9, enqury);
			ps.execute(); 
			connection.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public String savaRegistrationdata(String fname, String fathname, String email,String mob1,String dob1,String adhar1, String gender1,String cat1,
			String qualification1 ,String address1 ,
			String pin1,String job1 ,String classadmission1,MultipartFile file2,String pwd
			) 
	{
		
		Connection connection=null;
		System.out.println(job1+""+classadmission1);
		//String query="insert into Registration_Form values(?,?,?,?,?,?,?,?,?,?)";
		String query="insert into Registration_Form (name,fathername,email,mobile,dob,adhar,gender,category,"
				+ "qualification,address,pincode,job,classadmission,imagename,photo,password,occuptionstd) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Bean_Registration_form brf = new Bean_Registration_form();
			brf.setImagename(file2.getOriginalFilename());
			brf.setImage1(file2.getBytes());
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, fname);
			ps.setString(2, fathname);
			ps.setString(3, email);
			ps.setString(4, mob1);
			ps.setString(5, dob1);
			ps.setString(6, adhar1);
			ps.setString(7, gender1);
			ps.setString(8, cat1);
			ps.setString(9, qualification1);
			ps.setString(10, address1);
			ps.setString(11, pin1);
			ps.setString(12, job1);
			ps.setString(13, classadmission1);
			ps.setString(14, brf.imagename);
			ps.setBytes(15, brf.image1);
			ps.setString(16, pwd);
			ps.setString(17, "Student");
			
			ps.executeUpdate(); 
			connection.close();
			return"success";
			
		} catch (SQLException | IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return"success";


	}

	@Override
	public beean findregistrationdetail(String enqno) {
		beean obj = new beean();
		Connection connection=null;
		ResultSet rs=null;
		System.out.println(enqno);
		
		String query="select * from std_reg where id="+enqno+"";
		//String query="select * from std_reg where id=10";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			
			
			rs=ps.executeQuery();
			while(rs.next()){ 
				obj.setFirstName(rs.getString("name"));
				obj.setFathername(rs.getString("fathername"));
				obj.setEmail(rs.getString("email"));
				obj.setMobile(rs.getString("mobile"));
				
				obj.setAddress(rs.getString("District"));
				
				
				
				 
				}  
			
			System.out.println(obj);
			connection.close();
			return obj;
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		return obj;


		
	
	}

	@Override
	public void stdfeedbacksave(String stdname, String stdemail, String stdfeedback) {
    
		Connection connection=null;
		System.out.println(stdname+""+stdfeedback);

		String query="insert into std_feedback(Name,emailid,FeedBack) values(?,?,?)";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, stdname);
			ps.setString(2, stdemail);
			ps.setString(3, stdfeedback);
			 ps.executeUpdate();
				System.out.println("Success");
			connection.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		


		
	}

	@Override
	public void teacherfeedbacksave(String tname, String temail, String tcourse, String texp, String tfeedback) 
	{
		Connection connection=null;
		System.out.println(tname+""+temail);

		String query="insert into teacher_feedback(Name,EmailId,Course,TeachingExp,TFeedBack) values(?,?,?,?,?)";
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);
			
			ps.setString(1, tname);
			ps.setString(2, temail);
			ps.setString(3, tcourse);
			ps.setString(4, texp);
			ps.setString(5, tfeedback);
			 ps.executeUpdate();
				System.out.println("Success");
			connection.close();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		
	}

	@Override
	public Boolean loginteacherstd(String username1, String password1,String logintype1 ) 
	{
		loginmodel obj = new loginmodel();
		Connection connection=null;
		ResultSet rs=null;
		String query=null;
		String student="Student";
		String teacher = "Teacher";
		//String query1=null;
		System.out.println(logintype1);
		
		if(logintype1.equalsIgnoreCase(student))
		{
		
			System.out.println(logintype1);
		 query="select email,password from Registration_Form where email='"+username1+"' and password='"+password1+"'";
		 try {
				connection = jt.getDataSource().getConnection();
				PreparedStatement ps = connection.prepareStatement(query);			
				rs=ps.executeQuery();
				while(rs.next()){ 
					obj.setUsername(rs.getString("email"));
					obj.setPassword(rs.getString("password"));
					
					System.out.println("username and password is correct");
					
					return true;
					 
					}  
				
				
				 connection.close();
			
			}
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}

			return false;

		}
		if(logintype1.equalsIgnoreCase(teacher))
		{
			System.out.println(logintype1);
		 query="select email,password from teacher_registration_afterlogin where email='"+username1+"' and password='"+password1+"'";
		
		 try {
				connection = jt.getDataSource().getConnection();
				PreparedStatement ps = connection.prepareStatement(query);			
				rs=ps.executeQuery();
				while(rs.next()){ 
					obj.setUsername(rs.getString("email"));
					obj.setPassword(rs.getString("password"));
					
					System.out.println("username and password is correct");
					
					return true;
					 
					}  
				
				
				 connection.close();
			
			}
			catch (SQLException e) 
			{
				
				e.printStackTrace();
			}

			return false;

		}
		
		try {
			connection = jt.getDataSource().getConnection();
			PreparedStatement ps = connection.prepareStatement(query);			
			rs=ps.executeQuery();
			while(rs.next()){ 
				obj.setUsername(rs.getString("email"));
				obj.setPassword(rs.getString("password"));
				
				System.out.println("username and password is correct");
				
				return true;
				 
				}  
			
			
			 connection.close();
		
		}
		catch (SQLException e) 
		{
			
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public String savecertificate(String classnameofschool, MultipartFile lkg,String stdid) {
		String nursery1="NURSERY";
		String LKG1="LKG";
		String UKG1="UKG";
		String Class1="Class 1";
		String Class2="Class 2";
		String Class3="Class 3";
		String Class4="Class 4";
		String Class5="Class 5";
		String Class6="Class 6";
		String Class7="Class 7";
		String Class8="Class 8";
		String Class9="Class 9";
		String Class10="Class 10";
		String Class11="Class 11";
		String Class12="Class 12";

		
		certificatemodel cf = new certificatemodel();
		Connection connection=null;
		PreparedStatement ps;
				
		try {
		
			cf.setLkgname(lkg.getOriginalFilename());
			cf.setNursery(lkg.getBytes());
			
			String query="update certificate_upload set nurseryname=?,nurseryphoto=? where id=?";
			String querylkg="update certificate_upload set lkgname=?,lkgphoto=? where id=?";
			String queryukg="update certificate_upload set ukgname=?,ukgphoto=? where id=?";
			String queryClass1="update certificate_upload set firstname=?,firstphoto=? where id=?";
			String queryClass2="update certificate_upload set secondname=?,secondphoto=? where id=?";
			String queryClass3="update certificate_upload set thirdname=?,thirdphoto=? where id=?";
			String queryClass4="update certificate_upload set fourname=?,fourphoto=? where id=?";
			String queryClass5="update certificate_upload set fivename=?,fivephoto=? where id=?";
			String queryClass6="update certificate_upload set sixname=?,sixphoto=? where id=?";
			String queryClass7="update certificate_upload set sevenname=?,sevenphoto=? where id=?";
			String queryClass8="update certificate_upload set eightname=?, eightphoto=? where id=?";
			String queryClass9="update certificate_upload set ninename=?,ninephoto=? where id=?";
			String queryClass10="update certificate_upload set tenname=?,tenphoto=? where id=?";
			String queryClass11="update certificate_upload set elevenname=?,elevenphoto=? where id=?";
			String queryClass12="update certificate_upload set twelvename=?,twelvephoto=? where id=?";
			connection = jt.getDataSource().getConnection();
		

			if(nursery1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(query);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(LKG1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(querylkg);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);	
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(UKG1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryukg);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class1.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass1);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class2.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass2);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class3.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass3);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class4.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass4);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}

			if(Class5.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass5);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			
			if(Class6.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass6);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			
			if(Class7.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass7);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class8.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass8);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class9.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass9);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class10.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass10);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class11.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass11);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			if(Class12.equalsIgnoreCase(classnameofschool))
			{
		    ps = connection.prepareStatement(queryClass12);
			ps.setString(1, lkg.getOriginalFilename());
			ps.setBytes(2, lkg.getBytes());
			ps.setString(3, stdid);
			int b=	ps.executeUpdate(); 
			System.out.println("Good done "+b);
			}
			connection.close();
			return"success";
			
		} catch (SQLException | IOException e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return"success";

	
	
	
	}

	@Override
	public String teacherregistrationafterlogin(String name, String fathername, String email, String mob, String gender,
			String address, String sub1, String sub2, String sub3,String pwd) {
		
		Connection con;
		try {
			con=this.jt.getDataSource().getConnection();
			String query = "insert into teacher_registration_afterlogin(name,fathername,email,mob,gender,address,sub1,sub2,sub3,occuption,password) values(?,?,?,?,?,?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, fathername);
			ps.setString(3, email);
			ps.setString(4, mob);
			ps.setString(5, gender);
			ps.setString(6, address); 
			ps.setString(7, sub1);
			ps.setString(8, sub2);
			ps.setString(9, sub3);
			ps.setString(10, "Teacher");
			ps.setString(11, pwd);
			int b=ps.executeUpdate();
			System.out.println(b);
			con.close();
		
		} 
		  catch (SQLException e) 
		{
		  System.out.println(e);
			e.printStackTrace();
		}
			return "Data Inserted Successfully";
	}

	@Override
	public String getdetailofloginuser(String email,String logintype) {
		
		Connection con;
		String name=null;
		ResultSet rs = null;
		String query=null;
		String logintype1="Student";
		afterloginmodel lm= new afterloginmodel();
		
		if(logintype.equalsIgnoreCase(logintype1))
		{
		 query = "select name from Registration_Form where email='"+email+"'";
		//String query1 = "select name from Registration_Form where email='"+email+"'";
		try {
			con=this.jt.getDataSource().getConnection();
			PreparedStatement ps =con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				name = lm.setName(rs.getString("name"));
				System.out.println(name);
				return name;
				
			}
			
			con.close();
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			e.printStackTrace();
		}
		}
		else
		{
		 query = "select name from teacher_registration_afterlogin where email='"+email+"'";
			try {
				con=this.jt.getDataSource().getConnection();
				PreparedStatement ps =con.prepareStatement(query);
				rs=ps.executeQuery();
				while(rs.next())
				{
					name = lm.setName(rs.getString("name"));
					System.out.println(name);
					return name;
					
					
				}
				
				con.close();
			} 
			catch (SQLException e) 
			{
				System.out.println(e);
				e.printStackTrace();
			}
		}
		return name;
		
	}

	@Override
	public certificatemodel downloadcertificate(String classname1, String stdid) throws SQLException 
	{
	  String query ="select * from certificate_upload where id="+stdid+" ";
	  Connection con;
	  ResultSet rs;
	  String directoryPath = "D:/photo/";
	  File directory = new File(directoryPath);
	  byte [] buffer = new byte[2048];
		int bytesRead;
	  certificatemodel cm = new certificatemodel();
	  con=this.jt.getDataSource().getConnection();
	  PreparedStatement ps=con.prepareStatement(query);
	  rs=ps.executeQuery();
	  while(rs.next())
	  {
		  
		  System.out.println(classname1);
		  if(classname1.equalsIgnoreCase("NURSERY"))
		  {
			 
		    String filePath = directoryPath + rs.getString("nurseryname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("nurseryphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;
		  }
		  if(classname1.equalsIgnoreCase("LKG"))
		  {
		 // cm.setLkg(rs.getBytes("lkgphoto"));	
			  String filePath = directoryPath + rs.getString("lkgname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("lkgphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  
		
		  }
		  if(classname1.equalsIgnoreCase("UKG"))
		  {
		 // cm.setUkg(rs.getBytes("ukgphoto"));	
			  String filePath = directoryPath + rs.getString("ukgname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("ukgphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		 // return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 1"))
		  {
		 // cm.setFirst(rs.getBytes("firstphoto"));	
			  String filePath = directoryPath + rs.getString("firstname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("firstphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 2"))
		  {
		  //cm.setSecond(rs.getBytes("secondphoto"));
			  String filePath = directoryPath + rs.getString("secondname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("secondphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 3"))
		  {
		 // cm.setThird(rs.getBytes("thirdphoto"));	
			  String filePath = directoryPath + rs.getString("thirdname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("thirdphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 4"))
		  {
		 // cm.setFourth(rs.getBytes("fourphoto"));	
			  String filePath = directoryPath + rs.getString("fourname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("fourphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 5"))
		  {
		 // cm.setFifth(rs.getBytes("fivephoto"));	
			  String filePath = directoryPath + rs.getString("fivename"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("fivephoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  
		  if(classname1.equalsIgnoreCase("Class 6"))
		  {
		  //cm.setSix(rs.getBytes("sixphoto"));	
			  String filePath = directoryPath + rs.getString("sixname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("sixphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  
		  if(classname1.equalsIgnoreCase("Class 7"))
		  {
		  //cm.setSeven(rs.getBytes("sevenphoto"));	
			  String filePath = directoryPath + rs.getString("sevenname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("sevenphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 8"))
		  {
		 // cm.setEight(rs.getBytes("eightphoto"));	
			  String filePath = directoryPath + rs.getString("eightname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("eightphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		 // return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 9"))
		  {
		 // cm.setNine(rs.getBytes("ninephoto"));
			  String filePath = directoryPath + rs.getString("ninename"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("ninephoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		 // return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 10"))
		  {
		//  cm.setTen(rs.getBytes("tenphoto"));	
			  String filePath = directoryPath + rs.getString("tenname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("tenphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		 // return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 11"))
		  {
		 // cm.setEleven(rs.getBytes("elevenphoto"));
			  String filePath = directoryPath + rs.getString("elevenname"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("elevenphoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		 // return cm;
		  }
		  if(classname1.equalsIgnoreCase("Class 12"))
		  {
		  //cm.setTwelve(rs.getBytes("twelvephoto"));
			  String filePath = directoryPath + rs.getString("twelvename"); 
              
		       if (!directory.exists()) {
		            if (directory.mkdirs()) {
		                System.out.println("Directory created successfully.");
		            } else {
		                System.err.println("Failed to create directory.");
		                
		            }
		        }

			  
		 // cm.setNursery(rs.getBytes("nurseryphoto"));	
			  InputStream ip = rs.getBinaryStream("twelvephoto");
			 
		  try {
				
			while((bytesRead=ip.read(buffer))!=-1)
			{
				try (FileOutputStream fos = new FileOutputStream(filePath))
				{
				fos.write(buffer,0,bytesRead);
			    }
				 
			}
			
			
		} 
		  catch (IOException e) 
		  {
			System.out.println(e);
			e.printStackTrace();
		}
		  return cm;

		  //return cm;
		  }
	  }
	  

		
		
		return cm;
	}

	@Override
	public List<String> TeacherNamedata() {
		Connection con;
		ResultSet rs;
		List<String> teachername= new ArrayList<String>();
		//List<PermissionmenuGS> userlist = new ArrayList<PermissionmenuGS>();
		String query="select id,name from teacher_registration_afterlogin";
		try {
			con=this.jt.getDataSource().getConnection();
			PreparedStatement ps=con.prepareStatement(query);
			rs=ps.executeQuery();
			while(rs.next())
			{
				teachername.add(rs.getString("id"));
				teachername.add( rs.getString("name"));
							   
			}
		    con.close();
			return(teachername);
		} 
		catch (SQLException e) 
		{
			System.out.println(e);
			e.printStackTrace();
		}
		
		return teachername;
	}

	@Override
	public String subjectnameallocate(String tid, String sname,String classname) throws SQLException {
		 
		Connection con;
		con=this.jt.getDataSource().getConnection();
		
		System.out.println(classname);
		if(classname.equals("NURSERY"))
		{
			
		String query = "update teacher_registration_afterlogin set classnursery=? where id="+tid+"";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
		
		return "Recored Insert Successfully";
	 
     	}
		if(classname.equalsIgnoreCase("LKG"))
		{
		
		String query = "update teacher_registration_afterlogin set classlkg=? where id="+tid+"";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
	
		return "Recored Insert Successfully";
	 
		}
		if(classname.equalsIgnoreCase("UKG"))
		{
		String query = "update teacher_registration_afterlogin set classukg=? where id="+tid+"";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
		
		return "Recored Insert Successfully";
	 
		}
		if(classname.equalsIgnoreCase("Class 1"))
		{
		String query = "update teacher_registration_afterlogin set class1=? where id="+tid+"";
		
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
		
		return "Recored Insert Successfully";
	 
		}
		if(classname.equalsIgnoreCase("Class 2"))
		{
		String query = "update teacher_registration_afterlogin set class2=? where id="+tid+"";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
		
		return "Recored Insert Successfully";
	 
		}
		if(classname.equalsIgnoreCase("Class 3"))
		{
		String query = "update teacher_registration_afterlogin set class3=? where id="+tid+"";
		PreparedStatement ps = con.prepareStatement(query);
		ps.setString(1, sname);
		ps.executeUpdate();
		
		return "Recored Insert Successfully";
	 
		}
		if(classname.equalsIgnoreCase("Class 4"))
		{
		
			String query = "update teacher_registration_afterlogin set class4=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 5"))
		{
		
			String query = "update teacher_registration_afterlogin set class5=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 6"))
		{
		
			String query = "update teacher_registration_afterlogin set class6=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 7"))
		{
		
			String query = "update teacher_registration_afterlogin set class7=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 8"))
		{
		
			String query = "update teacher_registration_afterlogin set class8=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 9"))
		{
		
			String query = "update teacher_registration_afterlogin set class9=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 10"))
		{
		
			String query = "update teacher_registration_afterlogin set class10=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 11"))
		{
		
			String query = "update teacher_registration_afterlogin set class11=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		if(classname.equalsIgnoreCase("Class 12"))
		{
		
			String query = "update teacher_registration_afterlogin set class12=? where id="+tid+"";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, sname);
			ps.executeUpdate();
			
			return "Recored Insert Successfully";
		 
		}
		
				
		
		return "Recoreded Successfully";
	}

}