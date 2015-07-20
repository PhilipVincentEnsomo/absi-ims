<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div style="text-align: right;"><button class="btn" onclick="location.reload();" title="Reload this page">Reload Page</button></div>
<table style="text-align:center;">
	<tr class="trhead">
		<td>Office ID</td>
		<td>Office Type</td>
		<td>Last Online Date</td>
		<td>Last Online Time</td>
	</tr>
	<c:forEach items="${heartbeatBeans}" var="heartbeatBean">
		<tr>
			<td>${heartbeatBean.nodeId}</td>
			<td>${heartbeatBean.nodeGroup}</td>
			<td>
				<fmt:formatDate type="date" value="${heartbeatBean.heartbeatTime}" />
			</td>
			<td>
				<fmt:formatDate type="time" value="${heartbeatBean.heartbeatTime}" />
			</td>
		</tr>
	</c:forEach>
</table>