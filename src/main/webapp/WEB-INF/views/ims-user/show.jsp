<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="error-inline">
	<c:out value="${message}" />
</div>

<div class="view-biller border-yellow" data-payment-form-id="${paymentForm.id}" 
	data-biller-id="${biller.id}" data-config-id="${config.id}"
	 style="margin-bottom: 20px;">
	<div class="clr">
	<ul>
		<li><label>Name</label>:<span><c:out value="${biller.name}"/></span></li>	
		<li><label>Code</label>:<span><c:out value="${biller.code}"/></span></li>
		<li><label>Collection Account Number</label>:<span><c:out value="${biller.collectionAccountNumber}"/></span></li>
		<li><label>Currency</label>:<span><c:out value="${biller.currency}"/></span></li>
		<li><label>Payment Credit Type</label>:<span><c:if test="${paymentSettingsConfig.creditType != null}"><c:out value="${paymentSettingsConfig.creditType.label}"/></c:if></span></li>	
		<li><label>Service Fee Payment Type</label>:<span><c:if test="${paymentSettingsConfig.serviceFeePaymentType != null}"><c:out value="${paymentSettingsConfig.serviceFeePaymentType.label}"/></c:if></span></li>
		<li><label>Payment Modes</label><span class="colon">:</span><span><div class="inline-div">
			<c:forEach var ='paymentMode' items="${allowedPaymentModes}" varStatus="index">
				<c:out value="${paymentMode.label}"/> <br/>
			</c:forEach></div></span>
		</li>
		<li><label>Payment Channels</label><span class="colon">:</span><span><div class="inline-div">
			<c:forEach var ='paymentChannel' items="${allowedPaymentChannels}" varStatus="index">
				<c:out value="${paymentChannel.label}"/> <br/>
			</c:forEach></div></span>
		</li>
	</ul>

	<div class="clr" style="margin: 0 0 20px 20px;">
		<form:form modelAttribute="biller" action="${pageContext.servletContext.contextPath}/biller/delete" method="DELETE" >
			<form:hidden path="id"/>
			<input type="button" value="Back" class="btn" onclick="location.href='${contextPath}/biller'">
			<input type="button" value="Edit" class="btn" onclick="location.href='${contextPath}/biller/edit/${biller.id}'"/>
			<input type="button" value="Delete" class="btn" id="deleteBillerBtn" />
		</form:form>
	</div>
	</div>
</div>

<div id="tabs">
<ul>
<li><a href="#products-tab">Products</a></li>
<li><a href="#tabs-1">Form Builder</a></li>
</ul>

	<div id="tabs-1">
		<table id="fields-table"><tr><td></td></tr></table>
		<div id="pager"></div>
		<input type="button" value="Preview" class="btn preview-form">
	</div>

	<div id="products-tab">
		<p>
			<ul style="list-style-type: none;">
				<c:forEach items="${products}" var="product">
					<c:url value="/product/show/${product.id}?billerId=${biller.id}" var="productLink"/>
					<li class="product">
						<a href="${productLink}">
							<span class="check">✓</span>
							<span class="name">${product.name}</span>
							<span class="code">${product.code}</span>
						</a>
					</li>
				</c:forEach>
			</ul>
		</p>
		<input type="button" value="Add a Product" class="btn" onclick="location.href='${pageContext.servletContext.contextPath}/product/create?billerId=${biller.id}'">
	</div>

</div>

<div id="validations-dialog" title="Edit Validations" class="hidden">
</div>

<div id="form-preview-dialog" title="Form Preview" class="hidden">
	<div id="wrapper" style="height: 400px; overflow-y: auto; overflow-x: hidden;">Loading form preview...</div>
</div>

<div id="deleteBillerDialog" title="Please Confirm" class="hidden">
	Are you sure you want to delete this biller?
</div>