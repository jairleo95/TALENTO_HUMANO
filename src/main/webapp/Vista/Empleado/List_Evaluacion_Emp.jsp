<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : List_Evaluacion_Emp
    Created on : 08/01/2015, 06:57:41 PM
    Author     : Alex
--%>
<%@page import="pe.edu.upeu.application.model.Evaluacion_Emp"%>
<jsp:useBean id="LIST_EVALUACION" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <style>
            table, th, td {
                border: 1px solid black;
            }
        </style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
          <link rel="stylesheet" type="text/css" media="screen" href="../../css/bootstrap.min.css">
        <title>Lista Evaluación</title>
    </head>
    <body>
        <form align="center" action="../../empleado" >
        <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%" >
            <thead>
                <tr>
                    <th data-hide="phone">Evaluación</th>
                    <th data-class="expand">Estado</th>
                    <th data-hide="phone,tablet" >Opciones</th>
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
                        <%
                            if (e.getRe_evaluacion().trim().equals("0")) {
                                out.println("No es Jefe");
                            }
                            if (e.getRe_evaluacion().trim().equals("1")) {
                                out.println("Jefe de Sección");
                            }
                            if (e.getRe_evaluacion().trim().equals("2")) {
                                out.println("Jefe de  Area");
                            }
                            if (e.getRe_evaluacion().trim().equals("3")) {
                                out.println("Jefe de Departamento");
                            }
                            if (e.getRe_evaluacion().trim().equals("4")) {
                                out.println("Jefe de  Direccón");
                            }

                        %>
                    </td>
                    <td>
                        <%                            if (e.getEs_evaluacion().equals("0")) {
                                out.println("Sin Evaluar");
                            }
                            if (e.getEs_evaluacion().equals("1")) {
                                out.println("Evaluado");
                            }
                        %>    
                    </td>
                    <td>
                         <input type="hidden" name="idemp" value="<%=request.getParameter("idemp")%>"> 
                      <input class="btn btn-success" type="submit" name="opc" value="Editar">  
                    </td>
                    <%}%>
            <div>
            </div>
            
        </tr>
    </tbody>
</table>
</form>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
