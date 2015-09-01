<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="false" /></title>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">
		<div class="wrapper">
			<div class="container">
				<div class="header">
					<div class="login-details span-24">
						<div class="button"><a href=<c:url value="/logout-user"/>Logout</a></div>
						<c:if test = "${password eq null}">
							<div class="button" id="changePassword"><a href="${pageContext.servletContext.contextPath}/change-password">Change Password</a></div>
						</c:if>
						<div class="user"><c:out value="${loggedInIMSUserName}" /></div>
						<div class="user-position"><c:out value="${loggedInIMSUserPosition}" />:</div>
						<div class="user-position"><span id="currentDate"></span></div>
					</div>
					<div class="span-4 clear">
						<div class="logo"><h1>ABSI-IMS</h1></div>
					</div>
				</div>
				<div id="sidebar" class="span-4">
					<tiles:insertAttribute name="leftMenu" />
				</div>
				<div class="body-container clearfix">
					<tiles:insertAttribute name="body" />
				</div>				
			</div>
			<div class="clear push"></div>
		</div>
	</body>
</html>