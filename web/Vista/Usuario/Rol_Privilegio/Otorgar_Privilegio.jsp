<%@page import="pe.edu.upeu.application.model.Rol"%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_Rol" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Privilegio" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
                <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
    </head>
    <body>
    <center>
        <H1 class="title">OTORGAR PRIVILEGIOS</h1>
        <form class="form" action="../../../Privilegios" method="post"> 
            <table class="table" >  
                <tr><td>Rol :</td>
                <td><select  name="Id_Rol" class="text-box" required="">
                <%for(int i=0;i<List_Rol.size();i++){
                Rol r=new Rol();
                r=(Rol)List_Rol.get(i);
                %>
                <option value=" <%=r.getId_rol()%>" ><%=r.getNo_rol()%></option>
                <%}%>
                </select></td>
                </tr>
                
                <tr><td>Privilegio a Otorgar :</td>
                    <td><select  name="id_Priv" required="">
                <%for(int a=0;a<List_Privilegio.size();a++){
                Privilegio p=new Privilegio();
                p=(Privilegio)List_Privilegio.get(a);
                %>
                <option value="<%=p.getId_privilegio()%>"><%=p.getNo_link()%></option>
                <%}%>
                </select></td>
                </tr>
                
                <tr><td>Nro de orden:</td><td><input type="number" name="Nu_Orden" ></td></tr>
                <tr><td>Estadod de Privilegio otorgado</td><td><select name="Es_detalle_privilegio" required="">
                    <option value="1">Activado</option>
                    <option value="0">Desactivado</option>
                </select></td></tr>
                <tr><td colspan="2"> <input type="submit" value="REGISTRAR PRIVILEGIO DADO" name="opc"></tr>
            </table>
       </form>
   </center>
    <br><br>
    </body>
</html>
<%@include file="List_Pri_Roles.jsp" %>