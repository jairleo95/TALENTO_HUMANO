<%-- 
    Document   : demo
    Created on : 14-nov-2014, 9:31:58
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Lista docentes</h1>
        <input  type="text" value="" id="sem"/>
        <button class="listar">Buscar</button>
        <span id="cargador">Cargando...</span>
        <ul id="listaDoc" style="display:block;">
        </ul>

        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>
        <script>

            (function ($) {
                $(document).ready(function () {
                    $('#cargador').show();

                    var url = 'http://localhost/demo/data.php';

                    $(".listar").click(function () {

                        $.post(url, "semestre="+$("#sem").val(), function (data) {
                            $('#cargador').hide();
                            $('#listaDoc').show();
                            $.each(data, function (i, campo) {
                                $('#listaDoc').append('<li><strong>' + campo.dni + '</strong> - ' + campo.nombre + '</li>');
                            });
                        });
                    });



                });
            })(jQuery);

        </script>
    </body>
</html>
