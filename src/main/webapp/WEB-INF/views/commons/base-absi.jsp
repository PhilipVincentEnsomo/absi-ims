<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="false" /></title>
</head>


<body>

<div class="wrapper-admin">
	<!-- Top Header -->
	<div class="div-head">
		<label><c:out value="${role }" /></label> <label class="user-name"><c:out
				value="${userFullName}" /></label> <a
			href="${pageContext.request.contextPath}/logout">Logout</a>
	</div>
	
	<!-- Header -->
	<div class="header">
		<img src="${pageContext.request.contextPath}/resources/images/LogiIcon.jpeg" />
		<strong>
			<tiles:insertAttribute name="pageTitle" />
		</strong>
	</div>
	
	<div class="main-body">
		<tiles:insertAttribute name="leftMenu" />
		
		<div class="main-body-2">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</div>

</body>
</html>