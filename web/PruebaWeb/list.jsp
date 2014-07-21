 

<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<jsp:useBean id="List_Usuario" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="../WEB-INF/jspf/jscss.jspf" %>
        <title>JSP Page</title>
    </head>
    <body>
        <%@include file="../WEB-INF/jspf/top.jspf" %>
        <div class="table-responsive">
            <a href="<%= request.getContextPath()%>/proveedor?op=create" class="btn btn-mini btn-primary" role="button">Nuevo</a>
            <table class="table table-bordered" style="width: 900px;">
                <tr>
                    <th>Id</th>
                    <th>Proveedor</th>
                    <th>RUC</th>
                    <th>Direccion</th>
                    <th>Telefono</th>
                    <th>Estado</th>
                    <th></th>
                </tr>
                <% for(int i=0; i<List_Usuario.size();i++){
                    Usuario us = new Usuario();
                    us = (Usuario)List_Usuario.get(i);
                    %>
                <tr>
                    <td><%=us.getNo_usuario() %></td>
                   
                    <td>
                        <a href="index" class="btn btn-mini btn-primary" role="button">Editar</a>
                        <a href="proveedor" class="btn btn-mini btn-primary" role="button">Eliminar</a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
        <%@include file="../WEB-INF/jspf/bottom.jspf" %>
    </body>
</html>
