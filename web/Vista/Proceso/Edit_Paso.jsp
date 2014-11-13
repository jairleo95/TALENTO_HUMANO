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

                var b = $(".tbodys");

                $.post("../../paso", "opc=Listar", function (objJson) {
                    b.empty();
                    var lista = objJson.lista;
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    for (var i = 0; i < lista.length; i++) {
                        b.append("<tr class='editar-tr" + i + "' >");
                        b.append("<td class='td_id_pro" + i + "' >" + lista[i].proceso_id + "</td>");
                        b.append("<td class='td_det" + i + "'><label>" + lista[i].det + "</label></td>");
                        b.append("<td class='td_num" + i + "'><label>" + lista[i].num + "</label></td>");
                        b.append("<td  class='td_co" + i + "'><label>" + lista[i].co + "</label></td>");
                        b.append("<td><button class='btn-editar' value='" + i + "' >Editar</button><button class='btn-eliminar' value='" + i + "' >Eliminar</button></td>");
                        b.append("</tr>");
                    }
                    $(".btn-editar").click(function () {
                        /*var num_p = $(".td_det" + $(this).val());
                         var texto = num_p.text();
                         $(".editar-tr0").hide();
                         // $(this).parent("tr").css("background-color", "red");
                         num_p.text("");
                         $(".td_det" + $(this).val()).append("<input type='text' name='edit" + $(this).val() + "' value='" + texto + "' />");
                         // alert( b);*/

                        //var num_p = $(".td_num" + $(this).val()).text();


                        var num = $(".tbodys tr").size();
                        alert(num);
                        for (var f = 0; f < num; f++) {
                            $(".td_num" + f).text("P" + (f + 1));
                        }


                    });
                       $(".btn-eliminar").click(
                                function () {

                                    if (confirm("Esta Seguro de Eliminar?")) {

                                        $.post("../../../plazo_dgp", "opc=Eliminar&plz=" + $(".id" + $(this).val()).text(), function () {

                                            listar();
                                        });

                                    } else {


                                    }



                                }
                        );
                });
            });

        </script>
    </head>
    <body> 
    <center>
        <h1>Mantenimiento de Pasos</h1>

        <form  method="post" id="form-plazo" >
            <table>
                <tr ><td >Nombre Plazo :<td><input type="text" name="nombre_plazo" required="" /></td></tr>
                <tr><td>Descripción :<td><textarea name="descripcion" required=""></textarea></td></tr>
                <tr><td>Desde :<td><input type="date" name="desde" required=""/></td></tr>
                <tr><td>Hasta :<td><input type="date" name="hasta" required="" /></td></tr>
                <tr><td><input type="submit" id="btn-registrar" name="opc" value="Establecer Plazo" /></td></tr>
            </table>
        </form>

        <table border='1'>
            <thead>
                <tr>
                    <td>Proceso</td>
                    <td>Descripción</td>
                    <td>Número</td>
                    <td>Codigo</td>
                    <td>Editar</td>

                </tr>
            </thead>

            <tbody  class="tbodys" >


            </tbody>

        </table>
    </center>

</body>
</html>
