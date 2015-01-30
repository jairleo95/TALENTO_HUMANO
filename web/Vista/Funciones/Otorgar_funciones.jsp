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
            <form class="form">
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
                <select class="text-box chosen-select">
                    <%for (int i = 0; i < Listar_funciones.size(); i++) {
                            Funciones f = new Funciones();
                            f = (Funciones) Listar_funciones.get(i);
                    %>
                    <option class="optlist" value="<%=f.getId_fucion()%>"><%=f.getDe_funcion()%></option>
                    <%}%>
                </select><br>
                <input type="submit" name="opc"  class="submit" value="Otorgar Funcion">
            </form>
        </div>
        <div>
            <table>
                <thead>
                    <tr>
                        <th class="cajita">Nro</td>
                        <th class="cajita"><span title="nom_fu">Detalle Funcion</span></td>
                        <th class="cajita" > <span title="es_fu">Estado</span>></td>
                        <th class="cajita"> <span title="es_fu">Puesto</span>></td>
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
                var id_puesto = $(".idpu").val();
                var ap = $(".tbodys");
                $.post("../../funcion", "opc=listar_x_puesto" + "&id_puesto=" + id_puesto, function(objJson) {
                    ap.empty();
                    var list = objJson.lista;
                    if (list.length > 0) {
                        for (var i = 0; i < list.length; i++) {
                            ap.append("<tr>");
                            ap.append("<td>" + (i + 1) + "</td>");
                            ap.append("<td>" + list[i].id_fu + "</td>");
                            ap.append("<td>" + list[i].nom_fu + "</td>");
                            ap.append("<td>" + list[i].es_fu + "</td>");
                            ap.append("<td>" + list[i].no_pu + "</td>");
                            ap.append("</tr>");
                        }
                    } else {
                        ap.append("<tr><td> Sin nunguna funcion</td></tr>")
                    }
                });
            });
        });
    </script>
</html>
