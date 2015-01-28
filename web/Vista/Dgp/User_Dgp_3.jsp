<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
<%@page import="pe.edu.upeu.application.model.X_User_dgp"%>
<jsp:useBean class="java.util.ArrayList" id="USER_DGP" scope="application"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Usuarios - DGP</title>
        <link rel="stylesheet" href="../../css/Css_Lista/listas.css" type="text/css">
  
    </head>
    <body>

    <center>
        <%

            /*require_once '../Modelo/ModeloAutorizacion.php';
             $mda=  new ModeloAutorizacion();
             $v=$mda->VAL_AUT_DGP_M($iddgp);
             //echo $v;
             if ($v>0) { */
            if (false) {
        %>
        <h1>El  DGP ha sido rechazado... corrija y dirijase a "Seguimiento de DGP y Habilite"</h1> 
        <%} else {%>
        <h1>Usuarios que intervienen en la autorizacion del  DGP</h1>
        <table>
            <tr>
            <thead>
            <th class="cajita" style="width: 50px;">Nro. Paso</th>
            <th class="cajita" style="width: 100px;">Usuarios</th>
            <th class="cajita" style="width: 300px;"> Nombres y Apellidos</th>
            <th class="cajita" style="width: 200px;"> Puesto</th>
            <th class="cajita" style="width: 200px;">Departamento</th>
            <th class="cajita" style="width: 300px;">Descripcion</th>
            </tr>
            </thead>
            <tbody>
                <%for (int i = 0; i < USER_DGP.size(); i++) {
                        X_User_dgp u = new X_User_dgp();
                        u = (X_User_dgp) USER_DGP.get(i);
                %>
                <tr>
                    <td class="caji"><%=u.getNu_pasos()%></td>
                    <td class="caji"><%=u.getNo_usuario()%></td>
                    <td class="caji"><%=u.getAp_paterno() + " " + u.getAp_materno() + " " + u.getNo_trabajador()%></td>
                    <td class="caji"><%=u.getNo_puesto()%></td>
                    <td class="caji"><%=u.getNo_dep()%></td>
                    <td class="caji"><%=u.getDe_pasos()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <%}%>

    </center>
</body>
</html>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>