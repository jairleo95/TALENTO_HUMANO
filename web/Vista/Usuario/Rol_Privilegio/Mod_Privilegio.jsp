<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_Pri_Id" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >
    </head>
    <body>

        <title class="title">Modificar Rol</title>>
        <form action="../../../Privilegio"> 
            <center>
            <table class=""class="table" >  
                <%for(int i=0 ;i<List_Pri_Id.size();i++){
                Privilegio r=new Privilegio();
                r=(Privilegio)List_Pri_Id.get(i);
                %>
                <tr><td>Nombre de Privilegio:</td><td ><input type="text" name="No_Link" class="" value="<%=r.getNo_link()%>"></td></tr>
                <tr><td>Nombre de Privilegio:</td><td ><input type="text" name="Di_url" class="" value="<%=r.getDi_url()%>"></td></tr>
                <tr><td>Nombre de Privilegio:</td><td ><input type="text" name="Ic_link" class="" value="<%=r.getIc_link()%>"></td></tr>
                <tr><td>Estado Privilegio</td><td>
                        <select name="Es_Privilegio"  required="">
                            <%if(r.getEs_privilegio().equals("1")){%>
                            <option  value="1" selected="">Activado</option>
                            <option value="0">Desactivado</option>
                            <%}else if(r.getEs_privilegio().trim().equals("0")){%>
                            <option value="1">Activado</option>
                            <option value="0" selected="">Desactivado</option>
                            <%}%>
                        </select>
                    </td></tr>              
               <input type="hidden" name="opc" value="modificar_Priv2" class="text-box">                           
               <input type="hidden" name="Id_priv" value="<%=r.getId_privilegio()%>" class="text-box">                           
               <tr><td colspan="2"><input type="submit" value="Modificar"></td></tr>
            </table>
                        <%}%>
           </center>
        </form>
    </body>
</html>
<%@include file="List_Privilegios.jsp" %>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
