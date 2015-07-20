<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="search-options">
  <input type="text" class="field" placeholder="Search Biller">
  <input type="button" value="Search" class="search-btn button">
</div>
<table class="paybiller-list">
	<tr class="trhead">
	  <td>Biller Name</td>
	  <td>Biller Code</td>
	</tr>
  	<c:forEach var="biller" items="${billers}">
  		<c:url value="/transaction/billers/${biller.id}" var="billerTransactionsUrl" />
		<tr onclick="location.href='${billerTransactionsUrl}'">
			<td><c:out value="${biller.name}" /></td>
		    <td><c:out value="${biller.code}" /></td>
		</tr>
	</c:forEach>
</table>
