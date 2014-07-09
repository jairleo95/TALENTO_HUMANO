<%-- 
    Document   : Principal
    Created on : 09-jul-2014, 16:31:23
    Author     : Alfa.sistemas
--%>
<%
HttpSession sesion= request.getSession(true);
String Usuario = (String)sesion.getAttribute("IDUSER");
if(Usuario!=null){
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Principal</title>
    </head>
    <body>
     asojfosijfosjfsdioghsdjklgh
    </body>
</html>
<%}%>