<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>
	<title>Inventory ABS Promotions Corporations</title>
	
	<meta name="description" content="Login Page">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/utility.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">

	
</head>

<body>

	<div class="main-body">
      <div class="sidenav">
        <label>Admin</label>
        <ul>
          <li><a href="${pageContext.request.contextPath}/ims-user/list">List of Users</a></li>
          <li class="active"><a href="${pageContext.request.contextPath}/ims-user/new">Create New User</a></li>
          
        </ul>
      </div>


</body>
</html>