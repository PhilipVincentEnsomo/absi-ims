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
	
		<tilesx:useAttribute name="scripts" classname="java.util.List"
			ignore="true" />
		<c:forEach items="${scripts}" var="script">
			<spring:url value="${script}" var="scriptURL" />
			<script src="${scriptURL}">
			<!-- -->
				
			</script>
		</c:forEach>
	</head>
	<body>
		<tiles:insertAttribute name="body" flush="true" />

	</body>
</jsp:root>