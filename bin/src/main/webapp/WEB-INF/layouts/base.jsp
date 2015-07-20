<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page"
	xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:fn="http://java.sun.com/jsp/jstl/functions"
	xmlns:tiles="http://tiles.apache.org/tags-tiles"
	xmlns:tilesx="http://tiles.apache.org/tags-tiles-extras"
	xmlns:spring="http://www.springframework.org/tags" version="2.0">
	<jsp:directive.page contentType="text/html" pageEncoding="UTF-8" />
	<jsp:output omit-xml-declaration="true" />
	<jsp:output doctype-root-element="HTML"
		doctype-system="about:legacy-compat" />

	<c:set var="contextPath"
		value="${pageContext.servletContext.contextPath}" scope="request" />
	<html lang="en">
<head>

<tilesx:useAttribute name="styles" classname="java.util.List"
	ignore="true" />
<c:forEach items="${styles}" var="style">
	<c:choose>
		<c:when test="${fn:startsWith(style, '/resources')}">
			<link rel="stylesheet" type="text/css"
				href="${pageContext.request.contextPath}${style}" />
		</c:when>
		<c:otherwise>
			<spring:url value="${style}" var="styleURL" />
			<link rel="stylesheet" type="text/css" href="${styleURL}" />
		</c:otherwise>
	</c:choose>
</c:forEach>

</head>


<body>
	<tilesx:useAttribute name="pageTitle" />
	<div class="wrapper-admin">
		<!-- Top Header -->
		<div class="div-head">
			<label><c:out value="${role }" /></label> <label class="teller-name"><c:out
					value="${userFullName}" /></label> <a
				href="${pageContext.request.contextPath}/logout">Logout</a>
		</div>
		<!-- Header -->
		<div class="header">
			<img
				src="${pageContext.request.contextPath}/resources/images/bdologo.jpg" />
			<h2>
				<tiles:insertAttribute name="pageTitle" />
			</h2>
		</div>
		<!-- Main Body -->
		<div class="main-body">
			<div class="sidenav">
				<label>Admin</label>
				<ul>
					<c:url value="/biller" var="billerUrl" />
					<li><a href="${billerUrl}" style="display: block;">Billers</a></li>
					<c:url value="/eod" var="eodUrl" />
					<li><a href="${eodUrl}" style="display: block;">EOD</a></li>
					<c:url value="/transaction/billers" var="txnUrl" />
					<li><a href="${txnUrl}" style="display: block;">Transactions</a></li>
					
<!-- 					<c:url value="/reports" var="reportUrl" />
					<li><a href="${reportUrl}" style="display: block;">Reports</a></li> -->
					
					<li class="branch"><a href="#" style="display: block;">Maintenance &amp;raquo;</a></li>
					<c:url value="/maintenance/holiday" var="holidayMaintenanceUrl" />
					<li class="branch-child"><a href="${holidayMaintenanceUrl}"
					
						style="margin-left: 10px;">Holiday Management</a></li>
					<c:url value="/maintenance/branch" var="branchMaintenanceUrl" />
					<li class="branch-child"><a href="${branchMaintenanceUrl}"
						style="margin-left: 10px;">Branch Management</a></li>
					<c:url value="/maintenance/bank" var="bankMaintenanceUrl" />
					<li class="branch-child"><a href="${bankMaintenanceUrl}"
						style="margin-left: 10px;">Bank Management</a></li>
			<c:url value="/sync" var="syncDashboardUrl" />
				<li class="branch-child">
					<a href="${syncDashboardUrl}" style="margin-left: 10px;">Sync Dashboard</a>
				</li>
				</ul>
			</div>
			<div class="main-body-2">
				<c:choose>
					<c:when test="${not empty successMessageForView}">
						<div class="success-msg">
							<c:out value="${successMessageForView}" />
						</div>
					</c:when>
					<c:when test="${not empty errorMessageForView}">
						<div class="failed-msg">
							<c:out value="${errorMessageForView}" />
						</div>
					</c:when>
				</c:choose>
				<tiles:insertAttribute name="body" flush="true" />
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	$(document).ready(function() {
		$('.branch-child').hide();
		$('.branch').click(function() {
			$('.branch-child').toggle();
		});
	});
</script>
	</html>
</jsp:root>