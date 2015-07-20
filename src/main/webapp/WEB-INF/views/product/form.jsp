<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<form:form class="view-biller form-biller" modelAttribute="product" action="${pageContext.servletContext.contextPath}/product/${action}" method="${method}">
	<ul>
		<li>
			<label>Biller</label>: <c:out value="${biller.name} (${biller.code})"/>
		</li>
		
		<li>
			<label>Product Name*</label>:<form:input path="name"/>
			<form:errors style="color:red;" path="name"/>
		</li>
		
		<li>
			<label>Product Code*</label>:<form:input path="code"/>
			<form:errors style="color:red;" path="code"/>
		</li>
		
		<li>
			<label>Collection Account Number</label>:<form:input path="collectionAccountNumber"/>
			<form:errors style="color:red;" path="collectionAccountNumber"/>
		</li>
		
		<li>
			<label>Currency</label>:<form:select path="currency">
   				<form:option value="PHP" label="PHP"/>
   				<form:option value="USD" label="USD"/>
			</form:select>
			<form:errors style="color:red;" path="currency"/>
		</li>
		
		<li>
<%-- 			<label>With Error Correction</label> : <form:checkbox path="withErrorCorrection"/> --%>
			<form:hidden path="withErrorCorrection" value="false"/>
			<form:errors style="color:red;" path="withErrorCorrection"/>
		</li>
		
		<li  class="divli">
			<label>Report Requirements</label>
			<table class="white-border">
				<tr>
				<c:forEach items="${allReportRequirements}" var="req">
					<td>
						<input id="element${req}" type="checkbox" name="selectedReportRequirements" value="${req.code}" <c:if test="${req.selected == 'TRUE' }">checked </c:if> />
						<label for="element${req}"> <c:out value="${req.label}"/> </label>
					</td>
				</c:forEach>
				</tr>
			</table>
		</li>
		
		<c:if test="${allOtcFormRequirements != null}">
			<li  class="divli">
				<label>OTC Form Requirements</label> <form:errors style="color:red;" path="selectedOtcFormRequirements"/>
				<table class="white-border">
					<tr>
						<c:forEach items="${allOtcFormRequirements}" var="req">
							<td>
								<input id="element${req}" type="checkbox" name="selectedOtcFormRequirements" value="${req.code}" <c:if test="${req.selected == 'TRUE' }">checked </c:if> />
								<label for="element${req}"> <c:out value="${req.label}"/> </label>
							</td>
						</c:forEach>
					</tr>
				</table>
			</li>
		</c:if>
	</ul>
	
	
	<div class="clr" style="margin-left:30px;">
		<input type="submit" class="btn" value="Submit" />
		<input type="button" class="btn" value="Cancel" id="productCancelButton">
	</div>
	
	<c:if test="${not empty product.id}">
		<form:hidden path="id" />
	</c:if>
	
	<c:if test="${not empty product.productConfig.id}">
		<form:hidden path="productConfig.id" />
	</c:if>
	
	<input type="hidden" name="billerId" value="${biller.id}"/>
</form:form>

<script type="text/javascript">
$(document).ready(function(){

	$("#productCancelButton").click(function() {
		var formAction = "${action}";
		var createAction = "save";

		if(formAction == createAction){
			window.location.href="${pageContext.servletContext.contextPath}/biller/show/${biller.id}?displayedTab=products";
		} else {
			window.location.href="${pageContext.servletContext.contextPath}/product/show/${product.id}?billerId=${biller.id}";
		}
	});
});
</script>
