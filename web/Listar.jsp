<%-- 
    Document   : Listar
    Created on : 18-jul-2014, 9:55:18
    Author     : Alfa.sistemas
--%>

<%@page import="pe.edu.upeu.application.dao.UsuarioDAO"%>
<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="jdk.nashorn.internal.runtime.ListAdapter"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="General" scope="page" class="Usuario">
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
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
