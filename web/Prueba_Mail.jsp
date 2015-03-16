<%-- 
    Document   : Prueba_Mail
    Created on : 12-mar-2015, 10:04:29
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
        <form action="autorizacion" method="post">
            De :<input type="email" name="from" value="" />
            Para :<input type="email" name="to" value="" />
            Asunto :<input type="text" name="asunto" value="" />
            Cuerpo :<textarea name="cuerpo" ></textarea>
            <input type="hidden" name="opc" value="Enviar_Correo" />
            <br><button type="submit">Enviar</button>
        </form>
    </body>
</html>
