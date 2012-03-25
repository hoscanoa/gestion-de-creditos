<%@ include file="/WEB-INF/views/include.jsp"%>

<html>
<head>
<title><fmt:message key="title" /></title>
<style>
.error {
	color: red;
}
</style>
</head>
<body>

	<h3>Login</h3>
	<c:url var="loginUrl" value="/gfive/login" />
	<!--TODO 2 usar form de spring -->
	<form method="POST" action="${loginUrl}">
		<table>
			<tr>
				<td><label>Nombre de Usuario:</label></td>
				<td><input/></td>
			</tr>

			<tr>
				<td><label>Contraseña:</label></td>
				<td><input/></td>
			</tr>
		</table>

		<input type="submit" value="Acceder" />
	</form>

	<br>
	<br>
</body>