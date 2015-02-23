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
            <label>Semestre :</label><select class="semestre">
                <option value="">[SELECCIONE]</option>
                <option value="2015-1">2015-1</option>
                <option value="2015-0">2015-0</option>
                <option value="2014-2">2014-2</option>
                <option value="2014-1">2014-1</option>
                <option value="2014-0">2014-0</option>
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
                    <th>ACCIONES</th>
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

            var url = 'http://localhost/demo/data.php';

            $(".semestre").change(function () {

                $('.tbody-carga').empty();
                $('.tbody-carga').append("<tr><td colspan='9' >Cargando... </td></tr>");
                $.post(url, "semestre=" + $(".semestre").val(), function (data) {
                    $('.tbody-carga').empty();
                    $.each(data, function (i, campo) {
                        $('.tbody-carga').append('<tr>');
                        $('.tbody-carga').append('<td>' + campo.tipodocumento + '</td>');
                        $('.tbody-carga').append('<td>' + campo.numerodocumento + '</td>');
                        $('.tbody-carga').append('<td>' + campo.apepat + ' ' + campo.apemat + ' ' + campo.nombre + '</td>');
                        $('.tbody-carga').append('<td>' + campo.eap + '</td>');
                        $('.tbody-carga').append('<td>' + campo.facultad + '</td>');
                        $('.tbody-carga').append('<td>' + campo.carga + '</td>');
                        $('.tbody-carga').append('<td></td>');
                        $('.tbody-carga').append('<td></td>');
                        $('.tbody-carga').append('<td><a href="../../../carga_academica?opc=Completar_Datos&nro_doc=' + campo.numerodocumento + '&ap_p=' + campo.apepat + '&ap_m=' + campo.apemat + '&no_tr=' + campo.nombre + '&ti_doc=' + campo.tipodocumento + '">Completar datos</a><a href="Horario_Academico.jsp?dni=' + campo.numerodocumento + '&semestre=' + $(".semestre").val() + '">Ver Cursos</a></td>');
                        $('.tbody-carga').append('</tr>');
                    });
                });
            });



        });
    })(jQuery);

</script>
</html>
