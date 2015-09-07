<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
	<title>Inventory ABS Promotions Corporations</title>
	
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
	
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/style.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/utility.css" /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap/bootstrap.min.css" /> ">

	
</head>

<body>



    <div class="search-options">
	  <input type="text" class="field">
	  <input type="button" value="Search" class="search-btn button">
	</div>
	
	<table>
	  <tr class="trhead">
	    <td>User Type</td>
	    <td> Name </td>
	    <td> Username </td>
	    <td> Password </td>
	    
	  </tr>
	  <tr onclick="location.href='view-users.html'">
	    <td>Employee</td>
	    <td>Dominique Frances Del Rosario</td>
	    <td>delrosariod</td>
	    <td>Machiatto!@3</td>
	    
	  </tr>
	  <tr onclick="location.href='view-users.html'">
	    <td>Client</td>
	    <td>Splash Corporations</td>
	    <td>splashcorporations</td>
	    <td>splashGregorio</td>
	    
	  </tr>                            
	  
	  <tr onclick="location.href='view-users.html'">
	    <td>Encoder</td>
	    <td>Gregoria T. Manoloto</td>
	    <td>gManoloto</td>
	    <td>pashWord!@#4</td>
	    
	  </tr>                            
	</table>



</body>
</html>