<%-- 
    Document   : List_Roles
    Created on : 31-oct-2014, 12:36:30
    Author     : joserodrigo
--%>

<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />

    </head>
    <body>
        <table>
            <tr><td class="cajita">Nro</td>
                <td class="cajita">Rol</td>
                <td class="cajita" colspan="2">opcion</td><tr>
            <%for(int i=0;i<List_Rol.size();i++){
              Rol r = new Rol();
              r = (Rol) List_Rol.get(i);
              if(r.getEs_rol().trim().equals("1")){
            %>    
            <tr><td class=""><%=i%></td>
                <td class=""><%=r.getNo_rol()%></td>
                <td class="caji"> <a href="../../../Privilegios?idrol=<%=r.getId_rol()%>&opc=modificar" ><img src="../../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"><a href="../../../Privilegios?idrol=<%=r.getId_rol()%>&opc=Eliminar" >
                            <img src="../../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
            <tr>
            <%}}%>
        </table>
    </body>
</html>
