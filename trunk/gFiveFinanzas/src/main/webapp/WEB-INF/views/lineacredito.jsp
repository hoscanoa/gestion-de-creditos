<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>
	Linea de credito

	<c:url var="actualizarUrl" value="/gfive/lineacredito?id=${cliente.cli_ruc}" />
	<c:if test="${empty cliente}">
		No existe el cliente!
	</c:if>

	<c:if test="${!empty cliente}">
		<form:form modelAttribute="cliente" method="POST" action="${actualizarUrl}">
			<table>
				<tr>
					<td><form:label path="cli_ruc">RUC</form:label></td>
					<td><form:label path="cli_ruc">${cliente.cli_ruc}</form:label></td>
				</tr>

				<tr>
					<td><form:label path="cli_razonSocial">Razón Social</form:label></td>
					<td><form:input disabled="true" path="cli_razonSocial" /></td>
				</tr>

				<tr>
					<td><form:label path="cli_lineaCreditoTotal">Línea de Crédito:</form:label></td>
					<td><form:input path="cli_lineaCreditoTotal" /></td>
				</tr>

				<tr>
					<td><form:label path="cli_lineaCreditoSaldo">Saldo:</form:label></td>
					<td><form:input disabled="true" path="cli_lineaCreditoSaldo" /></td>
				</tr>
			</table>
			<input type="submit" value="Actualizar" />
		</form:form>
	</c:if>

	<c:url var="homeUrl" value="/gfive/home" />
	<a href="${homeUrl}">Regresar</a>

</body>
</html>