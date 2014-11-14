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
        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <script>
            $(document).ready(function () {
                Listar_Paso();
                $("#btn-registrar").click(
                        function () {
                            $.post("../../paso", $("#form-paso").serialize(), function () {
                                Listar_Paso();

                            });
                            $("#btn-registrar").val("Registrar Paso");
                            $(".opc").val("Registrar");
                            $("#form-paso")[0].reset();

                            return false;

                        }
                );


                var b = $(".tbodys");
                function Listar_Paso() {
                    $.post("../../paso", "opc=Listar", function (objJson) {
                        b.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            b.append("<tr class='editar-tr" + i + "' >");
                            b.append("<td >" + (i + 1) + "</td>");

                            b.append("<td class='td_det" + i + "'><label>" + lista[i].det + "</label></td>");
                            b.append("<td class='td_num" + i + "'><label>" + lista[i].num + "</label></td>");
                            b.append("<td  class='td_co" + i + "'><label>" + lista[i].co + "</label></td>");
                            b.append("<td class='td_id_pro" + i + "' >" + lista[i].proceso_id + "</td>");
                            b.append("<input type='hidden' name='id' value='" + lista[i].id + "'  class='id_paso" + i + "'/>");
                            b.append("<td><button class='btn-editar' value='" + i + "' >Editar</button><button class='btn-eliminar' value='" + i + "' >Eliminar</button></td>");
                            b.append("</tr>");
                        }
                        $(".btn-editar").click(function () {
                            var num = $(".tbodys tr").size();
                            alert(num);
                            for (var f = 0; f < num; f++) {
                                $(".td_num" + f).text("P" + (f + 1));
                            }

                        });
                        $(".btn-eliminar").click(
                                function () {

                                    if (confirm("Esta Seguro de Eliminar?")) {

                                        $.post("../../paso", "opc=Eliminar&paso=" + $(".id_paso" + $(this).val()).val(), function () {

                                    Listar_Paso();
                                        });
            //alert($(".id_paso" + $(this).val()).val());

                                    } else {


                                    }



                                }
                        );
                    });

                }

            });

        </script>
    </head>
    <body> 
    <center>
        <h1>Mantenimiento de Pasos</h1>

        <form  method="post" id="form-paso" >
            <table>
                <tr ><td >Descripción :<td><textarea type="text" name="desc" required="" maxlength="300" rows="5" cols="50" ></textarea></td></tr>
                <tr><td>Numero :<td><input name="num" required="" maxlength="6"> </td></tr>
                <tr><td>Código:<td><input type="text" name="cod" required=""maxlength="6"  /></td></tr>
                <tr><td>Proceso:<td>
                        <select name="proceso" required="" >
                            <option value="PCO-000001">Preceso de Contratacion</option>
                        </select></td></tr>
                <input type="hidden" name="opc" value="Registrar"  class="opc"/>
                <tr><td><input type="submit" id="btn-registrar" name="Enviar" value="Registrar Paso" /></td></tr>
            </table>
        </form>

        <table border='1'>
            <thead>
                <tr>
                    <td>Nro</td>
                    <td>Descripción</td>
                    <td>Número</td>
                    <td>Codigo</td>
                    <td>Proceso</td>
                    <td>Editar</td>

                </tr>
            </thead>

            <tbody  class="tbodys" >


            </tbody>

        </table>
    </center>

</body>
</html>
