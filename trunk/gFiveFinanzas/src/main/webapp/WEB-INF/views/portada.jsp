<%@ include file="/WEB-INF/views/include.jsp"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>

	<h3>Login</h3>
	<c:url var="loginUrl" value="/gfive/login" />
	<!--TODO 2 usar form de spring -->
	<form method="POST" action="${loginUrl}">
		<table>
			<tr>
				<td><label>Nombre de Usuario:</label></td>
				<td><input type="text" name="user" /></td>
			</tr>

			<tr>
				<td><label>Contraseña:</label></td>
				<td><input type="password" name="pass" /></td>
			</tr>
		</table>

		<input type="submit" value="Acceder" />
	</form>

	<br>
	<br>
</body>