<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
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
		    <td>Product Category</td>
		    <td> SKU </td>
			<td> Product Name </td>
		    <td> Price </td>
		    
		  </tr>
		  <tr onclick="location.href='view-products.jsp'">
		    <td>Shampoo</td>
		    <td>BIO10034</td>
		    <td>Bibingka Papaya</td>
		    <td>Php 23.00</td>
		    
		  </tr>
		  <tr onclick="location.href='view-products.jsp'">
		    <td>Shampoo</td>
		    <td>BIO10034</td>
		    <td>Bibingka Papaya</td>
		    <td>Php 23.00</td>
		    
		  </tr>                            
		  
		  <tr onclick="location.href='products.jsp'">
		    <td>Shampoo</td>
		    <td>BIO10034</td>
		    <td>Bibingka Papaya</td>
		    <td>Php 23.00</td>
		    
		  </tr>                            
		</table>
		
      

</body>
</html>