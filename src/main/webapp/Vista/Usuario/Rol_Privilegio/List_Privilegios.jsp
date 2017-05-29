<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%@page import="pe.edu.upeu.application.model.Privilegio"%>
<%@page import="pe.edu.upeu.application.model.Rol"%>
<jsp:useBean id="List_Privilegio" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Listar Privilegios</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
        <link rel="stylesheet" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" >

    </head>
    <body>
        <form >
            <center>
            
                <table style="border-radius:" class="table-bordered table-responsive table-mailbox">
            <tr><td class="cajita">Nro</td>
                <td class="cajita">Modulo</td>
                <td class="cajita">Privilegio</td>
                <td class="cajita">Estado</td>
                <td class="cajita" colspan="4">Opcion</td>
            <%for(int i=0;i<List_Privilegio.size();i++){
              Privilegio r = new Privilegio();
              r = (Privilegio) List_Privilegio.get(i);
              
            %>    
            <tr class=""><td class="" ><%=i+1%></td>
                <td class=""><%=r.getNo_modulo()%></td>
                <td class=""><%=r.getNo_link()%></td>
               <% if(r.getEs_privilegio().trim().equals("0")){%>
                <td class="caji"> Desactivado </td>
                <%}else if(r.getEs_privilegio().trim().equals("1")){%>
                    <td class="caji"> Activado </td> 
                <%}%>
                
                 <td class="caji"> <a href="../../../Privilegio?id_priv=<%=r.getId_privilegio()%>&opc=modificar_Priv1" ><img src="../../../img/lapiz.png" alt="" width="20px" height="20px"/></a></td>
                 <td class="caji"><a href="../../../Privilegio?id_priv=<%=r.getId_privilegio()%>&opc=Desactivar_Priv" ><img src="../../../img/eliminar.png" alt=""   width="20px" height="20px"/></a></td> 
                 <td class="caji"><a href="../../../Privilegio?id_priv=<%=r.getId_privilegio()%>&opc=Activar_Priv" ><img src="../../../img/Aprobado.png" alt=""   width="20px" height="20px"/></a></td> 
                 <td class="caji"><a href="../../../Privilegio?id_priv=<%=r.getId_privilegio()%>&opc=Eliminar_Priv" ><img src="../../../img/Desaprobado.png" alt=""   width="20px" height="20px"/></a></td> 
            <tr>
            <%}%>
        </table>
        </center>
        </form>
    </body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>