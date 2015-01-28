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
        <form action="../../foto" method="get" enctype="multipart/form-data" class="form-subir-foto">
            <table>
                <input type="hidden" name="idtr" value="<%=request.getParameter("idtr")%>">
                <tr><td>Abrir Imagen:</td><td><input style="display: none" class="file-foto" type="file" name="archivo" required=""></td></tr>
                <tr><td><input type="submit" value="Subir"></td><td><input type="reset"></td></tr>
            </table>
        </form>    
    </center>
    <img src="Fotos/122629_TRB-000811_IMAGEN6.PNG.png" class="ver_foto" style='cursor: pointer'/>
</body>
<script type="text/javascript" language="javascript">
    $('.ver_foto').click(function () {
        $(".file-foto").click();
        alert($(".form-subir-foto").serialize());
    });
    $(window).load(function () {

        $(function () {
            $('.file-foto').change(function (e) {
                if (this.files[0].size <= 500000) {
                    addImage(e);
                    alert("Archivo permitido");
                } else {
                    alert("Archivo no permitido, su tamaño debe ser menor a 500 KB");
                    $(this).val('');
                }


            });

            function addImage(e) {
                var file = e.target.files[0],
                        imageType = /image.*/;

                if (!file.type.match(imageType))
                    return;

                var reader = new FileReader();
                reader.onload = fileOnload;
                reader.readAsDataURL(file);
            }

            function fileOnload(e) {
                var result = e.target.result;
                $('.ver_foto').attr("src", result);
            }
        });
    });
</script>
</html>
