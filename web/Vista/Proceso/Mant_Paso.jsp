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
        <title>Mant. Plazo</title>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js" ></script>
        <script>
            $(document).ready(function () {
                listar_Proceso();
                Listar_Paso($("#select-proceso").val());


                $("#btn-registrar").click(
                        function () {
                            var pr = $("#select-proceso").val();
                            $.post("../../paso", $("#form-paso").serialize(), function () {
                                Listar_Paso(pr);
                            });
                            $("#btn-registrar").val("Registrar Paso");
                            $(".opc").val("Registrar");
                            $("#form-paso")[0].reset();

                            return false;
                        }
                );
                function listar_Proceso() {
                    var s = $("#select-proceso");
                    $.post("../../proceso", "opc=Listar", function (objJson) {
                        s.empty();
                        var lista = objJson.lista;
                        s.append("<option value='' > </option>");
                        for (var j = 0; j < lista.length; j++) {
                            s.append("<option value='" + lista[j].id + "' > " + lista[j].nom + "</option>");
                        }
                    });
                }
                $("#select-proceso").change(
                        function () {
                            Listar_Paso($(this).val());
                            // alert($(this).val());
                        });
                var b = $(".tbodys");
                function Listar_Paso(proceso) {

                    $.post("../../paso", "opc=Listar&proceso=" + proceso, function (objJson) {
                        b.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }
                        for (var i = 0; i < lista.length; i++) {
                            b.append("<tr class='editar-tr" + i + "' >");
                            b.append("<td >" + (i + 1) + "</td>");
                            b.append("<td class='td_det" + i + "'>" + lista[i].det + "</td>");
                            b.append("<td class='td_num" + i + "'><label>" + lista[i].num + "</label></td>");
                            b.append("<td  class='td_co" + i + "'><label>" + lista[i].co + "</label></td>");
                            b.append("<td class='td_id_pro" + i + "' >" + lista[i].proceso_id + "</td>");
                            b.append("<input type='text' name='id' value='" + lista[i].id + "'  class='id_paso" + i + "'/>");
                            b.append("<td><button class='btn-editar' value='" + i + "' >Editar</button><button class='btn-eliminar' value='" + i + "' >Eliminar</button></td>");
                            b.append("</tr>");
                        }
                        $(".Generar").click(function () {
                            var num = $(".tbodys tr").size();

                            for (var f = 0; f < num; f++) {
                                $(".td_num" + f).text("P" + (f + 1));
                            }
                        });
                        $(".btn-editar").click(function () {
                            $(".desc_paso").val($(".td_det" + $(this).val()).text());
                            $(".num_paso").val($(".td_num" + $(this).val()).text());
                            $(".co_paso").val($(".td_co" + $(this).val()).text());
                            $("#select-proceso").val($(".td_id_pro" + $(this).val()).text());
                            $(".id_p").val($(".id_paso"+$(this).val()));


                            $("#btn-registrar").val("Modificar");
                            $(".opc").val("Modificar");
                        });
                        $(".btn-eliminar").click(
                                function () {
                                    var pr_e = $("#select-proceso").val();
                                    if (confirm("Esta Seguro de Eliminar?")) {
                                        $.post("../../paso", "opc=Eliminar&paso=" + $(".id_paso" + $(this).val()).val(), function () {
                                            Listar_Paso(pr_e);
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
                <tr ><td >Descripción :<td><textarea type="text" name="desc" required="" maxlength="300" rows="5" cols="50" class="desc_paso" ></textarea></td></tr>
                <tr><td>Numero :<td><input name="num" required="" class="num_paso" maxlength="6"> </td></tr>
                <tr><td>Código:<td><input type="text" name="cod" class="co_paso" required=""maxlength="6"  /></td></tr>
                <tr><td>Proceso:<td>
                        <select name="proceso" required=""  id="select-proceso">

                        </select></td></tr>
                <input type="hidden" name="opc" value="Registrar"  class="opc"/>
                <input type="hidden" name="id" value=""  class="id_p"/>
                <tr><td><input type="submit" id="btn-registrar" name="Enviar" value="Registrar Paso" /></td></tr>
            </table>
        </form>
        <button class="Generar">Generar Numeros</button>
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
