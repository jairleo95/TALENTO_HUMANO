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
        <link href="../../css/Css_Lista/listas.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="../../js/JQuery/jQuery.js" type="text/javascript"></script>
        <title>Funciones</title>
         <menu class="doc">        
        </menu>
    </head>   
    <body>
        <h1>Funciones</h1>
        <table class=" tabla table-bordered table-responsive"> 
            <thead>
                <tr>
                    <td class="cajita">N°</td>
                    <td class="cajita">Detalle Funcion</td>
                    <td class="cajita">Estado</td>
                    <td class="cajita">Puesto</td>
                    <td class="cajita" colspan="2">Opcion</td>
                </tr>
            </thead>
            <tbody class="tbodys"></tbody>                    
    </table>
</body>
</html>
<script>
                $(document).ready(function() {
                    var doc = $(".doc");
                    var tb=$('.tbodys');
                    var valor;
                    var idFuncion;
                    var idPuesto;
                    var pu;
                    var es;
                    llenar_tabla();
                    function cargar() {
                        doc.empty();
                        doc.append("<div>");
                        doc.append("<form action='' class='form-group'>");
                        doc.append("<label>Detalle de Funcion</label>");
                        doc.append("<input type='text' class='deFunc' required=''>");
                        doc.append("<label>Estado</label>");
                        doc.append("<select class='estado'></select>");
                        doc.append("<label>Puesto</label>");
                        doc.append("<select class='puesto'></select>");
                        doc.append("<input type='submit' class='enviar btn btn-success' value='Editar'>");
                        doc.append("</form>");
                        doc.append("</div>");
                        pu = $('.puesto');
                        es = $('.estado');
                        es.append("<option>--Seleccione--</option>");
                        es.append("<option>0</option>");
                        es.append("<option>1</option>");
                        llenar_puesto();
                        // -----------------------------------
                        $('.enviar').click(
                                function() {
                                    $.post("../../funcion", "opc=edit_function" + "&id_fun=" + idFuncion + "&de_fun=" + $('.deFunc').val() + "&es_fun=" + es.val() + "&id_pu=" + idPuesto, function() {
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
                        
                        tb.addClass('table-bordered table-responsive');
                        $.post('../../funcion', 'opc=listarF', function(objJson) {
                            var list = objJson.lista;
                            if (list.length > 0) {
                                for (var i = 0; i < list.length; i++) {
                                    tb.append("<tr>");
                                    tb.append("<td class='num"+i+"'>" + (i + 1) + "<input type = 'hidden' name = 'btnIdFun' class = 'btnIdFun"+i+"' value ='"+list[i].id_fu+"' /></td>");
                                    tb.append("<td class='defun"+i+"'>" + list[i].de_fu + "</td>");
                                    tb.append("<td class= 'esfun"+i+"'>" + list[i].es_fu + "</td>");
                                    tb.append("<td class= 'nopu"+i+"'>" + list[i].no_pu + "</td>");
                                    tb.append("<td class = 'btnedit' > <button class = 'edit btn btn-success' value = '"+i+"' > Editar </button></td >");
                                    tb.append("<td class = 'btndel' > <button class = 'del btn btn-danger' value = '"+i+"' > Eliminar </button></td >");
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
                                $('.estado').val($(".esfun" + valor).text());
                                $('.puesto').val($(".nopu" + valor).text());
                            });
                    $('.del').click(function() {
                        valor = $(this).val();
                        idFuncion = $(".btnIdFun" + valor).val();
                            $.post("../../funcion", "opc=del_fun" + "&id_fun=" + idFuncion, function() {
                               llenar_tabla(); 
                            });
                        });  
                    });
                       
                    };
                    

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