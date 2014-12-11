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

        <!-- Basic Styles -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../../css/font-awesome.min.css">
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

        <form action="../../../documento" method="post" enctype="multipart/form-data">
            <table id="datatable_tabletools" class="table table-striped table-bordered table-hover" width="100%">
                <thead>
                <center>
                    <tr>
                        <th class="cajita">DOCUMENTO</th>   
                        <th class="cajita">ADJUNTAR</th>   
                        <th class="cajita">DESCRIPCION</th>   
                        <th class="cajita">RECIBIDO?</th>   
                    </tr>
                </center>
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
                            <% if (d.getNo_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003"))) {%>
                            <input type="file" name="lob_upload<%=i + 1%>">
                            <% } else { %>
                            <% if (d.getAr_dato_archivo() == null) { %>
                            <label class="null">No Registrado</label>
                            <% } else {%>
                            <a href="Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_archivo()%></a>

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

                                <img src="Aprobado.png" width="20" height="20">
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
                        <% if (d.getNo_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_archivo()%></a>

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

                            <img src="Aprobado.png" width="20" height="20">
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
                    <td class="caji"  ><strong><%  if (d.getTi_documento().trim().equals("ACMA")) {
                            out.println("ACTA DE MATRIMONIO CON: <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                        }
                        if (d.getTi_documento().trim().equals("DNIC")) {
                            out.println("COPIA DNI CONYUGUE : <p style='color:red;' >" + co.getAp_nombres_conyugue() + "</p>");
                        }%>
                        </strong></td>

                    <td class="caji">
                        <% if (d.getNo_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getNo_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_archivo()%></a>

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

                            <img src="Aprobado.png" width="20" height="20">
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
                        <% if (d.getNo_archivo() == null & (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0003"))) {%>
                        <input type="file" name="lob_upload<%=i + 1%>">
                        <% } else { %>
                        <% if (d.getAr_dato_archivo() == null) { %>
                        <label class="null">No Registrado</label>
                        <% } else {%>
                        <a href="Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_archivo()%></a>

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

                            <img src="Aprobado.png" width="20" height="20">
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
                        <a href="Ver_Doc.jsp?nom_doc=<%=d.getAr_dato_archivo()%>"><%=d.getNo_archivo()%></a>
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
                            <img src="Aprobado.png" width="20" height="20">
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
        <a href="../../../dgp?iddgp=<%=request.getParameter("iddgp")%>&idtr=<%=request.getParameter("idtr")%>&opc=rd">Continuar</a>

        <% }
            }%> 

    </center>
</body>
</html>
