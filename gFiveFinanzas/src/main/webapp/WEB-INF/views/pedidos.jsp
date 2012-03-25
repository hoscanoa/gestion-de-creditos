<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>
	<h1>Bienvenido
		<%
		Usuario actual = (Usuario) session.getAttribute("USUARIO_ACTUAL");
		%>
		<%= actual.getUsuario() %>
	</h1>	
</body>
</html>