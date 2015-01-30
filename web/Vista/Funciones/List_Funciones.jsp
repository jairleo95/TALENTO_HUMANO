<%-- 
    Document   : List_Funciones
    Created on : 29-ene-2015, 7:04:40
    Author     : joserodrigo
--%>
<%@page import="pe.edu.upeu.application.model.Funciones"%>
<jsp:useBean id="Listar_funciones" scope="application" class="java.util.ArrayList"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="../../css/Css_Lista/listas.css" rel="stylesheet" type="text/css"/>
        <link href="../../css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <title>Funciones</title>
    </head>
    <body>
        <h1>Funciones</h1>
        <table class="table-bordered table-responsive table-mailbox"> 
            <thead>
                <tr>
                    <td class="cajita">Nro</td>
                    <td class="cajita">Detalle Funcion</td>
                    <td class="cajita">Estado</td>
                    <td class="cajita">Puesto</td>
                    <td class="cajita" colspan="2">Opcion</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%for(int i=0;i<Listar_funciones.size();i++){ 
                    Funciones f=new Funciones();
                    f=(Funciones)Listar_funciones.get(i);
                    %>
                    <td class="cajita"><%=i+1%></td>
                    <td class="cajita"><%=f.getDe_funcion()%></td>
                    <td class="cajita"><%=f.getEs_funcion()%></td>
                    <td class="cajita"><%=f.getNo_puesto()%></td>
                    <td class="caji"><a href=""><img src="../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"><a href=""><img src="../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
