<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<div class="view-biller border-yellow" style="margin-bottom: 20px;">
	<div class="clr">
	<ul>
		<li><label>Name</label>:<span><c:out value="${product.name}"/></span></li>	
		<li><label>Code</label>:<span><c:out value="${product.code}"/></span></li>	
		<li><label>Collection Account Number</label>:<span><c:out value="${product.collectionAccountNumber}"/></span></li>	
		<li><label>Currency</label>:<span><c:out value="${product.currency}"/></span></li>	
		<li><label>With Error Correction </label>:<span><c:out value="${product.withErrorCorrection}"/></span></li>	
		<li><label>Report Requirements</label>:<span>
				<c:choose>
					<c:when test="${fn:length(product.reportRequirements) eq 0 }"> NONE </c:when>
				<c:otherwise>
					<c:forEach items="${product.reportRequirements}" var="req" varStatus="i">
						<c:out value="${req.label}" /> <c:if test="${!i.last}">,</c:if>
					</c:forEach>
				</c:otherwise>
				</c:choose>
				
			</span>
		</li>	
		<li><label>OTC Form Requirements</label>:<span>
				<c:choose>
					<c:when test="${fn:length(product.overTheCounterFormRequirements) eq 0 }"> NONE </c:when>
					<c:otherwise>
						<c:forEach items="${product.overTheCounterFormRequirements}" var="req" varStatus="i">
							<c:out value="${req.label}" /> <c:if test="${!i.last}">,</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				


			</span>
		</li>	
		
	</ul>
	<div class="clr" style="margin: 0 0 20px 20px;">
		<form:form modelAttribute="product" action="${pageContext.servletContext.contextPath}/product/delete" method="DELETE">
			<form:hidden path="id"/>
			<input type="hidden" name="billerId" value="${billerId}"/>
			<input type="button" value="Back" class="btn" onclick="location.href='${pageContext.servletContext.contextPath}/biller/show/${billerId}?displayedTab=products'">
			<input type="button" value="Edit" class="btn" onclick="location.href='${pageContext.servletContext.contextPath}/product/edit/${product.id}?billerId=${billerId}'"/>
			<input type="button" value="Delete" class="btn" id="deleteProductBtn" />
		</form:form>
	</div>
	</div>
</div>
<div id="deleteProductDialog" title="Please Confirm" class="hidden">
		Are you sure you want to delete this product?
</div>
<script type="text/javascript">
$(document).ready(function(){

	$("#deleteProductBtn").click(function() {
		$("#deleteProductDialog").dialog({
			 modal: true,
			 buttons: {
				 Close: function() {
				 	$(this).dialog( "close" );
				 },
				 Submit: function() {
					$("#product").submit();
					 
				 	$(this).dialog( "close" );
				 }
			 }
		});
	});
	
});
</script>