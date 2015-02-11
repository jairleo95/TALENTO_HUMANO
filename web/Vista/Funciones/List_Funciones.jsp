<%-- 
    Document   : List_Funciones
    Created on : 29-ene-2015, 7:04:40
    Author     : joserodrigo
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<jsp:useBean id="Listar_funciones" scope="application" class="java.util.ArrayList"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <%--<link href="../../css/Css_Lista/listas.css" rel="stylesheet" type="text/css"/>--%>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
        <title>Funciones</title>
        <style>
            thead{
                background: #cccccc;
            }
            .form-control{
                margin-right:30%;
                margin-left: 30%;
                width: 35%;
            }
            label{
                margin-right:30%;
                margin-left: 30%;
            }
            .enviar{
                margin-right:30%;
                margin-left: 30%;
                margin-top: 10px;
                width: 35%;
            }
            .tabla{
                width: 90%;
                margin-left: 5%;
            }
            h1{
                padding-left: 5%;
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
    <menu class="doc">        
    </menu>
</head>   
<body>
    <h1>Funciones</h1>
    <table class=" tabla table table-bordered"> 
        <thead>
            <tr>
                <td>N°</td>
                <td>Detalle Funcion</td>
                <td>Estado</td>
                <td>Puesto</td>
                <td>Tipo</td>
                <td colspan="2"><center>Opcion</center></td>
</tr>
</thead>
<tbody class="tbodys"></tbody>                    
</table>
</body>
</html>
<script>
    $(document).ready(function() {
        var doc = $(".doc");
        var tb = $('.tbodys');
        var valor;
        var idFuncion;
        var idPuesto;
        var pu;
        var es;
        var ti;
        llenar_tabla();
        function cargar() {
            doc.empty();
            doc.append("<div class='contenedor'>");
            doc.append("<label>Detalle de Funcion</label>");
            doc.append("<input type='text' class='deFunc form-control' required=''>");
            doc.append("<label>Estado</label>");
            doc.append("<select class='estado form-control'></select>");
            doc.append("<label>Puesto</label>");
            doc.append("<select class='puesto form-control'></select>");
            doc.append("<label>Tipo</label>");
            doc.append("<select class='tipo form-control'></select>");
            doc.append("<input type='submit' class='enviar btn btn-primary' value='Editar'>");
            doc.append("</div>");
            pu = $('.puesto');
            es = $('.estado');
            ti = $('.tipo');
            es.append("<option value='-1'>--Seleccione--</option>");
            es.append("<option value='1'>Activa</option>");
            es.append("<option value ='0'>Desactiva</option>");
            ti.append("<option value='0'>--Seleccione--</option>");
            ti.append("<option value='1'>Principal</option>");
            ti.append("<option value ='2'>Secundaria</option>");
            llenar_puesto();
            // -----------------------------------
            $('.enviar').click(
                    function() {
                        //alert("Funcion : "+idFuncion+ " detalle: "+$('.deFunc').val() + " estado: "+es.val()+ " Puesto: " +idPuesto+ " tipo: "+ ti.val());
                        $.post("../../funcion", "opc=edit_function" + "&id_fun=" + idFuncion + "&de_fun=" + $('.deFunc').val() + "&es_fun=" + es.val() + "&id_pu=" + idPuesto + "&ti_funcion=" + ti.val(), function() {
                            llenar_tabla();
                            doc.empty();
                        });
                    });
            $('.puesto').change(function() {
                idPuesto = $(this).val();
            });

        }
        ;

        function llenar_tabla() {
            tb.empty();
            $.post('../../funcion', 'opc=listarF', function(objJson) {
                var list = objJson.lista;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        tb.append("<tr>");
                        tb.append("<td class='num" + i + "'>" + (i + 1) + "<input type = 'hidden' name = 'btnIdFun' class = 'btnIdFun" + i + "' value ='" + list[i].id_fu + "' /></td>");
                        tb.append("<td class= 'defun" + i + "'>" + list[i].de_fu + "</td>");
                        var est = list[i].es_fu;
                        var tip = list[i].ti_fu;
                        if (est == 0) {
                            tb.append("<td class='esfun" + i + " id=" + list[i].es_fu + "'>Desactiva</td>");
                        } else if (est == 1) {
                            tb.append("<td class='esfun" + i + " id=" + list[i].es_fu + "'>Activa</td>");
                        }
                        ;
                        tb.append("<td class= 'nopu" + i + "'>" + list[i].no_pu + "</td>");
                        if (tip == 1) {
                            tb.append("<td class= 'tifu" + i + " id=" + list[i].ti_fu + "'>Principal</td>");
                        } else if (tip == 2) {
                            tb.append("<td class= 'tifu" + i + " id=" + list[i].ti_fu + "'>Secundaria</td>");
                        }
                        ;
                        tb.append("<td class = 'btnedit' ><center> <button class = 'edit btn btn-primary' value = '" + i + "' > Editar </button></center></td >");
                        tb.append("<td class = 'btndel' ><center> <button class = 'del btn btn-danger' value = '" + i + "' > Eliminar </button></center></td >");
                        tb.append("</tr>");
                    }
                } else {
                    tb.append("<tr><td> Sin ninguna funcion</td></tr>");
                }
                $('.edit').click(
                        function() {
                            cargar();
                            valor = $(this).val();
                            idFuncion = $(".btnIdFun" + valor).val();
                            $('.deFunc').val($(".defun" + valor).text());
                            $('.estado').val(-1);
                            $('.puesto').val($(".nopu" + valor).text());
                            $('.tipo').val(0);
                        });
                $('.del').click(function() {
                    valor = $(this).val();
                    idFuncion = $(".btnIdFun" + valor).val();
                    $.post("../../funcion", "opc=del_fun" + "&id_fun=" + idFuncion, function() {
                        llenar_tabla();
                    });
                });
            });

        }
        ;


        function llenar_puesto() {
            $.post("../../funcion", "opc=list_pu", function(objJson) {
                pu.empty();
                pu.append("<option value='0'>--Seleccione--</option>");
                var list = objJson.lista;
                if (list.length > 0) {
                    for (var i = 0; i < list.length; i++) {
                        pu.append("<option value='" + list[i].id + "'>" + list[i].nombre + "</option>");
                    }
                }
            });
        }
        ;
    });
</script>