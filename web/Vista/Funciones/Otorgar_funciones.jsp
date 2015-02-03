<%-- 
    Document   : Otorgar_funciones
    Created on : 29-ene-2015, 7:04:56
    Author     : joserodrigo
--%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Puesto" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_funciones" scope="application" class="java.util.ArrayList"/>
<link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<link href="../../css/Css_Formulario/form.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="contenido">
            <label>Puestos</label><br>
            <select class="idpu text-box chosen-select">
                <% for (int i = 0; i < List_Puesto.size(); i++) {
                        Puesto p = new Puesto();
                        p = (Puesto) List_Puesto.get(i);
                %>
                <option value="<%=p.getId_puesto()%>"><%=p.getNo_puesto()%></option>
                <%}%>
            </select><br>
            <label>Funciones</label><br>
            <select class="ifun text-box chosen-select">
                <%for (int i = 0; i < Listar_funciones.size(); i++) {
                        Funciones f = new Funciones();
                        f = (Funciones) Listar_funciones.get(i);
                %>
                <option class="optlist" value="<%=f.getDe_funcion()%>"><%=f.getDe_funcion()%></option>
                <%}%>
            </select><br>
            <button name="opc"  class="btnotorgar submit" value="Otorgar Funcion">Otorgar Funcion</button> 
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th class="cajita">Nro</th>
                        <th class="cajita"><span title="nom_fu">Detalle Funcion</span></th>
                        <th class="cajita" > <span title="es_fu">Estado</span></th>
                        <th class="cajita"> <span title="es_fu">Puesto</span></th>
                    </tr>
                </thead>
                <tbody class="tbodys">

                </tbody>
            </table>
        </div>
    </body>
    <script>
        $(document).ready(function() {
            //alert();
            $(".idpu").change(function() {
                //alert();
                listar_tabla();
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
