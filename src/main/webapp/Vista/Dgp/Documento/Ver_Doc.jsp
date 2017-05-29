<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%-- 
    Document   : Ver_Doc
    Created on : 26-sep-2014, 14:43:40
    Author     : ALFA 
--%>


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
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>