<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>
Observados

<c:if test="${empty observados}">
	No se encontraron registros
</c:if>

<c:if test="${!empty observados}">
<table>
	<thead>
		<tr>
			<th>ID Pedido</th>			
			<th>Monto del pedido</th>
			<th>Ruc de cliente</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${observados}" var="pedido">
		<tr>
			<td><c:out value="${pedido.idPedido}" /></td>
			<td><c:out value="${pedido.montoTotal}" /></td>
			<td><c:out value="${pedido.cli_ruc}" /></td>
		</tr>
	</c:forEach>
	</tbody>
</table>

</c:if>

<c:url var="homeUrl" value="/gfive/home" />
<a href="${homeUrl}">Regresar</a>

</body>
</html>