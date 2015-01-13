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
                <input name="NO_HORARIO"  size="40" /><br>
                COMENTARIO:<br>
                <textarea name="DE_HORARIO" rows="4"></textarea>
            </fieldset>
            <footer>
                <input type="hidden" name="ES_HORARIO" value="1">
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
                            <th width="10%">Nr</th>
                            <th>Nombre</th>
                            <th>Observación</th>
                            <th width="10%">Cant.Horas</th>
                            <th colspan="2">Opción</th>
                        </tr>
                    </thead>
                    <%for (int i = 0; i < List_Tipo_Horario.size(); i++) {
                             Tipo_Horario th = new Tipo_Horario();
                             th = (Tipo_Horario) List_Tipo_Horario.get(i);%>
                    <tbody>
                    <td><%=i%></td>
                    <td><%=th.getNo_horario()%></td>
                    <td><%=th.getDe_horario()%></td>
                    <td><%=th.getCa_horas()%></td>
                    <td> 
                        <a href="Reg_Formato_Horario.jsp?idth="<%=th.getId_tipo_horario()%> >Establecer Horarios</a>
                        
                    </td>
                    <td>
                        <a >Eliminar</a>
                    </td>
                    </tbody>
                    <%}%>
                </table>
            </fieldset>
        </form>
    </body>
</html>
