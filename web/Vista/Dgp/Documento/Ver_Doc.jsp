<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : Ver_Doc
    Created on : 26-sep-2014, 14:43:40
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            .archivo{
                max-width:500px;
                min-height:50px; 
                
            }
            
        </style>
    </head>
    <body>
        <center>
            <img src="Archivo/<%=request.getParameter("nom_doc")%>" class="archivo" >
        </center>
    </body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>