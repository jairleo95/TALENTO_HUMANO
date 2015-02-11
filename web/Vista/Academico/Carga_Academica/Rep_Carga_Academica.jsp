<%-- 
    Document   : Rep_Carga_Academica
    Created on : 09-feb-2015, 17:00:33
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carga Academica</title>
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
    </head>
    <body>
    <center>
        <h1>CARGA ACADEMICA</h1>
        <form action="">
            <label>Semestre :</label><select>
                <option></option>
            </select>
            <br>
            <label>Area o Sede :</label><select>
                <option></option>
            </select>
            <br>

            <label>Facultad :</label><select>
                <option></option>
            </select>
            <br>
            <label>Carrera :</label><select>
                <option></option>
            </select>
            <br>
            <label>Situación Educativa :</label><select>
                <option></option>
            </select>
            <br>
            <label>Profesión Docente :</label><select>
                <option></option>
            </select>
            <br>
            <label>Tipo de Curso :</label><select>
                <option></option>
            </select>
            <br>
            <label>Funciones :</label><select>
                <option></option>
            </select>
            <br>

        </form>
        <button type="button" class="listar">
            Listar
        </button>
        <table border="1">
            <thead>
                <tr>
                    <th>Tipo Doc</th>
                    <th>Num. Doc</th>
                    <th>APELLIDOS Y NOMBRES</th>
                    <th>ESCUELA</th>
                    <th>FACULTAD</th>
                    <th>CICLO</th>
                    <th>FECHA INICIO</th>
                    <th>FECHA CESE</th>
                </tr>

            </thead>
            <tbody class="tbody-carga">
           

            </tbody>
        </table>
    </center>
</body>
<script>

    (function ($) {
        $(document).ready(function () {
            $('#cargador').show();

            var url = 'http://localhost/demo/data.php';

            $(".listar").click(function () {
                  $('.tbody-carga').empty();

                $.post(url, function (data) {
                    $('#cargador').hide();
                    $('#listaDoc').show();
                    $.each(data, function (i, campo) {
                        $('.tbody-carga').append('<tr>');
                        $('.tbody-carga').append('<td>' + campo.tipodocumento +'</td>');
                        $('.tbody-carga').append('<td>' + campo.numerodocumento +'</td>');
                        $('.tbody-carga').append('<td>' + campo.apepat+' '+campo.apemat+' '+campo.nombre + '</td>');
                        $('.tbody-carga').append('<td>' + campo.eap +'</td>');
                        $('.tbody-carga').append('<td>' + campo.facultad+ '</td>');
                        $('.tbody-carga').append('<td>' + campo.dni +'</td>');
                        $('.tbody-carga').append('<td>' + campo.dni +'</td>');
                        $('.tbody-carga').append('<td>' + campo.dni +'</td>');
                        $('.tbody-carga').append('</tr>');
                    });
                });
            });



        });
    })(jQuery);

</script>
</html>
