<%@ include file="/WEB-INF/views/include.jsp"%>
<%@page import="com.gfive.domain.Usuario"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

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
.form_1{
	width: 315px;
	padding: 20px;
	background: #eee;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000;
	border: 1px solid #ddd;
	height: auto;
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
	<h1>Línea de crédito</h1>

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
			<input type="submit" value="Actualizar" class="button_1" />
		</form:form>
	</c:if>

	<c:url var="homeUrl" value="/gfive/home" />
	<h1><a href="${homeUrl}">Regresar</a></h1>

</body>
</html>