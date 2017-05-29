<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<jsp:useBean id="LISTA_HIJO" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Listar Roles</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
    </head>
    <body>
    <center>

        <table>
            <thead>
                <tr>
                    <th class="cajita">Nro</th>
                    <th class="cajita">Rol</th>
                    <th class="cajita">Privilegio</th>                          
                   <th colspan="2" class="cajita">Opciones</th>
                </tr>  
            </thead>
            <tbody>

                <%for (int i = 0; i < LISTA_HIJO.size(); i++) {
                        Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                        h = (Datos_Hijo_Trabajador) LISTA_HIJO.get(i);
                        if(h.getEs_datos_hijo_trabajador().trim().equals("1")){
                %>

                <tr>
                    <td class="caji"><%=i + 1%></td>
                    <td class="caji"><%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></td>
                    <td class="caji"><%=h.getNu_doc()%></td>
                    <td class="caji"> <a href="../../../familiar?idhijo=<%=h.getId_datos_hijos_trabajador()%>&idtr=<%=h.getId_trabajador()%>&opc=modificar" ><img src="../../../img/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"> <a href="../../../familiar?idhijo=<%=h.getId_datos_hijos_trabajador()%>&idtr=<%=h.getId_trabajador()%>&opc=eliminar" ><img src="../../../img/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                            
                </tr>
                <% }}
                LISTA_HIJO.clear();%>.
            </tbody
        </table>
    </center>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>