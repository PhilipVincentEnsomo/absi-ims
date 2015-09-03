<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<html>
<head>
<title><tiles:insertAttribute name="title" ignore="false" /></title>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();" onunload="">

<div class="wrapper">

	<div id="header">			
			<tiles:insertAttribute name="header" />
	</div>			
				
	<div id="body">
		
		DITO ANG BODY
		
		<div id="topMenu" class="span-4">
			<tiles:insertAttribute name="topMenu" />
		</div>
		
		<div class="body-container clearfix">
			<tiles:insertAttribute name="body" />
		</div>				
	
			<div class="clear push"></div>
			
	
		
	
	</div>


		
	<div id="footer">
		<tiles:insertAttribute name="footer" />
	</div>
			
</div>  


</body>
</html>