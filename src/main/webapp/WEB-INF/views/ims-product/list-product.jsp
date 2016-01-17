<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


    <div class="search-options">
		<input type="text" class="field">
		<input type="button" value="Search" class="search-btn button">
		<input type="button" value="Add" class="btnAdd button" onclick="location.href='${pageContext.request.contextPath}/ims-product/new'">
	</div>
	
	<table class="product-list">
	  <tr class="trhead">
		<td> Product Category </td>
	    <td> SKU </td>
	    <td> Product Name  </td>
	    <td> Product Price  </td>
	    
	  </tr>
	  
		<c:forEach var="product" items="${imsProductList}">
			
			<tr class="link"> 			
				<td>Employee</td>
				
				<td>	
					<c:out value="${product.category}" />	
					
					<div class="hidden view-url">
						<c:url value="/ims-product/view/${product.id}" />
					
					</div>
				</td>
				
				<td>	
					<c:out value="${product.SKU}" />	
				</td>
				
				<td>	
					<c:out value="${product.productName}"		/>	
				</td>
				
				<td>	
					<c:out value="${product.productPrice}" />	
				</td>
				
			</tr>
			
		</c:forEach>
	  
	</table>

<script type="text/javascript">
	$(function() {
		$(".link").click(function() {
			var url = $(this).find(".view-url").html();
			validNavigation = true;
						window.location = $.trim(url);
		});
	});
</script>