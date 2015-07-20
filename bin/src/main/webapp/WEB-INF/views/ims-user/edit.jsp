<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<form:form class="view-biller form-biller" modelAttribute="biller" action="${pageContext.servletContext.contextPath}/biller/${action}" method="${method}">
	<ul>
		<li>
			<label>Name *</label>:<form:input class="input-field" path="name" />
			<form:errors style="color:red;" path="name"/>
			</li>
		<li>
			<label>Code *</label>:<form:input class="input-field" path="code"/>
			<form:errors style="color:red;" path="code"/>
		</li>
		<li>
			<label>Collection Account Number</label>:<form:input class="input-field" path="collectionAccountNumber"/>
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
			<label>Payment Credit Type</label>:<select name="creditType">
				<c:forEach items="${creditTypes}" var="creditType">
					<c:choose>
						<c:when test="${paymentSettingsConfig == null}">
							<option value="${creditType.code}">${creditType.label}</option>
						</c:when>
						<c:when test="${paymentSettingsConfig.creditType.name() == creditType.code}">
							<option value="${creditType.code}" selected>${creditType.label}</option>
						</c:when>
						<c:otherwise>
							<option value="${creditType.code}">${creditType.label}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</li>
		<li>
			<label>Payment Service Fee Type</label>:<select name="serviceFeePaymentType">
				<c:forEach items="${serviceFeePaymentTypes}" var="serviceFeePaymentType">
					<c:choose>
						<c:when test="${paymentSettingsConfig == null}">
							<option value="${serviceFeePaymentType.code}">${serviceFeePaymentType.label}</option>
						</c:when>
						<c:when test="${paymentSettingsConfig.serviceFeePaymentType.name() == serviceFeePaymentType.code}">
							<option value="${serviceFeePaymentType.code}" selected>${serviceFeePaymentType.label}</option>
						</c:when>
						<c:otherwise>
							<option value="${serviceFeePaymentType.code}">${serviceFeePaymentType.label}</option>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</select>
		</li>
		<li class="divli">
			<label>Payment Modes</label> <form:errors style="color:red;" path="selectedPaymentModes"/>
			<table class="white-border">
				<c:forEach var ='paymentMode' items="${paymentModes}" varStatus="index">
					<c:choose>
						<c:when test="${index.count % 2 != 0 }">
							<tr>
							<td>
								<label><input type="checkbox" name="selectedPaymentModes" class="selectedPaymentModes" value="${paymentMode.code }" <c:if test="${paymentMode.selected == 'TRUE' }">checked </c:if> /><span>${paymentMode.label }</span></label>
							</td>
						</c:when>
						<c:when test="${index.count % 2 == 0 }">
							<td>
								<label><input type="checkbox" name="selectedPaymentModes" class="selectedPaymentModes" value="${paymentMode.code }" <c:if test="${paymentMode.selected == 'TRUE' }">checked </c:if> /><span>${paymentMode.label }</span></label>
							</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
		</li>
		<li class="divli">
			<label>Payment Channels</label> <form:errors style="color:red;" path="selectedPaymentChannels"/>
			<table class="white-border">
				<c:forEach var ='paymentChannel' items="${paymentChannels}" varStatus="index">
					<c:choose>
						<c:when test="${index.count % 2 != 0 }">
							<tr>
							<td>
								<label><input type="checkbox" name="selectedPaymentChannels" class="selectedPaymentChannels" value="${paymentChannel.code }" <c:if test="${paymentChannel.selected == 'TRUE' }">checked </c:if> /><span>${paymentChannel.label }</span></label>
							</td>
						</c:when>
						<c:when test="${index.count % 2 == 0 }">
							<td>
								<label><input type="checkbox" name="selectedPaymentChannels" class="selectedPaymentChannels" value="${paymentChannel.code }" <c:if test="${paymentChannel.selected == 'TRUE' }">checked </c:if> /><span>${paymentChannel.label }</span></label>
							</td>
							</tr>
						</c:when>
					</c:choose>
				</c:forEach>
			</table>
		</li>
		<li>
			<label></label><input type="submit" class="btn" value="Save"/><input type="button" class="btn" value="Cancel" id="billerCancelButton">
		</li>
	</ul>
	<c:if test="${not empty biller.id}">
		<form:hidden path="id" />
	</c:if>
</form:form>

<script type="text/javascript">
(function() {

	$(document).ready(function(){
		$("#billerCancelButton").click(function() {
			var formAction = "${action}";
			var createAction = "save";

			if(formAction == createAction){
				window.location.href="${pageContext.servletContext.contextPath}/biller";
			} else {
				window.location.href="${pageContext.servletContext.contextPath}/biller/show/${biller.id}";
			}
		});
	});

})();
</script>
