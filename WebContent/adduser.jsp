<%@page import="exam.model.QuizDao"%>
<%@page import="exam.db.Provider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <% 
 String password=request.getParameter("password");
 String db=request.getParameter("db");
 String username=request.getParameter("username");
 String message=QuizDao.addUser(username,password,db);
 out.print(message);
 %>
 