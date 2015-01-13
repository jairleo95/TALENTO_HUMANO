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
                    <table>
                        <tr><td colspan="3"><label>MODULO:</label></td>
                            <td colspan="3">
                                <select class="form-control" name="id_modulo" required="" id="selec_mod">
                                    <option >[SELECCIONAR]</option>
                                </select>
                            </td>
                        </tr>
                        <tr><td colspan="3"><label>PRIVILEGIO:</label></td>
                            <td colspan="3">
                                <select class="form-control" name="id_req" required="" id="selec_reque">
                                    <option>[SELECCIONAR]</option>
                                </select>
                            </td>
                        </tr>
                        <table>
                            <tr><td colspan="6"><button class="btn btn-primary" name="" id="btn_req" >REGISTRAR</button></td></tr>

                        </table>
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
                                <td colspan="3"><span>OPCIONES</span></td>
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
    <script>
        $(document).ready(function() {
            list_modulo();
            list_Priv();
            list_Priv_mod()
            function list_modulo() {
                var mo = $("#selec_mod");
                $.post("../../modulo", "opc=lis_mod", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value'" + lista[i].id_mod + "'>" + lista[i].no_mod + "</option>");
                    }

                });
            }
            function list_Priv() {
                var mo = $("#selec_reque");
                $.post("../../modulo", "opc=lis_req", function(objJson) {
                    mo.empty();
                    var lista = objJson.lista;
                    mo.append("<option value''>[SELECCIONAR]</option>");
                    for (var i = 0; i <= lista.length; i++) {
                        mo.append("<option value'" + lista[i].id_prv + "'>" + lista[i].no_prv + "</option>");
                    }
                });
            }
            /*function list_Priv_mod() {
             var mo = $(".tbodys");
             $.post("../../modulo", "opc=lis_pr_mod", function(objJson) {
             mo.empty();
             var lista = objJson.lista;
             var nroe = 1;
             for (var i = 0; i <= lista.length; i++) {
             nroe = nroe + i;
             mo.append("<tr>");
             mo.append("<td>" + nroe + "</td>");
             mo.append("<td>" + lista[i].no_md + "</td>");
             if (lista[i].es_md == '1') {
             mo.append("<td><p>ACTIVADO</p></td>");
             } else {
             mo.append("<td><p>DESACTIVADO</p></td>");
             }
             mo.append("<td><p>" + lista[i].no_pr + "</p></td>");
             if (lista[i].es_pr == '1') {
             mo.append("<td><p>ACTIVADO</p></td>");
             } else {
             mo.append("<td><p>DESACTIVADO</p></td>");
             }
             //mo.append("<td><a><img src='../../imagenes/lapiz.png' alt="" width='25px' height='25px'/></a></td>");
             //mo.append("<td><a><img src='../../imagenes/eliminar.png' alt="" width='25px' height='25px'/></a></td>");
             // mo.append("<td><a><img src='../../imagenes/Aprobado.png' alt="" width='25px' height='25px'/></a></td>");
             mo.append("</tr>");
             
             nroe = 1;
             }
             });
             }*/
            $("#selec_mod").change(
                    function() {
                        var a=$(".tbodys");
                        $.post("",""+""+$("#selec_mod").val(),function(objJson){
                            
                        });
                    });
        });
    </script>
</html>
