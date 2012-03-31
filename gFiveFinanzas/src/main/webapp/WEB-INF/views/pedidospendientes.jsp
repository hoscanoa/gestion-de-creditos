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
			<c:url var="clienteUrl" value="/gfive/lineacredito?id=${pedido.cli_ruc}" />
			<c:url var="observarPedidoUrl" value="/gfive/observar?id=${pedido.idPedido}" />
		<tr>
			<td><c:out value="${pedido.idPedido}" /></td>
			<td><c:out value="${pedido.montoTotal}" /></td>
			<td><c:out value="${pedido.cli_ruc}" /></td>
			<td><a href="${clienteUrl}">Administrar línea de crédito</a></td>
			<td><a href="${observarPedidoUrl}">Observar pedido</a></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<c:url var="homeUrl" value="/gfive/home" />
<a href="${homeUrl}">Regresar</a>

</body>
</html>