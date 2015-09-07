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

<div class="main-body-2">
  <form class="form-user">
  <ul>
	<!--
	<li>
		<button id="btnAdd" type="button" class="btn btn-default">Add</button>	
	</li>
	-->
	
	<li><label><strong> User Type </strong></label>:<select>
	                                <option>  </option>
									<option> Admin </option>
	                                <option> Encoder </option>
	                                <option> Client </option>
	                              </select>
	</li>
	
	<li><label><strong> Username </strong></label>:<input type="text"/></li>
	<li><label><strong> Password </strong></label>:<input type="text"/></li>
	<li><label><strong> Client Name </strong></label>:<input type="text"/></li>
	<li><label><strong> First Name </strong></label>:<input type="text"/></li>
	<li><label><strong> Middle Name </strong></label>:<input type="text"/></li>	
	<li><label><strong> Last Name </strong></label>:<input type="text"/></li>	
	
	<li>
		<label for ="Gender"> <strong> Gender </strong></label>:
			<div class ="checkbox-gender">
				<label class="checkbox-inline"><input type="checkbox" value="">Female</label><br>
				<label class="checkbox-inline"><input type="checkbox" value="">Male</label>
			</div>
      </li>
      
	<li><label><strong> Contact Number </strong></label>:<input type="text"/></li>
      <li><label><strong> E-mail Address </strong></label>:<input type="text"/></li>					
	<li><label><strong> Address </strong></label>:<input type="text"/></li>
	<li><label><strong> City </strong></label>:<input type="text"/></li>
	<li><label><strong> Postal Code </strong></label>:<input type="text"/></li>
	
	
  </ul>
  </form>
</div>

</body>
</html>