<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<ul>
	<li><spring:url value="/reports/biller" var="billerReport"/><a href="${billerReport}">Biller</a></li>
</ul>