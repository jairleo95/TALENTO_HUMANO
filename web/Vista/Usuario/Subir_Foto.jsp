<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
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
        <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
    </head>
    <body>
    <center>
        <form action="../../foto" method="post" enctype="multipart/form-data" class="form-subir-foto">
            <table>
                <!-- <tr><td>Trabajador:</td><td> <input type="text" name="IDDATOS_TRABAJADOR"></td></tr>-->
                <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                <tr><td>Abrir Imagen:</td><td><input class="file-foto" type="file" name="archivo" required=""></td></tr>
                <!---<tr><td>Descripción:</td><td><input type="text" name="lob_description"></td></tr>-->
                <tr><td><input type="submit" value="Subir"></td><td><input type="reset"></td></tr>
            </table>
        </form>    
    </center>
    <img src="Fotos/122629_TRB-000811_IMAGEN6.PNG.png" class="ver_foto" style='cursor: pointer'/>
</body>

<script>
    $('.file-foto').bind('change', function () {
        if (this.files[0].size <= 500000) {
            alert("Archivo permitido");
        } else {
            alert("Archivo no permitido, su tamaño debe ser menor a 500 KB");
            $(this).val('');
        }
    });
    $('.ver_foto').click(function () {
        alert();
    });
</script>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>