<%-- 
    Document   : Otorgar_funciones
    Created on : 29-ene-2015, 7:04:56
    Author     : joserodrigo
--%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="pe.edu.upeu.application.model.Seccion"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<%@page import="pe.edu.upeu.application.model.Departamento"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_funciones" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Direccion" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Area" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LISTA_RH_SECCION" scope="application" class="java.util.ArrayList"/>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: auto;
                font-size: 13px;
            }
            .caja{
                width: 90%;
                height: 450px;
            }
            .contenedor {
                text-align:left;
                float: left;
                padding-left: 10px;
                padding-right: 10px;
                width: 49%;
            }
            .contenedor2{
                text-align:left;
                float: right;
                padding-left: 10px;
                padding-right: 10px;
                width: 49%;
            }
            .btnotorgar{
                float:left;
                margin-top:5px;
                width: 49%;
            }
            .btnLimpiar{
                float: right;
                width: 49%;
            }
            .alert{
                margin-top: 60px;
                clear:both;
            }
            .opciones{
                padding-top:20px;
                clear:both;
                width: 50%;
                height: 130px;
            }
            select{
                width: 100px;;
            }
            .tabla{
                margin-top: 30px;
                width: 90%;
                text-align: center;
            }
            td{
                height: 40px;
            }
            thead{
                background: #cccccc;
            }
            .edit{
                margin: 3px;
                width: 80%;
            }
            .del{
                margin: 3px;
                width: 70%; 
            }
        </style>
    </head>
    <body>
        <div class="caja">
            <div class="contenedor">
                <div class="direccion form-group">
                    <label>1.Direccion</label>
                    <select class="iddi form-control">
                        <option value="0">-Seleccione-</option>
                        <% for (int i = 0; i < Listar_Direccion.size(); i++) {
                                Direccion d = new Direccion();
                                d = (Direccion) Listar_Direccion.get(i);
                        %>
                        <option value="<%=d.getId_direccion()%>"><%=d.getNo_direccion()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="departamento form-group">
                    <label>2.Departamento</label>
                    <select class="idde form-control">
                        <option value="0">-Seleccione-</option>
                        <%
                            for (int i = 0; i < List_Departamento.size(); i++) {
                                Departamento de = new Departamento();
                                de = (Departamento) List_Departamento.get(i);
                        %>
                        <option class="dep<%=i%>" id="<%=de.getId_direccion()%>" value="<%=de.getId_departamento()%>"><%=de.getNo_dep()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="area form-group">
                    <label>3.Area</label>
                    <select class="idar form-control">
                        <option value="0">-Seleccione-</option>
                        <% for (int i = 0; i < List_Area.size(); i++) {
                                Area a = new Area();
                                a = (Area) List_Area.get(i);
                        %>
                        <option class="area<%=i%>" id="<%=a.getId_departamento()%>" value="<%=a.getId_area()%>" ><%=a.getNo_area()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="seccion form-group">
                    <label>4.Seccion</label>
                    <select class="idse form-control">
                        <option value="0">-Seleccione-</option>
                        <% for (int i = 0; i < LISTA_RH_SECCION.size(); i++) {
                                Seccion s = new Seccion();
                                s = (Seccion) LISTA_RH_SECCION.get(i);
                        %>
                        <option class="sec<%=i%>" id="<%=s.getId_area()%>" value="<%=s.getId_seccion()%>"><%=s.getNo_seccion()%></option>
                        <%}%>
                    </select>
                </div>
            </div>
            <div class="contenedor2">
                <div class="puestos form-group">
                    <label>5.Puesto</label>
                    <select class="idpu form-control input-group-sm">
                        <option value="0">-Seleccione-</option>
                        <% for (int i = 0; i < List_Puesto.size(); i++) {
                                Puesto p = new Puesto();
                                p = (Puesto) List_Puesto.get(i);
                        %>
                        <option class="puest<%=i%>"  id="<%=p.getId_seccion()%>" value="<%=p.getId_puesto()%>"><%=p.getNo_puesto()%></option>
                        <%}%>
                    </select>
                </div>

                <div class="funciones form-group">
                    <label>6.Detalle de Funcion</label>
                    <input type="text" class=" ifun form-control" placeholder="Nombre de la Funcion" required="">
                </div>
                <div class="estadoF form-group">
                    <label>7.Estado de la Funcion</label>
                    <select class="estado form-control">
                        <option value="0">-Selelccione-</option>
                        <option value="1">Activada</option>
                        <option value="2">Desactivada</option>
                    </select>
                </div>
                <div class="tipo form-group">
                    <label>8.Tipo de Funcion</label>
                    <select class="tifun  form-control">
                        <option value="0">-Selelccione-</option>
                        <option value="1">Principal</option>
                        <option value="2">Secundaria</option>
                    </select>
                </div>

            </div>
            <div class="opciones">
                <button name="opc"  class="btnotorgar btn btn-primary btn-block" value="1">Otorgar Funcion</button>
                <button name="opc1"  class="btnLimpiar btn btn-default btn-block" value="1">Limpiar</button>
                <div class="alerta alert alert-danger" role="alert"><center><strong class="msg"></strong></center></div>
                <div class="informacion alert alert-success" role="alert"><center><strong class="msgi"></strong></center></div>
            </div>
        </div>

        <div class="tabla">
            <table class="table table-bordered table-responsive">
                <thead>
                    <tr>
                        <td><center>Nro</center></td>
                <td><center>Detalle Funcion</center></td>
                <td><center>Estado</center></td>
                <td><center>Puesto</center></td>
                <td><center>Tipo</center></td>
                <td colspan="2"><center>Opcion</center></td>
                </tr>
                </thead>
                <tbody class="tbodys">
                </tbody>
            </table>
        </div>
    </body>
    <script>
        $('.alerta').hide();
        $('.informacion').hide();
        $(document).ready(function() {
            limpiar();
            var idDireccion, idDep, idArea, idSeccion, tipoFuncion, idValue, idFuncion, idPuesto;
            $(".idpu").change(function() {
                listar_tabla();
            });
            $(".iddi").change(function() {
                $('.idde').val(0);
                idDireccion = $(this).val();
                var a = $(".idde option");
                for (var i = 0; i < a.size(); i++) {
                    var id = $(".dep" + i).attr('id');
                    if (id !== idDireccion) {
                        $(".dep" + i).hide();
                    } else {
                        $(".dep" + i).show();
                    }
                }
                $('.idde').val(0);
                $('.idar').val(0);
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_dir();
            });
            $(".idde").change(function() {
                idDep = $(this).val();
                var a = $(".idar option");
                for (var i = 0; i < a.size(); i++) {
                    var id = $(".area" + i).attr('id');
                    if (id !== idDep) {
                        $(".area" + i).hide();
                    } else {
                        $(".area" + i).show();
                    }
                }
                $('.idar').val(0);
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_dep();
                validar_dir();
            });
            $(".idar").change(function() {
                idArea = $(this).val();
                var a = $(".idse option");
                for (var i = 0; i < a.size(); i++) {
                    var id = $(".sec" + i).attr('id');
                    if (id !== idArea) {
                        $(".sec" + i).hide();
                    } else {
                        $(".sec" + i).show();
                    }
                }
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_ar();
                validar_dep();
            });
            $(".idse").change(function() {
                idSeccion = $(this).val();
                var a = $(".idpu option");
                for (var i = 0; i < a.size(); i++) {
                    var id = $(".puest" + i).attr('id');
                    if (id !== idSeccion) {
                        $(".puest" + i).hide();
                    } else {
                        $(".puest" + i).show();
                    }
                }
                $('.idpu').val(0);
                validar_sec();
                validar_ar();
            });
            $('.idpu').change(function() {
                validar_pu();
                validar_sec();
            });
            $('.ifun').change(function() {
                validar_fun();
                validar_pu();
            });
            $('.tifun').change(function() {
                if ($(this).val() !== 0) {
                    tipoFuncion = $(this).val();
                }
                validar_tip();
                validar_fun();
            });
            $(".btnotorgar").click(function() {
                if (validar_est() == true && validar_dir() == true && validar_dep() == true && validar_ar() == true && validar_sec() == true && validar_pu() == true && validar_fun() == true && validar_tip() == true) {
                    var id_puesto = $(".idpu").val();
                    if ($(this).val() == 1) {
                        $.post("../../funcion", "opc=otorgar" + "&id_puesto=" + id_puesto + "&de_funcion=" + $(".ifun").val() + "&ti_funcion=" + tipoFuncion, function() {
                            $('.iddi').focus();
                            listar_tabla();
                        });
                    } else if ($(this).val() == 2) {
                        $.post("../../funcion", "opc=edit_function" + "&id_fun=" + idFuncion + "&de_fun=" + $('.ifun').val() + "&es_fun=" + $('.estado').val() + "&id_pu=" + id_puesto + "&ti_funcion=" + $('.tifun').val(), function() {
                            $('.iddi').focus();
                            listar_tabla();
                        });
                    }
                    mensajeI();
                } else {
                    $('.alerta').show();
                    $('.msg').text('Falta seleccionar algunos Elementos !');
                }
            });
            function mensajeI() {
                $('.informacion').fadeOut();
                $('.informacion').fadeIn(1000);
                $('.msgi').text("Operacion realizada con Exito !");
                $('.informacion').fadeOut(2000);
            }
            ;
            $('.btnLimpiar').click(function() {
                limpiar();
            });
            function limpiar() {
                $('.iddi').focus();
                $('.iddi').val(0);
                $('.idde').val(0);
                $('.idar').val(0);
                $('.idse').val(0);
                $('.idpu').val(0);
                $('.tifun').val(0);
                $('.estado').val(1);
                $('.ifun').val("");
                $('.btnotorgar').val('1');
                $('.btnotorgar').text('Otorgar Funcion');
                $('.tbodys').empty();
            }
            //LISTAR TABLA
            function listar_tabla() {
                var id_puesto = $(".idpu").val();
                var ap = $(".tbodys");
                $.post("../../funcion", "opc=listar_x_puesto" + "&id_puesto=" + id_puesto, function(objJson) {
                    ap.empty();
                    var list = objJson.lista;
                    if (list.length > 0) {
                        for (var i = 0; i < list.length; i++) {
                            ap.append("<tr>");
                            ap.append("<td><center>" + (i + 1) + "</center><input type = 'hidden' name = 'btnIdFun' class = 'btnIdFun" + i + "' value ='" + list[i].id_fu + "'</td>");
                            ap.append("<td class='nombre_funcion" + i + "'><center>" + list[i].nom_fu + "</center></td>");
                            if (list[i].es_fu == 1) {
                                ap.append("<td class='estado_funcion" + i + "' id=" + list[i].es_fu + "><center>Activada</center></td>");
                            } else if (list[i].es_fu == 2) {
                                ap.append("<td class='estado_funcion" + i + "' id=" + list[i].es_fu + "><center>Desactivada</center></td>");
                            }
                            ;
                            ap.append("<td class='nombre_puesto" + i + "'><center>" + list[i].no_pu + "</center></td>");
                            if (list[i].ti_fu == 1) {
                                ap.append("<td class='tipo_funcion" + i + "' id=" + list[i].ti_fu + "><center>Principal</center></td>");
                            } else if (list[i].ti_fu == 2) {
                                ap.append("<td class='tipo_funcion" + i + "' id=" + list[i].ti_fu + "><center>Secundaria</center></td>");
                            }
                            ;
                            ap.append("<td class = 'btnedit' ><center> <button class = 'edit btn btn-primary' value = '" + i + "' > Editar </button></center></td >");
                            ap.append("<td class = 'btndel' ><center> <button class = 'del btn btn-danger' value = '" + i + "' > Eliminar </button></center></td >");
                            ap.append("</tr>");
                        }
                    }
                    $('.edit').click(function() {
                        idValue = $(this).val();
                        idFuncion = $('.btnIdFun' + idValue).val();
                        idPuesto = $('.ifun').val($('.nombre_funcion' + idValue).text());
                        $('.estado').val($('.estado_funcion' + idValue).attr('id'));
                        $('.tifun').val($('.tipo_funcion' + idValue).attr('id'));
                        $('.btnotorgar').val('2');
                        $('.btnotorgar').text('Editar Funcion');
                        $('.ifun').focus();
                    });
                    $('.del').click(function() {
                        idValue = $(this).val();
                        idFuncion = $('.btnIdFun' + idValue).val();
                        $.post("../../funcion", "opc=del_fun" + "&id_fun=" + idFuncion, function() {
                            listar_tabla();
                        });
                    });
                });
            }

            // VALIDAR SELECTORES
            function validar_dir() {
                if ($('.iddi').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Direccion !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_dep() {
                if ($('.idde').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Departamento !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_ar() {
                if ($('.idar').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Area !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_sec() {
                if ($('.idse').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Seccion !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_pu() {
                if ($('.idpu').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Puesto !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_tip() {
                if ($('.tifun').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Tipo !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_fun() {
                if ($('.ifun').val() == "") {
                    $('.alerta').show();
                    $('.msg').text('Escribir Funcion !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
            function validar_est() {
                if ($('.estado').val() == 0) {
                    $('.alerta').show();
                    $('.msg').text('Seleccionar Estado !');
                    return false;
                } else {
                    $('.alerta').hide();
                    return true;
                }
            }
        });
    </script>
</html>
