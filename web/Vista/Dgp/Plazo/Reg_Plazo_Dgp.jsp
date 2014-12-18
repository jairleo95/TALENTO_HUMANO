<%-- 
    Document   : Reg_Plazo_Dgp
    Created on : 08-nov-2014, 15:58:07
    Author     : JAIR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Plazo</title>
        <script type="text/javascript" src="../../../js/JQuery/jQuery.js" ></script>
        <script>
            $(document).ready(function() {
                listar();
                var b = $(".tbodys");
                function listar() {
                    $.post("../../../plazo_dgp", "opc=Listar", function(objJson) {
                        b.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            b.append("<tr>");
                            b.append("<td class='id" + i + "'>" + lista[i].id + "</td>");
                            b.append("<td class='nombre" + i + "'>" + lista[i].nom + "</td>");
                            b.append("<td class='det" + i + "'>" + lista[i].det + "</td>");
                            b.append("<td class='desde" + i + "'>" + lista[i].desde + "</td>");
                            b.append("<td class='hasta" + i + "'>" + lista[i].hasta + "</td>");
                            b.append("<td><button value='" + i + "' class='Editar-Plazo'>Modificar</button><button value='" + i + "' class='Eliminar-Plazo' value='" + i + "'>Eliminar</button></td>");
                            b.append("</tr>");
                        }

                        $(".Editar-Plazo").click(
                                function() {
                                    $(".nombre_plazo").val($(".nombre" + $(this).val()).text());
                                    $(".descripcion").val($(".det" + $(this).val()).text());
                                    $(".desde").val($(".desde" + $(this).val()).text());
                                    $(".hasta").val($(".hasta" + $(this).val()).text());
                                    $("#form-plazo").append("<input type='hidden' name='ID' value='" + $(".id" + $(this).val()).text() + "'  />");
                                    $("#btn-registrar").val("Modificar");
                                    $(".opc").val("Modificar");

                                }
                        );
                        $(".Eliminar-Plazo").click(
                                function() {

                                    if (confirm("Esta Seguro de Eliminar?")) {

                                        $.post("../../../plazo_dgp", "opc=Eliminar&plz=" + $(".id" + $(this).val()).text(), function() {

                                            listar();
                                        });

                                    } else {


                                    }



                                }
                        );

                    });
                }


                $("#btn-registrar").click(
                        function() {
                            $.post("../../../plazo_dgp", $("#form-plazo").serialize(), function() {
                                listar();

                            });
                            $("#btn-registrar").val("Registrar Plazo");
                            $(".opc").val("Registrar");
                            $("#form-plazo")[0].reset();

                            return false;

                        }
                );


            });

        </script>
    </head >


    <body > 
    <center>
        <h1>Mantenimiento de Plazos de Requerimientos</h1>

        <form  method="post" id="form-plazo" >
            <table>
                <tr><td>Nombre Plazo :<td><input type="text" name="nombre_plazo" required="" class="nombre_plazo" /></td></tr>
                <tr><td>Descripción :<td><textarea name="descripcion" required="" class="descripcion"></textarea></td></tr>
                <tr><td>Desde :<td><input type="date" name="desde" required="" class="desde"/></td></tr>
                <tr><td>Hasta :<td><input type="date" name="hasta" required="" class="hasta"/></td></tr>
                <input type="hidden" name="opc" value="Registrar"  class="opc"/>
                <tr><td><input type="submit" id="btn-registrar" name="Enviar" value="Registrar Plazo" /></td></tr>
            </table>
        </form>
        <table border='1'>
            <thead>
                <tr>
                    <td>ID</td>
                    <td>Nombre Plazo</td>
                    <td>Descripción</td>
                    <td>Desde</td>
                    <td>Hasta</td>
                    <td>Editar</td>

                </tr>
            </thead>
            <tbody  class="tbodys" >


            </tbody>

        </table>
    </center>

</body>
</html>
