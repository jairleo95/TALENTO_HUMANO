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
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Funciones</h1>
        <table> 
            <thead>
                <tr>
                    <td>Nro</td>
                    <td>Detalle Funcion</td>
                    <td>Estado</td>
                    <td>Puesto</td>
                    <td colspan="2">Opcion</td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <%for(int i=0;i<Listar_funciones.size();i++){ 
                    Funciones f=new Funciones();
                    f=(Funciones)Listar_funciones.get(i);
                    %>
                    <td><%=i+1%></td>
                    <td><%=f.getDe_funcion()%></td>
                    <td><%=f.getEs_funcion()%></td>
                    <td><%=f.getNo_puesto()%></td>
                    <td><a href=""> Modificar</a></td>
                    <td><a href=""> Eliminar</a></td>
                </tr>
                <%}%>
            </tbody>
        </table>
    </body>
</html>
