<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : List_Roles
    Created on : 31-oct-2014, 12:36:30
    Author     : joserodrigo
--%>

<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Rol" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>     

    </head>
    <body>
        <div class="row">
            <div class="well">
                <table class="table table-bordered table-striped table-responsive table_t">
            <thead>
                <tr>
                    <td >Nro</td>
                    <td >Rol</td>
                    <td >Estado</td>
                    <td colspan="3" width="15%">Opciones</td>
                <tr>
            </thead>
            <tbody>
                
                <%for (int i = 0; i < List_Rol.size(); i++) {
                        Rol r = new Rol();
                        r = (Rol) List_Rol.get(i);
                %>    
                <tr><td><%=i + 1%></td>
                    <td><%=r.getNo_rol()%></td>
                    <%if (r.getEs_rol().trim().equals("1")) {%>
                    <td>Activado</td>
                    <%} else if (r.getEs_rol().trim().equals("0")) {%>
                    <td>Desactivado</td>
                    <%}%>
                    <td class="caji"> <a href="../../../Roles?idrol=<%=r.getId_rol()%>&opc=Modificar_Rol" ><img src="../../../img/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"><a href="../../../Roles?idrol=<%=r.getId_rol()%>&opc=Desactivar_Rol" ><img src="../../../img/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                    <td class="caji"><a href="../../../Roles?idrol=<%=r.getId_rol()%>&opc=Activar_Rol" ><img src="../../../img/Aprobado.png" alt=""   width="25px" height="25px"/></a></td> 

                </tr>
                <%}%>
            </tbody>
        </table>
            </div>
        </div>
        
    </body>

</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>