<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
</head>
<body>
	Bienvenido
	<c:out value="${sessionScope.USUARIO_ACTUAL.usuario}"></c:out>
	<ul>
		<li>Pedidos
			<ul>
				<li><a href="pedidospendientes">Pedidos pendientes</a></li>
				<li><a href="pedidosobservados">Pedidos observados</a></li>
				<li><a href="pedidosaprobados">Pedidos aprobados</a></li>
			</ul>
		</li>
		<li>Clientes
			<ul>
				<li><a href="vistaclientes">Buscar cliente</a></li>
			</ul>
		</li>
	</ul>
	
	

</body>
</html>