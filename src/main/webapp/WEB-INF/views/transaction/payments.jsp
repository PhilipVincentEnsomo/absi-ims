<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<h2>${biller.name}</h2>

<table class="paybiller-list">
	<tr class="trhead">
	  	<td>Transaction Date</td>
	  	<td>Total Amount</td>
	  	<td>Reference Number</td>
	  	<td>Posted Date</td>
	</tr>
  	<c:forEach var="payment" items="${payments}">
  		<c:url value="/transaction/${payment.id}" var="paymentUrl" />
		<tr>
		<tr onclick="location.href='${paymentUrl}'">
			<td><fmt:formatDate pattern="MMM dd, yyyy" value="${payment.dateCreated}" /></td>
			<td><c:out value="${payment.totalAmount}" /></td>
			<td><c:out value="${payment.referenceNumber}" /></td>
			<td><fmt:formatDate pattern="MMM dd, yyyy" value="${payment.datePosted}" /></td>
		</tr>
	</c:forEach>
</table>

<div style="margin-top: 25px;">
	<c:if test="${empty payments}">
		<span>No transactions to show</span>
	</c:if>
	<div class="clr" style="margin-top: 20px;">
		<input type="button" value="Back" class="btn" onclick="location.href='${contextPath}/transaction/billers'">
	</div>
</div>