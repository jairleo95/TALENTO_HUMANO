
<jsp:useBean class="java.util.ArrayList" id="Det_Autorizacion" scope="application" />
<%@page import="pe.edu.upeu.application.model.X_List_De_Autorizacion"%>
<!DOCTYPE html >

<html>

    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>
        <link href="../../css/Css_Lista/listas.css" rel="stylesheet"> 
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <style type="text/css">
            @media 
            only screen and (max-width: 760px),
            (min-device-width: 768px) and (max-device-width: 1024px)  {

                /* Force table to not be like tables anymore */
                table, thead, tbody, th, td, tr { 
                    display: block; 
                }

                /* Hide table headers (but not display: none;, for accessibility) */
                thead tr { 
                    position: absolute;
                    top: -9999px;
                    left: -9999px;
                }

                tr { border: 1px solid #ccc; }

                td { 
                    /* Behave  like a "row" */
                    border: none;
                    border-bottom: 1px solid #eee; 
                    position: relative;
                    padding-left: 50%; 
                }

                td:before { 
                    /* Now like a table header */
                    position: absolute;
                    /* Top/left values mimic padding */
                    top: 6px;
                    left: 6px;
                    width: 45%; 
                    padding-right: 10px; 
                    white-space: nowrap;
                }


                td:nth-of-type(1):before { content: "Paso"; }
                td:nth-of-type(2):before { content: "Estado"; }
                td:nth-of-type(3):before { content: "Encargado"; }
                td:nth-of-type(4):before { content: "Cargo Encargado"; }
                td:nth-of-type(5):before { content: "Area"; }
                td:nth-of-type(6):before { content: "Departamento"; }
                td:nth-of-type(7):before { content: "Detalle"; }



            }   
        </style>
        <%
            HttpSession sesion = request.getSession();
            String rol = (String) sesion.getAttribute("IDROL");
        %>

    </head>
    <body>
    <center>
        <br>

        <br>

        <div class="spacing">
            <center><h1 class="spacing">HISTORIAL DE AUTORIZACIONES POR  TRABAJADOR</h1></center>
        </div>

        <%
            X_List_De_Autorizacion s = new X_List_De_Autorizacion();
            s = (X_List_De_Autorizacion) Det_Autorizacion.get(0);

        %>


        <table class="table">
            <tr><td ><strong>Nombre:</strong></td><td><label><%=s.getAP_PATERNO().toUpperCase() + " " + s.getAP_MATERNO().toUpperCase() + " " + s.getNO_TRABAJADOR().toUpperCase()%></label></td></tr>
            <tr><td ><strong>Sueldo:</strong></td><td><label><%=s.getCA_SUELDO()%> </label></td></tr>
            <tr><td ><strong>Puesto:</strong></td><td><label><%=s.getNo_puesto()%></label></td></tr>
            <tr><td ><strong>Tipo Proceso:</strong></td><td><label><%=s.getNo_proceso()%> </label></td></tr>
        </table>


        <table >

            <thead>
                <tr>
                    <th class="cajita">Paso</th>
                    <th class="cajita">Estado</th>
                    <th class="cajita">Encargado</th>
                    <th class="cajita">Cargo Encargado</th>
                    <th class="cajita">Area</th>
                    <th class="cajita">Departamento</th>
                    <th class="cajita">Detalle</th>
                </tr>
            </thead>
            <tbody>
                <%for (int i = 0; i < Det_Autorizacion.size(); i++) {
                        X_List_De_Autorizacion a = new X_List_De_Autorizacion();
                        a = (X_List_De_Autorizacion) Det_Autorizacion.get(i);
                %>
                <tr >
                    <td class="caji"><%=a.getNu_pasos()%></td>
                    <td class="caji" ><% if (a.getEs_autorizacion().equals("1")) { %>
                        <img src="../../imagenes/Aprobado.png" width="40" height="40">
                        <% }
                            if (a.getEs_autorizacion().equals("2")) {
                        %>
                        <img src="../../imagenes/Desaprobado.png" width="40" height="40">
                        <% }%></td>
                    <td class="caji" style="width:300px;"><%=a.getUs_ap_p().toUpperCase() + " " + a.getUs_ap_mat().toUpperCase() + " " + a.getUs_no_tr().toUpperCase()%></td> 
                    <td class="caji" style="width: 200px;"><%=a.getUs_no_puesto()%></td> 
                    <td class="caji"><%=a.getUs_no_area()%></td> 
                    <td class="caji" style="width: 200px;"><%=a.getUs_no_dep()%></td> 
                    <td class="caji" style="width: 300px;"><%=a.getDe_pasos()%></td> 

                </tr> 
                <%
                    if (a.getEs_autorizacion().equals("2") & (rol.trim().equals("ROL-0002")|rol.trim().equals("ROL-0005"))) {

                %>
            <div class="alerta">
                <h1>Alerta! debe Corregir el Dgp... se ha Rechazado el Dgp</h1>
                <a href="../Control/ControlAutorizacion.php?opc=HDGP&ida=<? echo $list[$i][13]; ?>">Habilitar DGP</a></div>
                <%}%>
                <% }%>
            </tbody>
        </table>
    </center>
</body>
</html>
