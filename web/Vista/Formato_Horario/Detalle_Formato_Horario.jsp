<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
        Usuario us = new Usuario();
%>
<%-- 
    Document   : Detalle
    Created on : 13/01/2015, 12:17:43 PM
    Author     : Alex
--%>

<%@page import="pe.edu.upeu.application.model.Tipo_Horario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="List_Tipo_Horario" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    
    <body>
        <form action="../../formato_horario">
            <fieldset>
                NOMBRE DEL FORMATO:<br>
                <input name="NO_HORARIO"  size="40" required=""/><br>
                COMENTARIO:<br>
                <textarea name="DE_HORARIO" rows="4"></textarea>
            </fieldset>
            <footer>
                <input type="hidden" name="ES_HORARIO" value="1" >
                <input type="hidden" name="opc" value="registrar">
                <input type="hidden" name="CA_HORAS" value="0">
                <button type="submit" name="opc">
                    CREAR
                </button>
            </footer>
            <fieldset>
                <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" >
                    <thead>
                        <tr>
                            <th width="5%">Nr</th>
                            <th>Nombre</th>
                            <th width="40%">Observación</th>
                            <th width="7%">Cant.Horas</th>
                            <th >Opción</th>
                        </tr>
                    </thead>
                    <%for (int i = 0; i < List_Tipo_Horario.size(); i++) {
                             Tipo_Horario th = new Tipo_Horario();
                             th = (Tipo_Horario) List_Tipo_Horario.get(i);
                             
                    ;%>
                    <tbody>
                    <td><center><%=i%></center></td>
                    <td><%=th.getNo_horario()%></td>
                    <td><%=th.getDe_horario()%></td>
                    <td><%=th.getCa_horas()%></td>
                    <td><center>
                        <%if (th.getCa_formato().equals("0")) {%>
                        <a href="Reg_Formato_Horario.jsp?idth=<%=th.getId_tipo_horario()%>&nofor=<%=th.getNo_horario()%>">Establecer Horarios</a>
                        <%}else{%>
                        <a href="../../formato_horario?opc=LISTAR_FORMATO_HORARIO&idth=<%=th.getId_tipo_horario()%>&nofor=<%=th.getNo_horario()%>">Ver</a>
                        <%}%>
                   </center> </td>
                   
                    </tbody>
                    <%}%>
                </table>
            </fieldset>
        </form>
    </body>
</html>

<%} else {
        response.sendRedirect("/TALENTO_HUMANO/");
    }
%>