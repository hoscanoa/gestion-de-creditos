<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>

Pendientes


<c:if test="${empty pendientes}">
	No se encontraron registros
</c:if>

<c:if test="${!empty pendientes}">
<table>
	<thead>
		<tr>
			<th>ID Pedido</th>			
			<th>Monto del pedido</th>
			<th>Ruc de cliente</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${pendientes}" var="pedido">
<%-- 			<c:url var="clienteUrl" value="/krams/get?id=${pedido.id}" /> --%>
		<tr>
			<td><c:out value="${pedido.idPedido}" /></td>
			<td><c:out value="${pedido.montoTotal}" /></td>
			<td><c:out value="${pedido.cli_ruc}" /></td>
<%-- 			<td><a href="${clienteUrl}">Administrar línea de crédito</a></td> --%>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<a href="javascript:window.history.go(-1);">Regresar</a>

</body>
</html>