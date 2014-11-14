<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Privilegio" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Listar Privilegios</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />

    </head>
    <body>
        <form action="../../../Privilegios" method="post">
            <center>
            
        <table>
            <tr><input type="submit" name="opc" value="Registrar"></tr>
            <tr><td class="cajita">Nro</td>
                <td class="cajita">Privilegio</td>
                <td class="cajita">Estado</td>
                <td class="cajita" colspan="3">Opcion</td>
            <%for(int i=0;i<List_Privilegio.size();i++){
              Privilegio r = new Privilegio();
              r = (Privilegio) List_Privilegio.get(i);
              
            %>    
            <tr><td class=""><%=i+1%></td>
                <td class=""><%=r.getNo_link()%></td>
               <% if(r.getEs_privilegio().trim().equals("0")){%>
                <td class="caji"> Desactivado </td>
                <%}else if(r.getEs_privilegio().trim().equals("1")){%>
                    <td class="caji"> Activado </td> 
                <%}%>
                 <td class="caji"> <a href="../../../Privilegios?id_priv=<%=r.getId_privilegio()%>&opc=modificar_Priv1" ><img src="../../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                 <td class="caji"><a href="../../../Privilegios?id_priv=<%=r.getId_privilegio()%>&opc=Desactivar_Priv" ><img src="../../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                 <td class="caji"><a href="../../../Privilegios?id_priv=<%=r.getId_privilegio()%>&opc=Activar_Priv" ><img src="../../../imagenes/Aprobado.png" alt=""   width="25px" height="25px"/></a></td> 
            <tr>
            <%}%>
        </table>
        </center>
        </form>
    </body>
</html>
