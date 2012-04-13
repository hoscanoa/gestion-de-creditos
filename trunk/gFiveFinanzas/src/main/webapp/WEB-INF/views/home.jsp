<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
<style>
body {
    	background:#005fbf;          
    }
h1{
	font-family: Calibri;  
   	font-size:30px; 
   	border:1px;
   	color:#fff;
   	}
h2{
	font-family: calibri;  
   	font-size:20px; 
   	color:#fff;

}
h3{
	font-family: calibri;  
   	font-size:16px; 
   	background-color:#333;
   	color:#fff;
   	
h4{


}
.container{
	padding:20px;
}
.bienvenido{
	float:right;
	width: 300px;
	height: 100px;
	padding:20px;
	background:#005fbf;
}
.imagen{
	float:left;
	width: 329px;
	height: 94px;
	
}
ul li{
	display:inline;
	padding:0 5px 0 0;
	color:#333;	
}
ul li a:hover{
	color:#000;
}
ul li a{
			color: #fff;
			padding: 5px 10px;
			float:left;
			font:18px/20px verdana;	
</style>
</head>
<body>
<div class="container">
	<div class="imagen"><img src="<c:url value="webapp/resources/images/telecentro.gif"/>" alt="Ad-1"/>
	</div>
	<div class="bienvenido">
	<h1>Bienvenido</h1>
	<h2><c:out value="${sessionScope.USUARIO_ACTUAL.nombreUsuario}"></c:out></h2>
	<h2>Pedidos</h2>
	<ul>
		<li><h2><a href="pedidospendientes">Pedidos pendientes</a></h2></li>
		<li><h2><a href="pedidosobservados">Pedidos observados</a></h2></li>
		<li><h2><a href="pedidosaprobados">Pedidos aprobados</a></h2></li>
	</ul>
	<h2>Clientes</h2>
	<ul>
		<li><h2><a href="vistaclientes">Administrar clientes</a></h2></li>
	</ul>
	</div>
</div>
</body>
</html>