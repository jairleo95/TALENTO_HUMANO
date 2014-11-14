
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="Listar_Rol_id" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title></title>
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >
    </head>
    <body>

        <title class="title">Modificar Rol</title>>
        <form action="../../../Privilegios"> 
            <center>
            <table class=""class="table" >  
                <%for(int i=0 ;i<Listar_Rol_id.size();i++){
                Rol r=new Rol();
                r=(Rol)Listar_Rol_id.get(i);
                %>
                <tr><td>Nombre:</td><td ><input type="text" name="Nombre_Rol" class="" value="<%=r.getNo_rol()%>"></td></tr>
                <tr><td>Estado Rol</td><td>
                        <select name="Es_rol"  required="">
                            <%if(r.getEs_rol().equals("1")){%>
                            <option  value="1" selected="">Activado</option>
                            <option value="0">Desactivado</option>
                            <%}else if(r.getEs_rol().trim().equals("0")){%>
                            <option value="1">Activado</option>
                            <option value="0" selected="">Desactivado</option>
                            <%}%>
                        </select>
                    </td></tr>              
               <input type="hidden" name="" value="Modificar_rol2" class="text-box">                           
               <input type="hidden" name="id_rol" value="<%=r.getId_rol()%>" class="text-box">                           
               <tr><td><input type="submit" name="opc"value="Modificar"></td></tr>
            </table>
                        <%}%>
           </center>
        </form>
    </body>
</html>
