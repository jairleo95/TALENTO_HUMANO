<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Mant_Mod_Privilegio
    Created on : 13-ene-2015, 17:44:48
    Author     : joserodrigo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <title>MANTENIMIENTO DE MODULO & REQUERIMIENTO</title>
    </head>
    <body>
        <div>
            <center><h1 class="spacing" style="font-weight: bold;"> MANT. DE MOD. Y PRIV.</h1></center>
        </div>
        <div id="contenido">
            <div class="form-group row">
                <center>
                    <form  class="form-modulo" action="">
                        <table>
                            <tr><td colspan="3"><label>MODULO:</label></td>
                                <td colspan="3">
                                    <select class="selec_id_modulo form-control" name="id_modulo" required="" id="selec_modulo">
                                        <option >[SELECCIONAR]</option>
                                    </select>
                                </td>
                            </tr>
                            <tr><td colspan="3"><label>PRIVILEGIO:</label></td>
                                <td colspan="3">
                                    <select class="form-control" name="id_privi" required="" id="selec_priv">
                                        <option>[SELECCIONAR]</option>
                                    </select>
                                </td>
                            </tr>
                            <input  type="hidden" name="opc" value="Registrar"/>
                            <tr><td colspan="6"><button class="btn btn-primary" name="" id="btn_prv" >REGISTRAR</button></td></tr>

                        </table>
                    </form>
                </center>
            </div>
            <div class="container" >
                <center>
                    <table id="rellena" class="table">
                        <thead class="tab_cabe">
                            <tr class="tr">
                                <td><span >Nro</span></td>
                                <td><span title="no_md">MODULO</span></td>
                                <td><span title="es_md">ESTADO MODULO </span></td>
                                <td><span title="no_pr">PRIVILEGIO</span></td>
                                <td><span title="es_pr">ESTADO MODULO PRIV.</span></td>
                                <td colspan="2"><span>OPCIONES</span></td>
                            </tr>
                        </thead>
                        <tbody class="tbodys" id="list">

                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
    <script src="../../js/libs/jquery-ui-1.10.3.min.js"></script>
    <script>
        function Listar() {
            var a = $("#list");
            $.post("../../modulo", "opc=lis_pr_mod_x_id&" + "id_modulo=" + $("#selec_modulo").val(), function(objJson) {

                a.empty();
                var lista = objJson.lista;
                var nroe = 1;
                if (lista.length > 0) {
                    for (var i = 0; i < lista.length; i++) {
                        nroe = nroe + i;
                        a.append("<tr>");
                        a.append("<td align='center'>" + nroe + "</td>");
                        a.append("<td align='center'>" + lista[i].no_md + "</td>");
                        if (lista[i].es_md == '1') {
                            a.append("<td align='center'><p>ACTIVADO</p></td>");
                        } else {
                            a.append("<td align='center'><p>DESACTIVADO</p></td>");
                        }
                        a.append("<td><p>" + lista[i].no_pr + "</p></td>");
                        if (lista[i].es_pr == '1') {
                            a.append("<td align='center'><p>ACTIVADO</p></td>");
                        } else {
                            a.append("<td align='center'><p>DESACTIVADO</p></td>");
                        }
                        if (lista[i].id_md == 'MOD-0010') {
                            a.append('<td align="center"><button value=' + lista[i].id_pr + ' class="btn_activar" disabled="">Activar</button></td>');
                            a.append('<td align="center"><button value=' + lista[i].id_pr + ' class="btn_desactiva" disabled="">Desactivar</button></td>');
                        } else {
                            a.append("<td align='center'><button value=" + lista[i].id_pr + " class='btn_activar'>Activar</button></td>");
                            a.append("<td align='center'><button value=" + lista[i].id_pr + " class='btn_desactivar'>Desactivar</button></td>");
                        }
                        $(".btn_desactivar").click(
                                function() {
                                    $.post("../../modulo", "opc=desactivar_pri_mod&" + "id_privilegio=" + $(this).val(), function() {
                                        Listar();
                                    });

                                });
                        $(".btn_activar").click(
                                function() {
                                    $.post("../../modulo", "opc=activar_pri_mod&" + "id_pr=" + $(this).val(), function() {
                                        Listar();
                                    });
                                });
                        nroe = 1;
                    }
                } else {
                    a.append('<tr><td colspan="10" align="center">No tiene Privilegios</td></tr>');
                }

            });
        }

        $(document).ready(function() {
            list_modulo();
            list_Priv();
            //lerta_decir('asas');
            //list_Priv_mod();
            function list_modulo() {
                var mo = $("#selec_modulo");
                $.post("../../modulo", "opc=lis_mod", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value='" + lista[i].id_mod + "' >" + lista[i].no_mod + "</option>");
                    }

                });
            }
            function list_Priv() {
                var mo = $("#selec_priv");
                $.post("../../modulo", "opc=lis_req", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value=''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value='" + lista[i].id_prv + "'>" + lista[i].no_prv + "</option>");
                    }
                });
            }

            $("#selec_modulo").change(
                    function() {
                        Listar();
                    });

            $("#btn_prv").click(
                    function() {
                        $.post("../../modulo", $(".form-modulo").serialize(), function(objJson) {
                            //alert(objJson.rpta);
                            //alert($(".form-modulo").serialize());
                            Listar();
                        });
                        return false;
                    });
        });
    </script>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
