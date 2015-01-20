<%-- 
    Document   : newjsp1
    Created on : 20-ene-2015, 10:21:24
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
        <h1>Hello World!</h1>
        <textarea><%=request.getParameter("valor")%></textarea>
    </body>
</html>
