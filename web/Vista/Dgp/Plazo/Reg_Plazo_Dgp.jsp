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
            $(document).ready(function () {
                var b = $(".tbodys");
                function listar() {
                    $.post("../../../plazo_dgp", "opc=Listar", function (objJson) {
                        b.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            b.append("<tr>");
                            b.append("<td>" + lista[i].nom + "</td>");
                            b.append("<td>" + lista[i].det + "</td>");
                            b.append("<td>" + lista[i].desde + "</td>");
                            b.append("<td>" + lista[i].hasta + "</td>");
                            b.append("</tr>");
                        }
                    });
                }
                listar();

                $("#btn-registrar").click(
                        function () {
                            $.post("../../../plazo_dgp", $("#form-plazo").serialize() + "&opc=Registrar");
                            $("#form-plazo")[0].reset();
                            listar();
                            return false;
                        }
                );
            });

        </script>
    </head>
    <body> 
    <center>
        <h1>Registrar Plazo para Requerimientos</h1>

        <form  method="post" id="form-plazo" >
            <table>
                <tr><td>Nombre Plazo :<td><input type="text" name="nombre_plazo" required="" /></td></tr>
                <tr><td>Descripción :<td><textarea name="descripcion" required=""></textarea></td></tr>
                <tr><td>Desde :<td><input type="date" name="desde" required=""/></td></tr>
                <tr><td>Hasta :<td><input type="date" name="hasta" required="" /></td></tr>
                <tr><td><input type="submit" id="btn-registrar" name="opc" value="Establecer Plazo" /></td></tr>
            </table>
        </form>
        <table border='1'>
            <thead>
                <tr>
                    <td>Nombre Plazo</td>
                    <td>Descripción</td>
                    <td>Desde</td>
                    <td>Hasta</td>

                </tr>
            </thead>
            <tbody  class="tbodys" >


            </tbody>

        </table>
    </center>

</body>
</html>
