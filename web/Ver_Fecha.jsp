<%-- 
    Document   : Ver_Fecha
    Created on : 27-nov-2014, 15:21:53
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
        <input  type="date" class="fecha"/>
        <div class="ver"></div>


        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>


        <script>
            $(document).ready(
                    function () {
                        $(".fecha").change(function () {

                            $(".ver").text($(".fecha").val());

                        });


                        var t = "PUT-000004";
                        alert(t.substring(0, 3));



                        $(".btn_texto").click(function () {
                            var menu = {
                                "[nombre]": "Jair Samuel",
                                "[ape_p]": "Santos",
                                "[ape_m]": "Gonzales",
                                "[sexo]": "Masculino"
                            };
                            var string_texto = "";
                            var texto = $(".label_texto").text();
                            var arr_text;
                            for (var key in menu) {
                                var val = menu[key];
                                arr_text = texto.split(key);
                                for (var g = 0; g < arr_text.length; g++) {
                                    string_texto = string_texto + arr_text[g] + (((g + 1) == arr_text.length) ? "" : " " + val + " ");
                                }
                                texto = string_texto;
                                string_texto = "";
                            }
                            $(".ver").text(texto);


                        });


                    });

        </script> 
        <button class="btn_texto" type="button">Procesar </button>

        <label class="label_texto">Hola [nombre] [ape_p] [ape_m] este es [sexo] un texto donde pued reconocer [nombre] cualquier tipo de campo que este dentro de mi rango desde la base de datos</label>
    </body>
</html>
