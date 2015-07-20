<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<br/>
<c:url value="/eod/credit-billers" var="creditBillersUrl" />
<c:choose>
	<c:when test="${dayHasEnded}">
		<input type="button" class="btn" disabled value = "Credit Billers"/> 
		<br/><br/>Last Processed: ${lastEod}
	</c:when>
	<c:otherwise>
		<input type="button" class="btn" onclick="location.href='${creditBillersUrl}'" value="Credit Billers"/>
	</c:otherwise>
</c:choose>