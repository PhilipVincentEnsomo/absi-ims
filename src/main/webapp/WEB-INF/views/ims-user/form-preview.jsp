<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<form class="form-biller pay-form" data-biller-id="${biller.id}">
	<ul>
		<c:if test="${not empty products}">
			<li> <label> Select product </label> : 
				<select class="payment-product">
					<c:forEach var="product" items="${products}">
						<option value="${product.id}">${product.name}</option>
					</c:forEach>
				</select> </li>
		</c:if>
		<c:set var="tooltipIcon"><c:url value="/resources/images/question.png"/></c:set>
		<c:forEach var ='field' items="${paymentFormConfig.paymentForm.fields}">
			<c:if test="${field.enabled}">
				<li>
					<label>${field.label}</label>:
					<c:choose>
						<c:when test ='${field.type eq "DATE"}'>
							<input data-id="${field.id}" type="text" class="inputfield payment-field date-field"  title="${field.toolTip}" />
						</c:when>
						<c:when test ='${field.type eq "WHOLE_NUMBER"}'>
							<input data-id="${field.id}" type="text" class="inputfield payment-field number-field" title="${field.toolTip}" />
						</c:when>
						<c:when test ='${field.type eq "DECIMAL"}'>
							<input data-id="${field.id}" type="text" class="inputfield payment-field decimal-field" title="${field.toolTip}"/>
						</c:when>
						<c:otherwise>
							<input data-id="${field.id}" type="text" class="inputfield payment-field" title="${field.toolTip}"/>
						</c:otherwise>
					</c:choose>
					<span id="error-${field.id}" class="field-error"></span>
					<span class="wrapper-tool" style="display: inline;">
						<c:if test="${not empty field.toolTip}">
							<img src="${tooltipIcon}" />
							<div class="tooltip"><p><c:out value="${field.toolTip}" /></p></div>
						</c:if>
					</span>
				</li>
			</c:if>
		</c:forEach>
		<li>
			<label>Running Total </label> : <input type="text" disabled class="running-total commaSeparated"> </span>
		</li>
		<li>
			<div class="payment-amounts">
				<div class="payment-mode-base">
					<div class="item">
						<label>Payment Mode</label>:
							<select class="payment-mode">
								<c:forEach items="${paymentModes}" var="paymentMode">
									<option value="${paymentMode}" <c:if test="${paymentMode eq 'CASH'}">selected</c:if>><c:out value="${paymentMode.label}" /></option>
								</c:forEach>
							</select><br/>
						<label>Amount</label>:
						<input class="amount" type="text" />
					</div>
					<label></label>	
				</div>
				<div class="add"><a title="Add Payment Mode"><b>+</b> Add Payment Mode</a></div>
			</div>
		</li>
	</ul>
</form>