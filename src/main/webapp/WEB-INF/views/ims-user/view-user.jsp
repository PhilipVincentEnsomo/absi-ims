<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class="view-user border-red" view-user-form-id="${imsUserList.id}">
			
		<c:forEach var="user" items="${imsUser}">
			<ul>
			
				<li><label><strong> User Type </strong></label>:<span>
				<c:out value="Employee"/></span></li>	
				
				<li><label><strong> Username </strong></label>:<span>
				<c:out value= "${user.username}" /></span></li>
				
				<li><label><strong> Password </strong></label>:<span>
				<c:out value= "${user.password}" /></span></li>
				
				<li><label><strong> Client Name </strong></label>:<span>
				<c:out value="Biolinks"/></span></li>
				
				<li><label><strong> First Name </strong></label>:<span>
				<c:out value="${user.firstname}" /></span></li>
				
				<li><label><strong> Middle Name </strong></label>:<span>
				<c:out value= "${user.middlename}" /></span></li>
				
				<li><label><strong> Last Name </strong></label>:<span>
				<c:out value= "${user.lastname}" /></span></li>	
				
				<li><label><strong> Gender </strong></label>:<span>
				<c:out value=" "/></span></li>    
				
				<li><label><strong> Contact Number </strong></label>:<span>
				<c:out value= "${user.contactNumber}" /></span></li>
				
				<li><label><strong> E-mail Address </strong></label>:<span>
				<c:out value= "${user.emailAddress}" /></span></li>
				
				<li><label><strong> Address </strong></label>:<span>
				<c:out value= "${user.address}"/></span></li>		
							
				<li><label><strong> City </strong></label>:<span>
				<c:out value= "${user.city}"/></span></li>
				
				<li><label><strong> Postal Code </strong></label>:<span>
				<c:out value= "${user.postalCode}" /></span></li>
				
			</ul>
		</c:forEach>
</div>