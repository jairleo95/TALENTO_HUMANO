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
        <style>
            *{
                height:auto;
            }

        </style>
    </head>
    <menu class="doc">        
    </menu>
    <body>
        <h1>Funciones</h1>
        <table class="table-bordered table-responsive table-mailbox"> 
            <thead>
                <tr>
                    <td class="cajita">N°</td>
                    <td class="cajita">Detalle Funcion</td>
                    <td class="cajita">Estado</td>
                    <td class="cajita">Puesto</td>
                    <td class="cajita" colspan="2">Opcion</td>
                </tr>
            </thead>
            <tbody class="tbodys">
                <%      for (int i = 0; i < Listar_funciones.size(); i++) {
                        Funciones f = new Funciones();
                        f = (Funciones) Listar_funciones.get(i);

                %>
                <tr>
                    <td class="num<%=i%>"><%=(i + 1)%></td>
                    <td class="defun<%=i%>"><%=f.getDe_funcion()%></td>
                    <td class="esfun<%=i%>"><%=f.getEs_funcion()%></td>
                    <td class="nopu<%=i%>"><%=f.getNo_puesto()%></td>
                    <td class="btnedit"><button class="edit btn btn-success" value="<%=i%>">Editar</button></td>
                    <td class="btndel"><button class="del btn btn-danger" value="<%=i%>" >Eliminar</button></td>
            <input type="hidden" name="btnIdFun" class="btnIdFun<%=i%>" value="<%=f.getId_fucion()%>" />
        </tr>
        <%}%>
    </tbody>
</table>
</body>
<script>

    $(document).ready(function() {

        var doc = $(".doc");
        var valor;
        var idFuncion;
        var idPuesto;
        var pu;
        var es;
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
                            //alert(idFuncion+"/detalle "+$('.deFunc').val()+"/estado"+es.val()+"/puesto"+idPuesto);
                            doc.empty();
                        });
                    });
            $('.puesto').change(function(){
                idPuesto=$(this).val();
            });
            function llenar_puesto() {
                $.post("../../funcion", "opc=list_pu", function(objJson) {
                    pu.empty();
                    pu.append("<option value='0'>--Seleccione--</option>");
                    var list = objJson.lista;
                    if (list.length > 0) {
                        for (var i = 0; i < list.length; i++) {
                            pu.append("<option value=" + list[i].id + ">" + list[i].nombre + "</option>");
                        }
                    }
                });
            }
            ;
        }
        ;

        $('.edit').click(
                function() {
                    cargar();
                    valor = $(this).val();
                    idFuncion = $(".btnIdFun" + valor).val();
                    $('.deFunc').val($(".defun" + valor).text());
                    $('.estado').val($(".esfun" + valor).text());
                    $('.puesto').val($(".nopu" + valor).text());
                });
    });

</script>
</html>
