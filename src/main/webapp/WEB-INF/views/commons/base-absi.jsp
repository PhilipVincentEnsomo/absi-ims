<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

		
<html>
<head>
	<title><tiles:insertAttribute name="title" ignore="false" /></title>

	<script src="${pageContext.request.contextPath}/resources/js/lib/jquery/1.11.1/jquery.min.js" />  </script>
	<script src="${pageContext.request.contextPath}/resources/scripts/bootstrap-datepicker.js" />  </script>
	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/utility.css" /> 
	<link rel="stylesheet" type="text/css" src="${pageContext.request.contextPath}/resources/css/bootstrap/bootstrap.min.css" />
	
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
	
	<div class="user-top-menu">
		<input type="button" id="btn-user-cancel" value="Cancel" class="btnHeader button" onclick="location.href='${pageContext.request.contextPath}/ims-user'">
		<input type="button" id="btn-user-edit" value="Edit" class="btnHeader button" onclick="location.href='${pageContext.request.contextPath}/ims-user/edit/{id}'"/>
		<input type="button" id="btn-user-delete" value="Delete" class="btnHeader button" onclick="deleteDialog()" />	
		<input type="button" id="btn-user-submit" value="Submit" class="btnHeader button" onclick="saveNewUser()" />
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

<script type="text/javascript">	
	
	function deleteDialog()
	{
		document.getElementById("imsUser").remove();
		alert ("User has been deleted");
	}
	
	
	var $j = jQuery.noConflict();
	});

</script>