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
<link href="../../css/Css_Formulario/form.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <style>
            *{
                margin: auto;
            }
            body {

            }
            .contenedor {
                margin-top:0;/*lo que quieras poner de margin arriba*/
                margin-right:25%;
                margin-bottom:0;
                text-align:right;  
            }
            .text-box{
                width: 60%;
            }
            .btnotorgar{
                padding-top: 10px;
                width: 40%;
            }
            .tabla{
                text-align:center; 
            }
        </style>
    </head>
    <body>
        <div class="contenedor">

            <div class="direccion form-group">
                <label>Direccion</label>
                <select class="iddi text-box chosen-select">
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
                <select class="idde text-box chosen-select">
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
                <select class="idar text-box chosen-select">
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
                <select class="idse text-box chosen-select">
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
                <select class="idpu text-box chosen-select">
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
                <label>Funciones</label>
                <select class="ifun text-box chosen-select">
                    <option value="0">-Seleccione-</option>
                    <%for (int i = 0; i < Listar_funciones.size(); i++) {
                            Funciones f = new Funciones();
                            f = (Funciones) Listar_funciones.get(i);
                    %>
                    <option class="optlist" value="<%=f.getDe_funcion()%>"><%=f.getDe_funcion()%></option>
                    <%}%>
                </select>
            </div>
        </div>
    <center><button name="opc"  class="btnotorgar btn btn-primary btn-block" value="Otorgar Funcion">Otorgar Funcion</button></center>

    <div class="tabla">
        <table class="table">
            <thead>
                <tr>
                    <td>Nro</td>
                    <td>Detalle Funcion</td>
                    <td>Estado</td>
                    <td>Puesto</td>
                </tr>
            </thead>
            <tbody class="tbodys table-hover">
                
            </tbody>
        </table>
    </div>
</body>
<script>
    $(document).ready(function() {
        var idDireccion, idDep, idArea, idSeccion, idPuesto, idFuncion;
        $(".idpu").change(function() {
            listar_tabla();
        });
        $(".iddi").change(function() {
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
        });
        $(".btnotorgar").click(function() {
            var id_puesto = $(".idpu").val();
            $.post("../../funcion", "opc=otorgar" + "&id_puesto=" + id_puesto + "&de_funcion=" + $(".ifun").val(), function() {
                listar_tabla();
            });

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
                        ap.append("<td>" + (i + 1) + "</td>");
                        ap.append("<td>" + list[i].nom_fu + "</td>");
                        ap.append("<td>" + list[i].es_fu + "</td>");
                        ap.append("<td>" + list[i].no_pu + "</td>");
                        ap.append("</tr>");
                    }
                } else {
                    ap.append("<tr><td> Sin ninguna funcion</td></tr>");
                }
            });
        }

    });
</script>
</html>
