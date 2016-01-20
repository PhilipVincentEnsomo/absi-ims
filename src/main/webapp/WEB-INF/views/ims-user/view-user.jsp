<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>

<head>

<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/style.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/utility.css" /> ">
<link rel="stylesheet" type="text/css"
	href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">

</head>


<body>

<form:form id="imsUser" modelAttribute="imsUser" action="${pageContext.servletContext.contextPath}/delete" method="DELETE">
		
		<form:hidden path="id"/>
		<%-- <c:out value="${imsUser.id}"/> --%>
</form:form>			

<div class="form-user">
			<ul>
				<c:out value="${action}"/>
				
				<li><label><strong> User Type     :</strong></label><span>
				<c:out value="Employee"/></span></li>	
				
				<li><label><strong> Username     :</strong></label><span>
				<c:out value= "${imsUser.username}" /></span></li>
				
				<li><label><strong> Password     :</strong></label><span>
				<c:out value= "${imsUser.password}" /></span></li>
				
				<li><label><strong> Client Name     :</strong></label><span>
				<c:out value="Biolinks"/></span></li>
				
				<li><label><strong> First Name     :</strong></label><span>
				<c:out value="${imsUser.firstname}" /></span></li>
				
				<li><label><strong> Middle Name     :</strong></label><span>
				<c:out value= "${imsUser.middlename}" /></span></li>
				
				<li><label><strong> Last Name     :</strong></label><span>
				<c:out value= "${imsUser.lastname}" /></span></li>	
				  
				
				<li><label><strong> Contact Number     :</strong></label><span>
				<c:out value= "${imsUser.contactNumber}" /></span></li>
				
				<li><label><strong> E-mail Address     :</strong></label><span>
				<c:out value= "${imsUser.emailAddress}" /></span></li>
				
				<li><label><strong> Address     : </strong></label><span>
				<c:out value= "${imsUser.address}"/></span></li>		
							
				<li><label><strong> City     :</strong></label><span>
				<c:out value= "${imsUser.city}"/></span></li>
				
				<li><label><strong> Postal Code     :</strong></label><span>
				<c:out value= "${imsUser.postalCode}" /></span></li>
				
			</ul>
		
	
</div>

</body>
</html>