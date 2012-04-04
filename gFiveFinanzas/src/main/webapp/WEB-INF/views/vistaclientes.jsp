<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>

<html>
<head>
<title><fmt:message key="title" /></title>
<style>
body {
    	background:#005fbf;
   	    font-family: verdana, sans-serif;  
   	    font-size:10px;           
    }
h1{
	font-family: Calibri;  
   	font-size:22px; 
   	}
h2{
	font-family: calibri;  
   	font-size:16px; 
}
h3{
	font-family: calibri;  
   	font-size:14px; 
}
tr{
	background:#e5e5e5;
	
}
th{
	font-family: verdana, sans-serif;  
   	font-size:16px; 
   	border-style:solid;
	border-width:1px;
	border-color:#333;

}
td{
	border-style:solid;
	border-width:1px;
	border-color:#333;
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

<h1>Clientes</h1>

<c:if test="${empty clientes}">
	No se encontraron clientes
</c:if>

<c:if test="${!empty clientes}">
<table>
	<thead>
		<tr>
			<th><h2>RUC del cliente</h2></th>			
			<th><h2>Razón Social</h2></th>
			<th><h2>Línea de Crédito</h2></th>
			<th><h2>Saldo</h2></th>
		</tr>
	</thead>
	<tbody>
	<c:forEach items="${clientes}" var="cliente">
			<c:url var="lineacreditoUrl" value="/gfive/lineacredito?id=${cliente.cli_ruc}" />
					<tr>
			<td><h3><c:out value="${cliente.cli_ruc}" /></h3></td>
			<td><h3><c:out value="${cliente.cli_razonSocial}" /></h3></td>
			<td><h3><c:out value="${cliente.cli_lineaCreditoTotal}" /></h3></td>
			<td><h3><c:out value="${cliente.cli_lineaCreditoSaldo}" /></h3></td>
			<td><h3><a href="${lineacreditoUrl}">Administrar línea de crédito</a></h3></td>			
		</tr>
	</c:forEach>
	</tbody>
</table>
</c:if>

<br>
<c:url var="homeUrl" value="/gfive/home" />
<h1><a href="${homeUrl}">Regresar</a></h1>

</body>
</html>