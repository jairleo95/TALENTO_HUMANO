<%-- 
    Document   : Subir_Foto
    Created on : 12-oct-2014, 16:05:50
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Subir Foto Trabajador</title>
    </head>
    <body>
    <center>
        <form action="../../foto" method="post" enctype="multipart/form-data">
            <table>
                <!-- <tr><td>Trabajador:</td><td> <input type="text" name="IDDATOS_TRABAJADOR"></td></tr>-->
                <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                <tr><td>Abrir Imagen:</td><td><input type="file" name="archivo"></td></tr>
                <!---<tr><td>Descripción:</td><td><input type="text" name="lob_description"></td></tr>-->
                <tr><td><input type="submit" value="Subir"></td><td><input type="reset"></td></tr>
            </table>
        </form>    
    </center>
</body>
</html>
