<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<%@page import="pe.edu.upeu.application.model.V_Reg_Dgp_Tra"%>
<jsp:useBean id="List_Hijos" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Conyugue" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Adventista" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_doc_req_pla" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title>Archivos por adjuntar</title>
        <link href="../../../css/Css_Lista/listas.css"  rel="stylesheet" >
        <!--  <style>
            
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
                                
                  td:nth-of-type(1):before { content: "Documento"; }
                  td:nth-of-type(2):before { content: "Adjuntar"; }
                  td:nth-of-type(3):before { content: "Descripcion"; }
                  td:nth-of-type(4):before { content: "Recibido"; }
  
          }      
          </style>-->
    </head>

    <body>
        <%

            HttpSession sesion = request.getSession(true);
            String rol = (String) sesion.getAttribute("IDROL");
            int n_nac = Integer.parseInt(request.getParameter("n_nac"));
            int num_ad = Integer.parseInt(request.getParameter("num_ad"));
            String id_dgp = "";
        %>
    <center>

        <form action="../../../documento" method="post" >
            <table>
                <thead>
                    <tr>
                        <th class="cajita">DOCUMENTO</th>   
                        <th class="cajita">ADJUNTAR</th>   
                        <th class="cajita">DESCRIPCION</th>   
                        <th class="cajita">RECIBIDO?</th>   
                    </tr>
                </thead>
                <tbody>
                    <%                        int i = 0;
                        for (int z = 0; z < List_doc_req_pla.size(); z++) {
                            V_Reg_Dgp_Tra d = new V_Reg_Dgp_Tra();
                            d = (V_Reg_Dgp_Tra) List_doc_req_pla.get(z);
                    %>

                    <%  if (d.getTi_documento().trim().equals("DOCA")) {%>
                    <%  if (n_nac != 0) {%>
                    <tr>

                        <td class="caji"><strong><%=d.getDocumento()%></strong></td>

                        <td class="caji">
                            <% if (d.getAr_dato_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003"))) {%>
                            <input type="file" name="lob_upload<%=i + 1%>">
                            <% } else { %>
                            <% if (d.getAr_dato_archivo() == null) { %>
                            <label class="null">No Registrado</label>
                            <% } else {%>
                            <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><%=d.getNo_archivo()%></a>

                            <% }
                                } %>
                        </td>

                        <td class="caji">
                            <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                            <input type="text" name="lob_description<%=i + 1%>">
                            <% } else { %>
                            <% if (d.getDe_documento_adjunto() == null) { %>
                            <label class="null" >No Registrado</label>
                            <% } else {%>
                            <label> <%=d.getDe_documento_adjunto()%></label>

                            <% } %>
                            <% } %>    
                        </td>
                        <td class="caji">
                            <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002")  | rol.trim().equals("ROL-0003")| rol.trim().equals("ROL-0005"))) {%>
                            <input type="checkbox"  value="1"  name="estado<%=i + 1%>">
                            <% } else { %>
                            <% if (d.getEs_documento_adjunto() == null) { %>

                            <label class="null">No Registrado</label>
                            <% } else { %>
                            <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                                <img src="../../../Imagenes/Aprobado.png" width="20" height="20">
                                <%
                                } else {
                                    out.println(d.getEs_documento_adjunto().trim());
                                %></label>
                                <% }
                                        }
                                    }%>
                        </td>
                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                </tr>  




                <%}
                    }%>
                <%  if (d.getTi_documento().trim().equals("COFE")) {%>
                <%  if (num_ad != 0) {%>
                <tr>
                    <td class="caji"><strong><%=d.getDocumento()%></strong></td>

                    <td class="caji">
                        <% if (d.getAr_dato_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><%=d.getNo_archivo()%></a>

                        <% }
                            } %>
                    </td>

                    <td class="caji">
                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="text" name="lob_description<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getDe_documento_adjunto() == null) { %>
                        <label class="null" >No Registrado</label>
                        <% } else {%>
                        <label> <%=d.getDe_documento_adjunto()%></label>

                        <% } %>
                        <% } %>    
                    </td>
                    <td class="caji">
                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="checkbox"  value="1"  name="estado<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getEs_documento_adjunto() == null) { %>

                        <label class="null">No Registrado</label>
                        <% } else { %>
                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) {
                            %>

                            <img src="../../../Imagenes/Checkmark.jpg" width="20" height="20">
                            <%
                            } else {
                                out.println(d.getEs_documento_adjunto().trim());
                            %></label>
                            <% }
                                    }
                                }%>
                    </td>
                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                </tr>  


                <%}
                    }%>
                <%  if (d.getTi_documento().trim().equals("DNIC") | d.getTi_documento().trim().equals("ACMA")) {%>

                <%
                    for (int kj = 0; kj < List_Conyugue.size(); kj++) {
                        Padre_Madre_Conyugue co = new Padre_Madre_Conyugue();
                        co = (Padre_Madre_Conyugue) List_Conyugue.get(kj);
                %>             


                <tr>
                    <td class="caji"><strong><%  if (d.getTi_documento().trim().equals("ACMA")) {
                            out.println("ACTA DE MATRIMONIO CON:" + co.getAp_nombres_conyugue());
                        }
                        if (d.getTi_documento().trim().equals("DNIC")) {
                            out.println("COPIA DNI CONYUGUE : " + co.getAp_nombres_conyugue());
                        }%>
                        </strong></td>

                    <td class="caji">
                        <% if (d.getAr_dato_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><%=d.getNo_archivo()%></a>

                        <% }
                            } %>
                    </td>

                    <td class="caji">
                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="text" name="lob_description<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getDe_documento_adjunto() == null) { %>
                        <label class="null" >No Registrado</label>
                        <% } else {%>
                        <label> <%=d.getDe_documento_adjunto()%></label>

                        <% } %>
                        <% } %>    
                    </td>
                    <td class="caji">
                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="checkbox"  value="1"  name="estado<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getEs_documento_adjunto() == null) { %>

                        <label class="null">No Registrado</label>
                        <% } else { %>
                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                            <img src="../../../Imagenes/Aprobado.png" width="20" height="20">
                            <%
                            } else {
                                out.println(d.getEs_documento_adjunto().trim());
                            %></label>
                            <% }
                                    }
                                }%>
                    </td>
                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                </tr>  



                <% } %>
                <% } %>

                <%  if (d.getTi_documento().trim().equals("DNIH")) {%>
                <%for (int kk = 0; kk < List_Hijos.size(); kk++) {
                        Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                        h = (Datos_Hijo_Trabajador) List_Hijos.get(kk);
                %>


                <tr>
                    <td class="caji"><strong>COPIA DNI DEL HIJO :  <%=h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador()%></strong></td>


                    <td class="caji">
                        <% if (d.getAr_dato_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><%=d.getNo_archivo()%></a>

                        <% }
                            } %>
                    </td>

                    <td class="caji">
                        <% if (d.getDe_documento_adjunto() == null & ((rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="text" name="lob_description<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getDe_documento_adjunto() == null) { %>
                        <label class="null" >No Registrado</label>
                        <% } else {%>
                        <label> <%=d.getDe_documento_adjunto()%></label>

                        <% } %>
                        <% } %>    
                    </td>
                    <td class="caji">
                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="checkbox"  value="1"  name="estado<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getEs_documento_adjunto() == null) { %>

                        <label class="null">No Registrado</label>
                        <% } else { %>
                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>

                            <img src="../../../Imagenes/Aprobado.png" width="20" height="20">
                            <%
                            } else {
                                out.println(d.getEs_documento_adjunto().trim());
                            %></label>
                            <% }
                                    }
                                }%>
                    </td>
                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                </tr>  

                <%
                        i++;

                    }

                %>

                <%} else if (!d.getTi_documento().trim().equals("DNIH") & !d.getTi_documento().trim().equals("DNIC") & !d.getTi_documento().trim().equals("ACMA") & !d.getTi_documento().trim().equals("COFE") & !d.getTi_documento().trim().equals("DOCA")) {
                %>
                <tr>
                    <td class="caji"><strong><%=d.getDocumento()%></strong></td>

                    <td class="caji">
                        <% if (d.getAr_dato_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.php?iddoc=<? echo $list_d[$z][25]; ?>"><%=d.getNo_archivo()%></a>
                        <% }
                            } %>
                    </td>
                    <td class="caji">
                        <% if (d.getDe_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003"))) {%>
                        <input type="text" name="lob_description<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getDe_documento_adjunto() == null) { %>
                        <label class="null" >No Registrado</label>
                        <% } else {%>
                        <label> <%=d.getDe_documento_adjunto()%></label>

                        <% } %>
                        <% } %>    
                    </td>
                    <td class="caji">
                        <% if (d.getEs_documento_adjunto() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="checkbox"  value="1"  name="estado<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getEs_documento_adjunto() == null) { %>

                        <label class="null">No Registrado</label>
                        <% } else { %>
                        <label><% if (d.getEs_documento_adjunto().trim().equals("1")) { %>
                            <img src="../../../Imagenes/Aprobado.png" width="20" height="20">
                            <%
                            } else {
                                out.println(d.getEs_documento_adjunto().trim());
                            %></label>
                            <% }
                                    }
                                }%>
                    </td>
                <input type="hidden" name="iddoc<%=i + 1%>" value="<%=d.getId_document()%>">
                </tr>  
                <input type="hidden" name="iddgp" value="<%=d.getIddgp()%>">
                <input type="hidden" name="idtr" value="<%=d.getId_trabajador().trim()%>">
                <% }
                        i++;
                        id_dgp = d.getIddgp();
                    }%>




                <input type="hidden" name="num" value="<%=i + 1%>">
                <% if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003")) { %>
                <tr><td><input type="submit" value="Registrar" name="opc"></td></tr>

                <% } %>
                </tbody>

            </table>


            <%   if (request.getParameter("pro") != null) {
                    if (request.getParameter("pro").equals("pr_dgp")) {
                        out.println("<input  type='hidden' value='enter' name='P2'/>");
                    }
                }

                if (request.getParameter("P2") != null) {
                    if (request.getParameter("P2").equals("TRUE")) {%>
        </form>
        <form action="../../../dgp" method="post">
            <input  type="hidden" value="<%=id_dgp%>" name="iddgp">
            <input type="submit" value="Terminar" name="opc">

        </form>
        <% }
            }%> 

    </center>
</body>
</html>
