<%-- 
    Document   : List_Evaluacion_Emp
    Created on : 08/01/2015, 06:57:41 PM
    Author     : Alex
--%>
<%@page import="pe.edu.upeu.application.model.Evaluacion_Emp"%>
<jsp:useBean id="LIST_EVALUACION" scope="application" class="java.util.ArrayList"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" >
            <thead>
                <tr>
                    <th data-hide="phone">Puesto</th>
                    <th data-class="expand">Estado</th>
                    <th data-hide="phone,tablet" colspan="2">Opciones</th>
                </tr>

            </thead>
            <tbody>
                <%
                    for (int i = 0; i < LIST_EVALUACION.size(); i++) {
                        Evaluacion_Emp e = new Evaluacion_Emp();
                        e = (Evaluacion_Emp) LIST_EVALUACION.get(i);

                %>
                <tr>
                    <td>
                        <%                            if (e.getRe_evaluacion().trim().equals("0")) {
                                out.println("No es Jefe");
                            }
                            if (e.getRe_evaluacion().trim().equals("1")) {
                                out.println("Jefe de Sección");
                            }
                            if (e.getRe_evaluacion().trim().equals("2")) {
                                out.println("Jefe de  Área");
                            }
                            if (e.getRe_evaluacion().trim().equals("3")) {
                                out.println("Jefe de Departamento");
                            }
                            if (e.getRe_evaluacion().trim().equals("4")) {
                                out.println("Jefe de  Dirección");
                            }

                        %>
                    </td>
                    <td>
                        <%                            if (e.getEs_evaluacion().trim().equals("0")) {
                                out.println("Sin Evaluar");
                            }
                            if (e.getEs_evaluacion().trim().equals("1")) {
                                out.println("Evaluado");
                            }
                        %>    
                    </td>
                    <td>
                        <a href="../../../empleado?ideva=<%=e.getId_evaluacion_emp()%>&iemp=<%=e.getId_empleado()%>&opc=modificar_eva" >
                            <img src="../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a>
                    </td>
                    <td>
                        <a href="../../../familiar?idhijo=<%=e.getId_evaluacion_emp()%>&iemp=<%=e.getId_empleado()%>&opc=eliminar_eva" >
                            <img src="../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td> 
                    </td>
                    <%}%>
                </tr>
            </tbody>
        </table>
    </body>
</html>
