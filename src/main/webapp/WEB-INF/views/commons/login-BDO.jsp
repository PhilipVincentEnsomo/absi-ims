<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<meta charset="utf-8" /> 
   <meta name="viewport" content="width=device-width, initial-scale=1" />
<head>
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/utility.css" />" />
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" />" />

	<title>Please Login - BDO Bills Payment</title>
</head>
<body>
	<div class="loginheader">
		
        <img src="<c:url value="/resources/images/bdologo.jpg" />">
		<div class="loginwrap">
		
			<form action="<c:url value="/login" />" method="post">
				<h2>Login to BDO Bills Payment</h2>
				<ul>
					<li><label>Username</label><input class="field" type="text" name="username"></li>
					<li><label>Password</label><input class="field" type="password" name="password"></li>
					<c:if test="${not empty message}">
						<span style="color: white; padding-top: 5px; display: inline-block; font-weight: bold;"><c:out value="${message}"/></span>
					</c:if>
					<li><label></label><input class="btn" type="submit" value="Sign In"></li>
				</ul>
			</form>
		</div>
	</div>
</body>
</html>