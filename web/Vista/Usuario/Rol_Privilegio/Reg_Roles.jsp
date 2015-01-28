<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>
    </head>
    <body>
    <center><label class="title">MANTENIMIENTO ROLES</label><form class="form" action="../../../Roles" method="post">
            <table class="table">              
                <tr><td>Nombre:</td><td><input type="text" name="NOMBRE" class="text-box" ></td></tr>                    
                <tr><td>Estado:</td><td><input type="checkbox" name="ESTADO" class="text-box" value="1" id="ch"></td></tr>           
                <tr><td colspan="2"><input type="submit" name="opc"  class="submit" value="REGISTRAR" id="but"></td></tr>
            </table>
        </form>
    </center>
    <br><br>
</body>
</html>
<%@include  file="List_Roles.jsp"%>
<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>