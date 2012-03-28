<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>
Aprobados

<c:if test="${empty aprobados}">
	No se encontraron registros
</c:if>

<c:if test="${!empty aprobados}">
<table>
	<thead>
		<tr>
			<th>ID Pedido</th>			
			<th>Monto del pedido</th>
			<th>Ruc de cliente</th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${aprobados}" var="pedido">
		<tr>
			<td><c:out value="${pedido.idPedido}" /></td>
			<td><c:out value="${pedido.montoTotal}" /></td>
			<td><c:out value="${pedido.cli_ruc}" /></td>
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<a href="javascript:window.history.go(-1);">Regresar</a>

</body>
</html>