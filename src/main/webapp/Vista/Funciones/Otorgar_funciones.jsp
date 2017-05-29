<%-- 
    Document   : Otorgar_funciones
    Created on : 29-ene-2015, 7:04:56
    Author     : joserodrigo
--%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>

<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
<link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
<link href="../../css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
<style>
    *{
        margin: auto;
        font-size: 13px;
    }
    .caja{
        width: 90%;
        height: 400px;
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
    .cambio{
        border-color :#7DC27D;
        background-color: #F0FFF0;
    }
</style>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>        
    </head>
    <body>
        <div class="caja">
            <form class="contenedor smart-form">
                <section class="direccion">
                    <label>1.Direccion</label>
                    <label class="select">
                        <select class="iddi">
                            <option value="0">[Seleccione]</option>
                            <% for (int i = 0; i < Listar_Direccion.size(); i++) {
                                    Direccion d = new Direccion();
                                    d = (Direccion) Listar_Direccion.get(i);
                            %>
                            <option value="<%=d.getId_direccion()%>"><%=d.getNo_direccion()%></option>
                            <%}%>
                        </select>
                        <i></i> </label>
                </section>

                <section class="departamento">
                    <label>2.Departamento</label>
                    <label class="select">
                        <select class="idde">
                            <option value="0">[Seleccione]</option>

                        </select>
                        <i></i> </label>
                </section>

                <section class="area ">
                    <label>3.Area</label>
                    <label class="select">
                        <select class="idar">
                            <option value="0">[Seleccione]</option>

                        </select>
                        <i></i> </label>
                </section>

                <section class="seccion ">
                    <label>4.Seccion</label>
                    <label class="select">
                        <select class="idse">
                            <option value="0">[Seleccione]</option>
                        </select>
                        <i></i> </label>
                </section>
            </form>
            <form class="contenedor2 smart-form">
                <section class="puestos">
                    <label>5.Puesto</label>
                    <label class="select">
                        <select class="idpu">
                            <option value="0">[Seleccione]</option>                            
                        </select>
                        <i></i> </label>
                </section>

                <section class="funciones">
                    <label>6.Detalle de Funcion</label>
                    <label class="input">
                        <input type="text" class=" ifun input-sm" placeholder="Nombre de la Funcion" style="height:32px;" maxlength="500" >
                    </label>                    
                </section>
                <section class="estadoF">
                    <label>7.Estado de la Funcion</label>
                    <label class="select">
                        <select class="estado" disabled="">
                            <option value="0">[Selelccione]</option>
                            <option value="1">Activada</option>
                            <option value="2">Desactivada</option>
                        </select>
                        <i></i> </label>
                </section>
                <section class="tipo">
                    <label>8.Tipo de Funcion</label>
                    <label class="select">
                        <select class="tifun">
                            <option value="0">[Selelccione]</option>
                            <option value="1">Principal</option>
                            <option value="2">Secundaria</option>
                        </select>
                        <i></i> </label>
                </section>

            </form>
            <div class="opciones">
                <button name="opc"  class="btnotorgar btn btn-primary btn-block" value="1">Otorgar Funcion</button>
                <button name="opc1"  class="btnLimpiar btn btn-default btn-block" value="1">Limpiar</button>
                <div class="alerta alert alert-danger" role="alert"><center><strong class="msg"></strong></center></div>
                <div class="informacion alert alert-success" role="alert"><center><strong class="msgi"></strong></center></div>
            </div>
        </div>

        <div class="tabla table-responsive">
            <table class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <td><center><strong>Nro</strong></center></td>
                <td><center><strong>Detalle Funcion</strong></center></td>
                <td><center><strong>Estado</strong></center></td>
                <td><center><strong>Puesto</strong></center></td>
                <td><center><strong>Tipo</strong></center></td>
                <td colspan="2"><center><strong>Opcion</strong></center></td>
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
        $.post("../../funcion","opc=otorgar_funciones");
        $(document).ready(function() {
            limpiar();
            var idDireccion, idDep, idArea, idSeccion, tipoFuncion, idValue, idFuncion, idPuesto;
            $(".idpu").change(function() {
                listar_tabla();
            });
            $(".iddi").change(function() {
                idDireccion = $(this).val();
                var ti = $('.idde');
                ti.empty();
                var data = "opc=direccion" + "&idDireccion=" + idDireccion;
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../funcion", data, function(objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        ti.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id_de + "'>" + lista[i].nom_de + "</option>";
                        ti.append(item);
                    }
                });
                $('.idde').val(0);
                $('.idar').val(0);
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_dir();
            });
            $(".idde").change(function() {
                idDep = $(this).val();
                var ti = $('.idar');
                ti.empty();
                var data = "opc=departamento" + "&idDepartamento=" + idDep;
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../funcion", data, function(objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        ti.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id_ar + "'>" + lista[i].nom_ar + "</option>";
                        ti.append(item);
                    }
                });
                $('.idar').val(0);
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_dep();
                validar_dir();
            });
            $(".idar").change(function() {
                idArea = $(this).val();
                var ti = $('.idse');
                ti.empty();
                var data = "opc=area" + "&idArea=" + idArea;
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../funcion", data, function(objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        ti.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id_se + "'>" + lista[i].nom_se + "</option>";
                        ti.append(item);
                    }
                });
                $('.idse').val(0);
                $('.idpu').val(0);
                validar_ar();
                validar_dep();
            });
            $(".idse").change(function() {
                idSeccion = $(this).val();
                var ti = $('.idpu');
                ti.empty();
                var data = "opc=seccion" + "&idSeccion=" + idSeccion;
                ti.append('<option value="">Cargando...</option>').val('');
                $.post("../../funcion", data, function(objJson) {
                    ti.empty();
                    if (objJson.rpta == -1) {
                        alert(objJson.mensaje);
                        return;
                    }
                    var lista = objJson.lista;
                    if (lista.length > 0) {
                        ti.append("<option value='0'>[Seleccione]</option>");
                    } else {
                        ti.append("<option value='0'>[]</option>");
                    }
                    for (var i = 0; i < lista.length; i++) {
                        var item = "<option value='" + lista[i].id_pu + "'>" + lista[i].nom_pu + "</option>";
                        ti.append(item);
                    }
                });
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
            $('.estado').change(function() {
            });
            $(".btnotorgar").click(function() {
                if (validar_est() == true && validar_dir() == true && validar_dep() == true && validar_ar() == true && validar_sec() == true && validar_pu() == true && validar_fun() == true && validar_tip() == true) {
                    var id_puesto = $(".idpu").val();
                    if ($(this).val() == 1) {
                        $.post("../../funcion", "opc=otorgar" + "&id_puesto=" + id_puesto + "&de_funcion=" + $(".ifun").val() + "&ti_funcion=" + tipoFuncion, function() {
                            listar_tabla();
                            $('.informacion').fadeOut();
                            $('.informacion').fadeIn();
                            $('.msgi').text("Funcion Otorgada con exito!");
                            $('.informacion').fadeOut(700, function() {
                                var msg = confirm("¿Desea crear una nueva funcion?");
                                if (msg == false) {
                                    limpiar();
                                } else {
                                    $('.ifun').val("");
                                    $('.ifun').focus();
                                }
                            });

                        });
                    } else if ($(this).val() == 2) {
                        $.post("../../funcion", "opc=edit_function" + "&id_fun=" + idFuncion + "&de_fun=" + $('.ifun').val() + "&es_fun=" + $('.estado').val() + "&id_pu=" + id_puesto + "&ti_funcion=" + $('.tifun').val(), function() {
                            $('.iddi').focus();
                            listar_tabla();
                            $('.informacion').fadeOut();
                            $('.informacion').fadeIn();
                            $('.msgi').text("Funcion Editada con Exito !");
                            $('.informacion').fadeOut(700, function(){
                                limpiar();
                            });
                        });
                    }
                } else {
                    $('.alerta').show();
                    $('.msg').text('Falta seleccionar algunos Elementos !');
                }
            });
            ;
            $('.btnLimpiar').click(function() {
                limpiar();
            });
            function limpiar() {
                $('.iddi').focus();
                $('.iddi').val(0);
                //-----------
                $('.idde').empty();
                $('.idde').append("<option value='0'>[Seleccione]</option>");
                $('.idde').val(0);
                //-----------
                $('.idar').empty();
                $('.idar').append("<option value='0'>[Seleccione]</option>");
                $('.idar').val(0);
                //-----------
                $('.idse').empty();
                $('.idse').append("<option value='0'>[Seleccione]</option>");
                $('.idse').val(0);
                //-----------
                $('.idpu').empty();
                $('.idpu').append("<option value='0'>[Seleccione]</option>");
                $('.idpu').val(0);
                //-----------
                $('.tifun').val(0);
                $('.estado').val(1);
                $('.ifun').val("");
                $('.btnotorgar').val('1');
                $('.btnotorgar').text('Otorgar Funcion');
                $('.btnLimpiar').text('Limpiar');
                $('.tbodys').empty();
                $('.estado').prop("disabled", true);
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
                                $('.estado_funcion' + i).css("background-color", "#CECEF6");
                            } else if (list[i].es_fu == 2) {
                                ap.append("<td class='estado_funcion" + i + "' id=" + list[i].es_fu + "><center>Desactivada</center></td>");
                                $('.estado_funcion' + i).css("background-color", "#F3E2A9");
                            }
                            ;
                            ap.append("<td class='nombre_puesto" + i + "'><center>" + list[i].no_pu + "</center></td>");
                            if (list[i].ti_fu == 1) {
                                ap.append("<td class='tipo_funcion" + i + "' id=" + list[i].ti_fu + "><center>Principal</center></td>");
                                $('.tipo_funcion' + i).css("background-color", "#CECEF6");
                            } else if (list[i].ti_fu == 2) {
                                ap.append("<td class='tipo_funcion" + i + "' id=" + list[i].ti_fu + "><center>Secundaria</center></td>");
                                $('.tipo_funcion' + i).css("background-color", "#F3E2A9");
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
                        $('.btnLimpiar').text('Crear nuevo');
                        $('.ifun').focus();
                        $('.estado').prop("disabled", false);
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
