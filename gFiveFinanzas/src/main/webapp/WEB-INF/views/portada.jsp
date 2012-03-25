<%@ include file="/WEB-INF/views/include.jsp"%>

<html>
  <head><title><fmt:message key="title"/></title></head>
  <body>
    <p><fmt:message key="greeting"/><c:out value="${model.now}"/></p>
    <h3>Products</h3>
    
    	<c:out value="${model.usuario.usuario}"/>
    	<c:out value="${model.usuario.contraseña}"/><br><br>
    
    <br>
    <a href="<c:url value="pedidos.htm"/>">Increase Prices</a>
    <br>    
  </body>
