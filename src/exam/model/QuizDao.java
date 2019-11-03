package exam.model;
import java.io.PrintWriter;
import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

import exam.db.Pojo_class;
import exam.db.Provider;
public class QuizDao {
	public static String username;
	
	public static int addNewQuestion(Pojo_class pc) {
		int status = 0;
		
		try
		{
			Connection con =Provider.getMysqlConnection();
			String sql="insert into "+pc.getSub()+" (qus,opt1,opt2,opt3,opt4,ans) values(?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, pc.getQus());
			pst.setString(2, pc.getOpt1());
			pst.setString(3, pc.getOpt2());
			pst.setString(4, pc.getOpt3());
			pst.setString(5, pc.getOpt4());
			pst.setInt(6, pc.getAns());
			status = pst.executeUpdate();
		}
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
		return status;
	}
	public static ArrayList<Pojo_class>  getAllRecords (String sub)
	{
		
		ArrayList<Pojo_class> allQus = new ArrayList<Pojo_class>();
		try 
		{
			Connection con=Provider.getMysqlConnection();
			String sql="select * from "+sub;
			PreparedStatement pst  = con.prepareStatement(sql);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				Pojo_class e = new Pojo_class();
				e.setSlno(rs.getInt(1));
				e.setQus(rs.getString(2));
				e.setOpt1(rs.getString(3));
				e.setOpt2(rs.getString(4));
				e.setOpt3(rs.getString(5));
				e.setOpt4(rs.getString(6));
				e.setAns(rs.getInt(7));
				allQus.add(e);
			}
		 
		} 
		catch (Exception e2) 
		{
			e2.printStackTrace();
			
		}
		return allQus;
	}
	public static int[] getAnswer(int len,String sub) {
		int status = 0;
		int arr[] = null;
		try
		{
			Connection con =Provider.getMysqlConnection();
			String sql="select ans from "+sub;
			PreparedStatement pst=con.prepareStatement(sql);
			arr=new int[len];
			int i=0;
			ResultSet rs=pst.executeQuery();
			while(rs.next())
			{
				arr[i++]=rs.getInt(1);
			}
		}
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
		
		return arr;
	}

	public static int checkUser(String name,String password,String check)
	{
		int val=Integer.parseInt(check);
		String db="";
		if(val==0)
		{
			db="users";
		}
		else
		{
			db="admins";
		}
		try 
		{
			Connection con=Provider.getMysqlConnection();
			String sql="select name from "+db+" where name= '"+name+"' and password= '"+password+"'";
			PreparedStatement pst  = con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			
			if(rs.next()) {
				username=rs.getString(1);
				return 1;
			
			}
			else
			{
      		return -1;
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return -2;
			
		}
		
	}
	public static String addUser(String name,String password,String db) {
		try 
		{
			Connection con=Provider.getMysqlConnection();
			String sql="insert into "+db+" (name,password) values ('"+name+"','"+password+"')";
			PreparedStatement pst  = con.prepareStatement(sql);
			int status = pst.executeUpdate();
			
			if(status==1){
		
				return "Added succesfully";
			
			}
			else
			{
      		return "User Name exists";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
			return "Username Already Exists";
			
		}
		
		
	}
	public static int update(Pojo_class pc) {
		int status = 0;
		
		try
		{
			Connection con =Provider.getMysqlConnection();
			String sql="update "+pc.getSub()+" set qus=?,opt1=?,opt2=?,opt3=?,opt4=?,ans=? where slno="+pc.getSlno()+"";
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, pc.getQus());
			pst.setString(2, pc.getOpt1());
			pst.setString(3, pc.getOpt2());
			pst.setString(4, pc.getOpt3());
			pst.setString(5, pc.getOpt4());
			pst.setInt(6, pc.getAns());
			status = pst.executeUpdate();
		}
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
		return status;
	}
	
	public static int deleteques(String qno,String sub) {
		int status = 0;
		
		try
		{
			Connection con =Provider.getMysqlConnection();
			String sql="delete from "+sub+" where slno = "+qno+" ";
			PreparedStatement pst=con.prepareStatement(sql);
			status = pst.executeUpdate();
		}
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
		return status;
		
		
	}
	public static void storeAnswer(String name,String sub,int mark) 
	{	
		try
		{
			Connection con =Provider.getMysqlConnection();
			String sql="insert into results (name,subject,score) values(?,?,?)";
			PreparedStatement pst=con.prepareStatement(sql);
			
			pst.setString(1, name);
			pst.setString(2, sub);
			pst.setInt(3, mark);
			pst.executeUpdate();
		}
		catch (Exception e2) 
		{
			e2.printStackTrace();
		}
	}
	
	

}
