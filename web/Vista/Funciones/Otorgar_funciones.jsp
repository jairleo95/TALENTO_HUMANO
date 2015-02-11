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
            .contenedor {
                margin-right:20%;
                margin-left: 20%;
                margin-bottom:10px;
                text-align:left;
                padding-left: 10px;
                padding-right: 10px;
                padding-bottom: 10px;
            }
            .btnotorgar{
                padding-top: 10px;
                width: 40%;
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
        </style>
    </head>
    <body>
        <div class="contenedor">
            <div class="direccion form-group">
                <label>Direccion</label>
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
                <label>Departamento</label>
                <select class="idde text-box chosen-select form-control">
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
                <label>Area</label>
                <select class="idar text-box chosen-select form-control">
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
                <label>Seccion</label>
                <select class="idse text-box chosen-select form-control">
                    <option value="0">-Seleccione-</option>
                    <% for (int i = 0; i < LISTA_RH_SECCION.size(); i++) {
                            Seccion s = new Seccion();
                            s = (Seccion) LISTA_RH_SECCION.get(i);
                    %>
                    <option class="sec<%=i%>" id="<%=s.getId_area()%>" value="<%=s.getId_seccion()%>"><%=s.getNo_seccion()%></option>
                    <%}%>
                </select>
            </div>

            <div class="puestos form-group">
                <label>Puestos</label>
                <select class="idpu text-box chosen-select form-control">
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
                <label>Detalle de Funcion</label>
                <%--<select class="ifun text-box chosen-select form-control">
                    <option value="0">-Seleccione-</option>
                    <%for (int i = 0; i < Listar_funciones.size(); i++) {
                            Funciones f = new Funciones();
                            f = (Funciones) Listar_funciones.get(i);
                    %>
                    <option class="optlist" value="<%=f.getDe_funcion()%>"><%=f.getDe_funcion()%></option>
                    <%}%>
                </select>--%>
                <input type="text" class=" ifun form-control" placeholder="Nombre de la Funcion" required="">
            </div>
            <div class="estado form-group">
                <label>Estado</label>
                <select class="estado text-box chosen-select form-control">
                    <option value="0">-Selelccione-</option>
                    <option value="1">Activada</option>
                    <option value="2">Desactivada</option>
                </select>
            </div>
            <div class="tipo form-group">
                <label>Tipo</label>
                <select class="tifun text-box chosen-select form-control">
                    <option value="0">-Selelccione-</option>
                    <option value="1">Principal</option>
                    <option value="2">Secundaria</option>
                </select>
            </div>
            <div class="alerta alert alert-danger" role="alert"><strong class="msg"></strong></div>     
        </div>

    <center><button name="opc"  class="btnotorgar btn btn-primary btn-block" value="Otorgar Funcion">Otorgar Funcion</button></center>
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
    $(document).ready(function() {
        var idDireccion, idDep, idArea, idSeccion, tipoFuncion;
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
            if (validar_dir() == true && validar_dep() == true && validar_ar() == true && validar_sec() == true && validar_pu() == true && validar_fun() == true && validar_tip() == true) {
                var id_puesto = $(".idpu").val();
                $.post("../../funcion", "opc=otorgar" + "&id_puesto=" + id_puesto + "&de_funcion=" + $(".ifun").val() + "&ti_funcion=" + tipoFuncion, function() {
                    listar_tabla();
                    $('.iddi').val(0);
                    $('.idde').val(0);
                    $('.idar').val(0);
                    $('.idse').val(0);
                    $('.idpu').val(0);
                    $('.tifun').val(0);
                    $('.ifun').val("");
                });
            } else {
                $('.alerta').show();
                $('.msg').text('Falta seleccionar algunos Elementos !')
            }
        });
        function listar_tabla() {
            var id_puesto = $(".idpu").val();
            var ap = $(".tbodys");
            $.post("../../funcion", "opc=listar_x_puesto" + "&id_puesto=" + id_puesto, function(objJson) {
                ap.empty();
                var list = objJson.lista;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        ap.append("<tr>");
                        ap.append("<td><center>" + (i + 1) + "</center></td>");
                        ap.append("<td><center>" + list[i].nom_fu + "</center></td>");
                        if (list[i].es_fu == 1) {
                            ap.append("<td><center>Activada</center></td>");
                        } else if (list[i].es_fu == 0) {
                            ap.append("<td><center>Desactivada</center></td>");
                        }
                        ;
                        ap.append("<td><center>" + list[i].no_pu + "</center></td>");
                        if (list[i].ti_fu == 1) {
                            ap.append("<td><center>Principal</center></td>");
                        } else if (list[i].ti_fu == 2) {
                            ap.append("<td><center>Secundaria</center></td>");
                        }
                        ;
                        ap.append("<td class = 'btnedit' ><center> <button class = 'edit btn btn-primary' value = '" + i + "' > Editar </button></center></td >");
                        ap.append("<td class = 'btndel' ><center> <button class = 'del btn btn-danger' value = '" + i + "' > Eliminar </button></center></td >");
                        ap.append("</tr>");
                    }
                } else {
                    $('.body').append("<p class='bg-info'>Sin ninguna funcion</p>");
                }
            });
        }
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
