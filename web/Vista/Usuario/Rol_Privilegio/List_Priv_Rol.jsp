<%@page import="pe.edu.upeu.application.model.Privilegio_Rol"%>
<jsp:useBean id="Listar_Rol_Privilegio" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
    </head>
    <body>
        <table>
            <tr><td class="cajita">Nro</td><td class="cajita">Privilegio</td><td class="cajita">Estado</td><td class="cajita" colspan="3">Opcion</td></tr>
            <%for(int rv=0;rv<Listar_Rol_Privilegio.size();rv++){
                Privilegio_Rol q=new Privilegio_Rol();
                q=(Privilegio_Rol)Listar_Rol_Privilegio.get(rv);
            %>
            <tr><td class="cajita"><%=rv+1%></td>
                <td class="cajita"><%=q.getNo_link()%>%</td>
                <%if(q.getEs_detalle_privilegio().equals("1")){%>
                <td class="cajita">Activado</td>
                <%} else if(q.getEs_detalle_privilegio().equals("0")){%>
                <td class="cajita">Desactivado</td>
                <%}%>
                 <td class="caji"> <a href="../../../Privilegios?id_det_priv=<%=q.getId_detalle_privilegio()%>&opc=Modificar_DET" ><img src="../../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                <td class="caji"><a href="../../../Privilegios?id_det_priv=<%=q.getId_detalle_privilegio()%>&opc=Desactivar_DET" ><img src="../../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                <td class="caji"><a href="../../../Privilegios?id_det_priv=<%=q.getId_detalle_privilegio()%>&opc=Activar_DET" ><img src="../../../imagenes/Aprobado.png" alt=""   width="25px" height="25px"/></a></td> 
        </table>
    </body>
</html>
