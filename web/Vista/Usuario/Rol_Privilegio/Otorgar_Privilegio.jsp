<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Privilegio" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Rol" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >
        <title></title>
    </head>
    <body>
    <center>
        <label class="title">OTORGAR PRIVILEGIOS</label>
        <form class="form" action="../../../Privilegio" method="post"> 
            <table class="table-bordered table-responsive" >    

                <tr><td>Nro_orden:</td><td><input type="text" name="NRO_ORDEN" class="text-box" required=""></td></tr>                                 
                <tr><td>Rol</td><td>
                        <select name="id_rol" required="">
                            <option value="">==>Elegir</option>
                            <% for (int i = 0; i < List_Rol.size(); i++) {
                                    Rol r = new Rol();
                                    r = (Rol) List_Rol.get(i);
                            %>
                            <option value="<%=r.getId_rol()%>"><%=r.getNo_rol()%></option>
                            <%}%>
                        </select></td></tr>
                <tr><td>Privilegio</td><td><select name="id_privilegio" required="">
                            <option value="">==>Elegir</option>
                            <% for (int i = 0; i < List_Privilegio.size(); i++) {
                                    Privilegio p = new Privilegio();
                                    p = (Privilegio) List_Privilegio.get(i);
                            %>
                            <option value="<%=p.getId_privilegio()%>"><%=p.getNo_link()%></option>
                            <%}%>
                        </select></td></tr>   
                <tr><td>Estado</td><td>
                        <select name="ESTADO" required="">
                            <option value="">[seleccinar]</option>>
                            <option value="0"> Desactivado </option>
                            <option value="1"> Activado </option>
                        </select>
                    </td></tr>
                <tr><td colspan="2"><input type="submit" class="submit" name="opc" value="REGISTRAR PRIVILEGIO DADO"></td></tr>
            </table>
        </form>
    </center>
    <br><br>

</body>
</html>
<%@include file="List_Pri_Roles.jsp" %>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>