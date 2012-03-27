<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>

Clientes

<c:if test="${empty clientes}">
	No se encontraron clientes
</c:if>

<c:if test="${!empty clientes}">
<table>
	<thead>
		<tr>
			<th>RUC del cliente</th>			
			<th>Razón Social</th>
			<th>Línea de Crédito</th>
			<th>Saldo</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${clientes}" var="cliente">
			<c:url var="lineacreditoUrl" value="/gfive/lineacredito?id=${cliente.cli_ruc}" />
		<tr>
			<td><c:out value="${cliente.cli_ruc}" /></td>
			<td><c:out value="${cliente.cli_razonSocial}" /></td>
			<td><c:out value="${cliente.cli_lineaCreditoTotal}" /></td>
			<td><c:out value="${cliente.cli_lineaCreditoSaldo}" /></td>
<%-- 			<td><a href="${lineacreditoUrl}">Administrar línea de crédito</a></td> --%>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<%-- <c:url var="addUrl" value="/krams/add" /> --%>
<%-- <a href="${addUrl}">Agregar cliente</a> --%>

<br>
<a href="javascript:window.history.go(-1);">Regresar</a>

</body>
</html>