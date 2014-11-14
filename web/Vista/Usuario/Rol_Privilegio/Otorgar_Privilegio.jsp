<%@page import="pe.edu.upeu.application.model.Privilegio_Rol"%>
<%@page import="pe.edu.upeu.application.model.V_Rol"%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<jsp:useBean id="List_Privilegio" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Car_Rol" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="Listar_Rol_Privilegio" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        
    </head>
    <body>
    <center>
        <label class="title">OTORGAR PRIVILEGIOS</label>
        <form class="form" action="../../../Privilegios" method="post"> 
            <table class="table" >  
                <%for(int u=0 ;u<Listar_Car_Rol.size();u++){
                V_Rol r=new V_Rol();
                r=(V_Rol)Listar_Car_Rol.get(u);
                
                %>
                <tr><td>Nombre</td><td ><input type="text" name="Nombre_Rol" class="text-box" value="<%=r.getNo_Rol()%>" disabled="disabled"></td></tr>
                <tr><td>Nro_orden:</td><td><input type="number" name="NRO_ORDEN" class="text-box"  ></td></tr>                                 
               <tr><td>Privilegio:</td><td>
                       <select name="IDPRIVILEGIO" >
                           <option>------</option>
                       <% for(int i =0;i<List_Privilegio.size();i++){
                           Privilegio p=new Privilegio();
                           p =(Privilegio)List_Privilegio.get(i);
                       %>
                           <option value="<%=p.getId_privilegio()%>"><%=p.getNo_link()%></option>
                         <%}%>
                       </select>
                     
                   </td></tr>                       
               <input type="hidden" name="ESTADO" value="1" class="text-box">                           
               <tr><td><input type="submit" name="opc"  class="submit" value="Otorgar"></td><td><input type="submit" name="opc"  class="submit" value="Terminar"></td></tr>
            </table>
       </form>
   </center>
    <br><br>
    </body>
</html>
<center></center>
<%
                }
       
%>