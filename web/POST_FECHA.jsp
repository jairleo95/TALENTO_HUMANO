<%-- 
    Document   : POST_FECHA
    Created on : 23-ene-2015, 12:01:18
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
        <form action="Ver_Fecha.jsp" method="post">

            Seleccionar<input type="date"  name="fecha" required="" />
            <button type="submit" >
                Enviar
            </button>
        </form>
    </body>
</html>
