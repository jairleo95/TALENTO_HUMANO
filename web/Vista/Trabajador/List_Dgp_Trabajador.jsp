<%@page import="pe.edu.upeu.application.model.x_List_Id_Trab_Dgp"%>
<jsp:useBean id="LIST_ID_TRAB_DGP" class="java.util.ArrayList" scope="application"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <title>Autorizaciones DGP</title>

        <link href="../../css/Css_Lista/listas.css" rel="stylesheet">    
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

                td:nth-of-type(1):before { content: "Nro"; }
                td:nth-of-type(2):before { content: "Fecha Desde"; }
                td:nth-of-type(3):before { content: "Fecha HAsta"; }
                td:nth-of-type(4):before { content: "Motivo"; }
                td:nth-of-type(5):before { content: "Puesto Trabajador"; }
                td:nth-of-type(6):before { content: "Sección"; }
                td:nth-of-type(7):before { content: "Area"; }
                td:nth-of-type(8):before { content: "Estado"; }
                td:nth-of-type(9):before { content: "Documentos"; }
                //td:nth-of-type(10):before { content: "Arbitrary Data"; }

            }      
        </style>
    </head>
    <body>
    <center>
        <!--<label>DGP Elaborados del Trabajador</label>-->

        <div id="page-wrap">
            <table>
                <thead> 
                    <tr>
                        <th class="cajita">Nro</th>
                        <th class="cajita">Fecha Desde</th>
                        <th class="cajita">Fecha Hasta</th>
                        <th class="cajita">Motivo</th>
                        <th class="cajita">Puesto Trabajador</th>
                        <th class="cajita">Sección</th>
                        <th class="cajita">Area</th>
                        <th class="cajita">Estado</th>
                        <th class="cajita">Documentos</th>
                        <th class="cajita">Detalle</th>
                    </tr>
                </thead>
                <%  if (LIST_ID_TRAB_DGP.size() == 0) {%>
                <td colspan="10" style="text-align: center"><h2>El Trabajador  no Tiene ningun DGP elaborado...</h2></td>
                <%}%>

                <tbody> 
                    <%for (int i = 0; i < LIST_ID_TRAB_DGP.size(); i++) {
                            x_List_Id_Trab_Dgp d = new x_List_Id_Trab_Dgp();
                            d = (x_List_Id_Trab_Dgp) LIST_ID_TRAB_DGP.get(i);
                    %>
                    <tr>
                        <td class="caji" ><%=i + 1%></td>
                        <td class="caji"><%=d.getFe_desde()%></td>
                        <td class="caji" ><%=d.getFe_hasta()%></td>
                        <td class="caji" ><%=d.getNo_req()%></td>
                        <td class="caji"><%=d.getNo_puesto()%></td>
                        <td class="caji"><%=d.getNo_seccion()%></td> 

                        <td class="caji" ><%=d.getNo_area()%></td> 

                        <td class="caji">
                            <%
                                if (d.getEs_dgp() != null) {
                                    if (d.getEs_dgp().trim().equals("0")) {
                            %>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">En Proceso</a>
                            <% }%>
                            <%if (d.getEs_dgp().trim().equals("1")) {
                            %>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">Ver Proceso Terminado</a>
                            <% }
                            } else {%>
                            <a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&opc=Seguimiento">Incompleto - Interrumpido</a>
                            <%}%>
                        </td> 
                        <td class="caji" ><a href="../../documento?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Ver_Documento">Ver Documentos</a></td> 


                        <td class="caji" ><a href="../../dgp?iddgp=<%=d.getId_dgp().trim()%>&idtr=<%=d.getId_trabajador().trim()%>&opc=Detalle">Ver Detalle</a></td>
                        <%}%>
                    </tr> 
                </tbody>
            </table>
        </div>
    </center>
</body>
</html>
