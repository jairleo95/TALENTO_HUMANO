<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : List_Pri_Roles
    Created on : 17-nov-2014, 20:27:48
    Author     : joserodrigo
--%>
<%@page import="pe.edu.upeu.application.model.V_Privilegio_Rol"%>
<jsp:useBean id="List_Pr_Rol" scope="session" class="java.util.ArrayList"/>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >
    </head>
    <body>
        <table class="table-bordered table-responsive ">
            <tr>
                <td> Rol</td>
                <td> Privilegio</td>
                <td> Estado</td>
                <td colspan="4"> Opciones</td>
            </tr>
            <%for(int i =0;i< List_Pr_Rol.size();i++){
                    V_Privilegio_Rol v=new V_Privilegio_Rol();
                    v=(V_Privilegio_Rol)List_Pr_Rol.get(i);
                %>
            <tr>
                <td> <%= v.getNo_rol()%></td>
                <td> <%= v.getNo_link()%></td>
                <td> <%=v.getEs_detalle_privilegio()%></td>
                <td class="caji"> <a href="../../../Privilegio?id_det_pr=<%=v.getId_detalle_privilegio()%>&opc=Mod_det_pr" ><img src="../../../img/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                 <td class="caji"><a href="../../../Privilegio?id_det_pr=<%=v.getId_detalle_privilegio()%>&opc=Desactivar_det_pr" ><img src="../../../img/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                 <td class="caji"><a href="../../../Privilegio?id_det_pr=<%=v.getId_detalle_privilegio()%>&opc=Activar_det_pr" ><img src="../../../img/Aprobado.png" alt=""   width="25px" height="25px"/></a></td> 
                 <td class="caji"><a href="../../../Privilegio?id_det_pr=<%=v.getId_detalle_privilegio()%>&opc=Elim_det_pr" ><img src="../../../img/Desaprobado.png" alt=""   width="25px" height="25px"/></a></td> 
                <%}%>
            </tr>
        </table>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>