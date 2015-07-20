<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<table>
  <th>
  	<tr class="trhead">
	    <td>Biller Name</td>
	    <td>Biller Code</td>
<!-- 	    <td>Products</td> -->
    </tr>
  </th>
  <c:forEach items="${billers}" var="biller">
	  <tr onclick="location.href='${pageContext.servletContext.contextPath}/reports/transaction/billers/${biller.id}'">
	    <td><c:out value="${biller.name}"/> </td>
	    <td><c:out value="${biller.code}"/> </td>
<%-- 	    <td><c:out value="${biller.products}"/></td> --%>
	  </tr>
  </c:forEach>
</table>