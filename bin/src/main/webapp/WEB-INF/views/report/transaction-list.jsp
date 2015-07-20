<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form action="${pageContext.servletContext.contextPath}/${generateReportUrl}" method="post">
	<input name="billerId" value="${biller.id}" type="hidden"/>
	<input type="submit" value="Generate Report" class="btn float-right top-btns"/>
</form>
<table class="paybiller-list">
	<tr class="trhead">
		<td>ID</td>
	  	<td>Transaction Date</td>
	  	<td>Posted Date</td>
	</tr>
  	<c:forEach var="payment" items="${payments}">
  		<c:url value="/reports/transaction/${payment.id}" var="paymentUrl" />
		<tr>
			<td><a href="${paymentUrl}"><c:out value="${payment.id}" /></a></td>
			<td><a href="${paymentUrl}"><c:out value="${payment.dateCreated}" /></a></td>
			<td><a href="${paymentUrl}"><c:out value="${payment.datePosted}" /></a></td>
		</tr>
	</c:forEach>
</table>
