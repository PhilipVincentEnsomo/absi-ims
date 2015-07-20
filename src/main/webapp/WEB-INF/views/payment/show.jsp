<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form class="form-biller view-biller">
	<c:if test = "${payment.product ne null }">
		<h2>${payment.product.name}</h2>
	</c:if>
	<ul>
		<c:forEach var ='field' items="${paymentFormConfig.paymentForm.fields}">
			<li>
				<label>${field.label}</label>:
				<span>
					<c:if test="${fieldEntryMap[field] ne null}">
						<c:choose>
							<c:when test="${field.type.label eq 'Amount' }">
								<fmt:formatNumber pattern="#,###.00" value="${fieldEntryMap[field].value.value}" type="number"/></p>
							</c:when>
							<c:otherwise>
								<c:out value="${fieldEntryMap[field].value.value}" />
							</c:otherwise>
						</c:choose>
					</c:if>
				</span>
			</li>
		</c:forEach>
		<li>
			<label>Entry Date</label>:
			<span><fmt:formatDate pattern="MMM dd, yyyy" value="${payment.dateCreated}" /></span>
		</li>
		<li>
			<label>Post Date</label>:
			<span><fmt:formatDate pattern="MMM dd, yyyy" value="${payment.datePosted}" /></span>
		</li>
	</ul>
	<h2>Payment Items</h2>
	<!-- TODO: show item type -->
	<ul>
		<c:forEach var ='item' items="${payment.paymentItems}">
			<hr/>
			<li>
				<label>Mode</label>:<span>${item.paymentMode.label}</span>
			</li>
			<li>
				<label>${item.currency.label}</label>:<span>${item.amount}</span>
			</li>
			<c:if test="${item.paymentMode == 'LOCAL_CHECK' || item.paymentMode == 'ON_US_CHECK' || item.paymentMode == 'MANAGERS_CHECK'}">
				<c:choose>
					<c:when test="${item.paymentMode == 'LOCAL_CHECK'}">
						<li>
							<label>Local Check Number</label>:<span>${item.localCheckNumber}</span>
						</li>
					</c:when>
					<c:when test="${item.paymentMode == 'ON_US_CHECK'}">
						<li>
							<label>On Us Check Number</label>:<span>${item.onUsCheckNumber}</span>
						</li>
					</c:when>
					<c:when test="${item.paymentMode == 'MANAGERS_CHECK'}">
						<li>
							<label>Manager's Check Number</label>:<span>${item.managerCheckNumber}</span>
						</li>
					</c:when>
				</c:choose>
				<li>
					<label>Issuing Bank/Branch</label>:<span>${item.issuingBank}</span>
				</li>
			</c:if>
		</c:forEach>
	</ul>
	<hr/>
	Total : <span>${payment.totalAmount }</span>
</form>

<div style="margin-top: 25px;">
	<input type="button" value="Back" class="btn" onclick="location.href='${contextPath}/transaction/billers/${biller.id}'">
</div>
