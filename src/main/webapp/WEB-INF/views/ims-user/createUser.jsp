<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html lang="en">

<head>
<title>Inventory ABS Promotions Corporations</title>

<meta name="description" content="Login Page">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/utility.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">


</head>

<body>

	<button class="btnHeader" type="button">Cancel</button>
	<button class="btnHeader" type="button">Delete</button>
	<button class="btnHeader" type="button">Edit</button>
	<button class="btnHeader" type="button">Submit</button>

	<li><label><strong> User Type </strong></label>:<select>
			<option></option>
			<option>Admin</option>
			<option>Encoder</option>
			<option>Client</option>
	</select></li>
	<form:form id="imsUser" modelAttribute="imsUser"
		action="${pageContext.servletContext.contextPath}/save" method="POST"
		cssClass="form-horizontal">

		<li><label><strong> Username </strong></label>:<form:input
				type="text" path="username" /></li>
		<li><label><strong> Password </strong></label>:<form:input
				type="text" path="password" /></li>
		<li><label><strong> First Name </strong></label>:<form:input
				type="text" path="firstname" /></li>
		<li><label><strong> Middle Name </strong></label>:<form:input
				type="text" path="middlename" /></li>
		<li><label><strong> Last Name </strong></label>:<form:input
				type="text" path="lastname" /></li>
		<li><label><strong> Contact Number </strong></label>:<input
			type="text" /></li>
		<li><label><strong> E-mail Address </strong></label>:<form:input
				type="text" path="emailAddress" /></li>
		<li><label><strong> Address </strong></label>:<form:input
				type="text" path="address" /></li>
		<li><label><strong> City </strong></label>:<form:input
				type="text" path="city" /></li>
		<li><label><strong> Postal Code </strong></label>:<form:input
				type="text" path="postalCode" /></li>
	</form:form>
	<!-- 			<li><label for="Gender"><strong> Gender </strong></label>:<select> -->
	<!-- 					<option></option> -->
	<!-- 					<option>Female</option> -->
	<!-- 					<option>Male</option> -->
	<!-- 			</select></li> -->

	</ul>
	</div>

</body>
</html>