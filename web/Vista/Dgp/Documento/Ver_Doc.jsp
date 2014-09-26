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
    </head>
    <body>
        <img src="Archivo/<%=request.getParameter("nom_doc")%>">
        <%=request.getParameter("nom_doc")%>
    </body>
</html>
