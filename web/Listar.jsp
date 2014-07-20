<%-- 
    Document   : Listar
    Created on : 18-jul-2014, 9:55:18
    Author     : Alfa.sistemas
--%>


<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Usuario" scope="session" class="java.util.ArrayList" />
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <a href="<%= request.getContextPath()%>/proveedor?op=create" class="btn btn-mini btn-primary" role="button">Nuevo</a>
       <%
           //UsuarioDAO usdao =  new UsuarioDAO();
           
           out.println(List_Usuario().size());
          
            
     for(int i =0;i<List_Usuario().size();i++){
         Usuario us= new Usuario();
             us= (Usuario)List_Usuario().get(i);
             
     out.println(us.getNo_usuario());
     out.println("<br>");
 
     
     }
       %>
    </body>
</html>
