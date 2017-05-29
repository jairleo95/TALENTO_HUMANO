<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Mantenimiento_Privilegio
    Created on : 14-ene-2015, 18:15:40
    Author     : joserodrigo
--%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <title>JSP Page</title>
    </head>
    <body>
    <center><h1 class="spacing" style=" font-weight: bold;">Mantenimiento Privilegios</h1></center>
        <form>
            <div>
                <center>
                    <table>
                        <tr>
                            <td><label> Modulo </label><br>
                            
                                <select class="select_modulo form-control" id="id_mos" style="border-radius: 5px;">
                                </select>
                            </td>
                            
                        </tr>
                        
                        <tr>
                            <td><label> Nombre de Privilegio</label><br>
                            <input type="text" name="no_priv" class="no_pri form-control" required="" style="border-radius: 5px;"></td>
                        </tr>
                        <tr>
                            <td><label> Direccion url</label>
                            <input type="text" name="no_priv" class="di_pr form-control" required="" style="border-radius: 5px;"></td>
                        </tr>
                        <tr>
                            <td><label> direcion icono</label>
                            <input type="text" name="no_priv" class="ic_pri form-control" required="" style="border-radius: 5px;"></td>
                        </tr>
                        <tr>
                            <td><label> Estado Privilegio</label>
                            
                                <select class="select_estado form-control" required="" style="border-radius: 5px;">
                                    <option value="">[SELECCIONAR]</option>
                                    <option value="1">Activado</option>
                                    <option value="0">Desactivado</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td align="center"><br><button>Registrar</button></td>
                        </tr>
                    </table>
                </center>
            </div>
            <div class="conteiner">
                <center>
                    <table class="table">
                        <thead class="tab_cabe">
                            <tr class="tr">
                                <td><span >Nro</span></td>
                                <td><span title="no_md">Modulo</span></td>
                                <td><span title="no_pr">Privilegio</span></td>
                                <td><span title="es_pr">Estado</span></td>
                                <td colspan="4"><span >Opciones</span></td>
                            </tr>
                        </thead>
                        <tbody class="tbodys">

                        </tbody>
                    </table>
                </center>
            </div>
        </form>
    </body>
    <script type="text/javascript" src="../../../js/JQuery/jQuery.js"></script>

    <script>
        $(document).ready(function() {
            list_modulo();
            function list_modulo() {
                var mo = $(".select_modulo");
                $.post("../../../modulo", "opc=lis_mod", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value='" + lista[i].id_mod + "' >" + lista[i].no_mod + "</option>");
                    }
                });
            }
            $(".select_modulo").change(
                    function() {
                        Listar();
                    });
            function Listar() {
                var a = $(".tbodys");
                $.post("../../../modulo", "opc=lis_pr_mod_x_id&" + "id_modulo=" + $("#select_modulo").val(), function(objJson) {

                    a.empty();
                    var lista = objJson.lista;
                    var nroe = 1;
                    if (lista.length > 0) {
                        for (var i = 0; i < lista.length; i++) {
                            nroe = nroe + i;
                            a.append("<tr>");
                            a.append("<td align='center'>" + nroe + "</td>");
                            a.append("<td align='center'>" + lista[i].no_md + "</td>");
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
                            // a.append("<td align='center'><a onclick='activar_priv('"+lista[i].no_pr+"');'>Desactivar</button></a></td>");
                            //a.append("");
                            /*$(".btn_desactivar").click(
                                    function() {
                                        $.post("../../modulo", "opc=desactivar_pri_mod&" + "id_privilegio=" + $(this).val(), function() {
                                            alert($(this).val());
                                        });
                                        Listar();
                                    });
                            $(".btn_activar").click(
                                    function() {
                                        $.post("../../modulo", "opc=activar_pri_mod&" + "id_pr=" + $(this).val(), function() {
                                        });
                                        Listar();
                                    });*/
                            nroe = 1;
                        }
                    } else {
                        a.append('<tr><td colspan="10" align="center">No tiene Privilegios</td></tr>');
                    }

                });
            }
        });
    </script>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>