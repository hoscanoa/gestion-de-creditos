<%@ include file="/WEB-INF/views/include.jsp"%>

<html>
<head>
<title><fmt:message key="title" /></title>
 <style type="text/css">
 	body {
    	background:#fff;
   	    font-family: verdana, sans-serif; 
   	    font-size:12px;          
    }
    #wrap{
		width:300px;
		background:#fff;
		padding:10px;					
		} 
.form_1{
	width: 215px;
	padding: 10px;
	background: #eee;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 12px;
	color: #000;
	border: 1px solid #ddd;
	height: auto;
	}
	.label_1{
	display: block;
	margin-top: 10px;
	margin-bottom: 5px;
	}
	.input_1{
	display: block;
	width: 305px;
	border: 1px solid #ddd;
	color: #666;
	padding: 3px;
	font-size: 12px;
	}
	.button_1{
	display: block;
	margin-top: 10px;
	margin-right: 45px;
</style>  
</head>
<body>
<div id="wrap">
		<h3>Login</h3>
			<c:url var="loginUrl" value="/gfive/login" />
			<!--TODO 2 usar form de spring -->
			<form method="POST" action="${loginUrl}" class="form_1">
				<table>
					<tr>
						<td><label class="label_1">Nombre de Usuario:</label></td>
						<td><input type="text" name="user" class="input_1" /></td>
					</tr>
					<tr>
						<td><label class="label_1">Contraseña:</label></td>
						<td><input type="password" name="pass" class="input_1" /></td>
					</tr>
			</table>
			<input type="submit" value="Acceder" class="button_1" />
		</form>
		<br>
		<br>	
</div>	
</body>