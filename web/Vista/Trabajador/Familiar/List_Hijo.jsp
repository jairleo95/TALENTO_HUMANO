<%@page import="pe.edu.upeu.application.model.Datos_Hijo_Trabajador"%>
<jsp:useBean id="LISTA_HIJO" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Lista Hijos</title>
        <link rel="stylesheet" href="../../../css/Css_Lista/listas.css" />
    </head>
    <body>
    <center>

        <table>
            <thead>
                <tr>
                    <th class="cajita">Nro</th>
                    <th class="cajita">Apellidos y Nombres</th>
                    <th class="cajita">Fecha de Nacimiento</th>              
                    <th class="cajita">Sexo</th>              
                    <th class="cajita">Tipo Documento</th>
                    <th class="cajita">Nro Documento</th>
                    <!--<th class="cajita">Presentó</th>-->
                    <th class="cajita">Essalud</th>
                    <th class="cajita">Est. Nivel Superior</th>
                   <!--  <th class="cajita">Usuario Registro</th>-->
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

                    <td class="caji"><%=h.getFe_nacimiento()%></td>
                    <td class="caji">
                        <%
                            if (h.getEs_sexo().trim().equals("M")) {
                                out.println("Masculino");
                            }
                            if (h.getEs_sexo().trim().equals("F")) {
                                out.println("Femenino");
                            }
                        %>
                    </td>
                    <td class="caji">
                        <%
                            if (h.getEs_tipo_doc().trim().equals("1")) {
                                out.println("Dni");
                            }
                            if (h.getEs_tipo_doc().trim().equals("2")) {
                                out.println("Partida");
                            }
                        %>
                    </td>
                    <td class="caji"><%=h.getNu_doc()%></td>


                    <td class="caji">
                        <%
                            if (h.getEs_inscripcion_vig_essalud().trim().equals("1")) {
                                out.println("Si");
                            }
                            if (h.getEs_inscripcion_vig_essalud().trim().equals("0")) {
                                out.println("No");
                            }
                        %>
                    </td>
                    <td class="caji">
                        <%
                            if (h.getEs_estudio_niv_superior().trim().equals("1")) {
                                out.println("Si");
                            }
                            if (h.getEs_estudio_niv_superior().trim().equals("0")) {
                                out.println("No");
                            }
                        %>
                    </td>
                    <input type="hidden" name="opc" value="<%=h.getId_datos_hijos_trabajador()%>">
                    <input type="hidden" name="opc" value="<%=h.getId_trabajador()%>">
                    <td class="caji"> <a href="Mod_Datos_Hijos.jsp" ><img src="../../../imagenes/lapiz.png" alt="" width="25px" height="25px"/></a></td>
                    <td class="caji"><a href=""><img src="../../../imagenes/eliminar.png" alt=""   width="25px" height="25px"/></a></td>                    
                </tr>
                <% }}%>
            </tbody>
        </table>
    </center>
</body>
</html>
