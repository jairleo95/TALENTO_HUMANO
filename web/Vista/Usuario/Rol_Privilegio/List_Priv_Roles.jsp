<%-- 
    Document   : List_Priv_Roles
    Created on : 14-nov-2014, 13:25:53
    Author     : joserodrigo
--%>

<%@page import="pe.edu.upeu.application.model.V_Privilegio_Rol"%>
<jsp:useBean id="List_Pr_Rol" scope="application" class="java.util.ArrayList"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table>
            <tr><td>Nro</td><td>Rol</td><td>Privilegio</td><td>Estado</td><td colspan="4">Opciones</td></tr>
            <%for(int u=0;u<List_Pr_Rol.size();u++){
                V_Privilegio_Rol d=new V_Privilegio_Rol();
                d=(V_Privilegio_Rol)List_Pr_Rol.get(u);%>
                <tr><td><%=u++%></td>
                    <td><%=d.getNo_rol()%></td>
                    <td><%=d.getNo_link()%></td>
                    <td><%=d.getEs_detalle_privilegio()%></td>
                    <td><a href="../../../Privilegios?id_dtpr=<%=d.getId_detalle_privilegio()%>&opc=Modificar_De"><img src="../../../imagenes/lapiz.png.png"></a></td>
                    <td><a href="../../../Privilegios?id_dtpr=<%=d.getId_detalle_privilegio()%>&opc=Desactivar_Detalle"><img src="../../../imagenes/eliminar.png"></a></td>
                    <td><a href="../../../Privilegios?id_dtpr=<%=d.getId_detalle_privilegio()%>&opc=Activar_Detalle"><img src="../../../imagenes/Aprobado.png"></a></td>
                    <td><a href="../../../Privilegios?id_dtpr=<%=d.getId_detalle_privilegio()%>&opc=Eliminar_Detalle"><img src="../../../imagenes/Desaprobado.png"></a></td>
                </tr>
        </table>
    </body>
</html>
