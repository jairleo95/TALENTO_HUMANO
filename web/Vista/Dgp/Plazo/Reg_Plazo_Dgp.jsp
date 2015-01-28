<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
        Usuario us = new Usuario();
%>
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
                listar();
                var b = $(".tbodys");

                $.post("../../../requerimiento", "opc=Listar_tp", function (objJson) {

                    var tp = $(".planilla");
                    tp.empty();
                    var lista = objJson.lista;
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }

                    var lista = objJson.lista;
                    tp.append("<option value=''>[Seleccione]</option>");
                    for (var t = 0; t < lista.length; t++) {
                        tp.append("<option value='" + lista[t].id + "'>" + lista[t].nombre + "</option>");
                    }


                });

                $(".planilla").change(function () {

                    $.post("../../../requerimiento", "opc=Listar_req_id&id=" + $(this).val(), function (objJson) {

                        var req = $(".req");
                        req.empty();
                        var lista = objJson.lista;
                        if (objJson.rpta == -1) {
                            alert(objJson.mensaje);
                            return;
                        }

                        var lista = objJson.lista;
                        req.append("<option value='' selected =''>[Seleccione]</option>");
                        req.append("<option value='0'>[Todos]</option>");
                        for (var t = 0; t < lista.length; t++) {
                            req.append("<option value='" + lista[t].id + "'>" + lista[t].nombre + "</option>");
                        }

                    });
                });

                function listar() {
                    $.post("../../../plazo_dgp", "opc=Listar_Plazo", function (objJson) {
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
                            b.append("<td class='planilla" + i + "'>" + lista[i].planilla + "</td>");
                            b.append("<td >" + lista[i].req + "</td>");
                            b.append("<input type='hidden' value='" + lista[i].id_req + "'/>");
                            b.append("<td><button value='" + i + "' class='Editar-Plazo'>Modificar</button><button value='" + i + "' class='Eliminar-Plazo' value='" + i + "'>Eliminar</button></td>");
                            b.append("</tr>");
                        }

                        $(".Editar-Plazo").click(
                                function () {
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
                }


                $("#btn-registrar").click(
                        function () {
                            $.post("../../../plazo_dgp", $("#form-plazo").serialize(), function () {
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
                <tr><td>Tipo planilla :<td>
                        <select name="planilla" class="planilla" required="">
                            <option value="">[Seleccione]</option>
                        </select>
                    </td></tr>
                <tr><td>Requerimiento :<td>
                        <select name="id_req" class="req"  required="">
                            <option value="">[Seleccione]</option>
                            <option value="0">[Todos]</option>
                        </select>
                    </td></tr>
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
                    <td>Tipo de Planilla</td>
                    <td>Requerimiento</td>
                    <td>Editar</td>

                </tr>
            </thead>
            <tbody  class="tbodys" >


            </tbody>

        </table>
    </center>

</body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>