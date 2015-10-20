<%@page import="pe.edu.upeu.application.model.V_Solicitud_Requerimiento"%>

<jsp:useBean id="Detalle_Solicitud" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalle de solicitud</title>
    </head>
    <body>
    <center> 
        <%for (int i = 0; i < Detalle_Solicitud.size(); i++) {
                V_Solicitud_Requerimiento s = new V_Solicitud_Requerimiento();
                s = (V_Solicitud_Requerimiento) Detalle_Solicitud.get(i);
        %>
        <h1>Solicitud</h1>
        <table border='1'>
            <tr><td>Requerimiento:</td><td><%=s.getNo_req()%></td></tr>
            <tr><td>Apellidos y Nombres</td><td><%=s.getAp_paterno() + " " + s.getAp_materno() + " " + s.getNo_trabajador()%></td></tr>
            <tr><td>Tipo de Plazo</td><td><%=s.getTi_plazo()%></td></tr>
            <tr><td>Nombre de Plazo</td><td><%=s.getNo_plazo()%></td></tr>
            <tr><td>Detalle de Plazo</td><td><%=s.getDet_alerta()%></td></tr>
            <%if (s.getTi_plazo().trim().equals("1")) {
            %>  
            <tr><td>Fecha de inicio de contrato solicitada : </td><td><%=s.getFe_desde_s()%></td></tr>
            <%} else if (s.getTi_plazo().trim().equals("2")) {
            %>
            <tr><td>Mes de ingreso solicitado :</td><td><%=s.getFe_desde_s()%></td></tr>
            <%}%>
            <tr><td>Motivo de solicitud</td><td><%=s.getDe_solicitud()%></td></tr>
            <tr><td colspan="2"><button type="button">Procesar Solicitud</button></td></tr>
        </table>
        <%}%>
    </center>
</body>
</html>
