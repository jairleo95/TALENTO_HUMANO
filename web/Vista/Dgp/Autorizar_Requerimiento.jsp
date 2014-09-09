<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Autorizar_Dgp"%>
<jsp:useBean id="List_id_Autorizacion" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Autorizacion</title>
        <link rel="stylesheet" href="../../css1/bootstrap.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">

    </head>
    <%
        int t = List_id_Autorizacion.size();
    %>


    <body class="body">  
        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">Requerimientos por Autorizar</h1></center>
        </div>
    <center>
        <div class="container theme-showcase">
            <strong>
            <h2>  
                Requerimientos (<%=t%>)
            </h2>       
            </strong>
            <table class="table table-hover" >

                <tr >
                    <td><strong>Nro</strong></td>
                    <td><strong>Foto</strong> </td>
                    <td><strong>Nombres y Apellidos</strong></td>
                    <td><strong>Puesto</strong></td>
                    <td><strong>Sección</strong></td>
                    <td><strong>Area</strong></td>
                    <td><strong>Motivo</strong></td>
                    <!--  <td>Departamento</td>-->
                    <td><strong>Descripcion</strong></td>
                    <td><strong>Proceso</strong></td>
                    <td><strong>Acciones</strong></td>
                    <td><strong>Documentos</strong></td>
                    <td><strong>Autorizar</strong></td>
                </tr>
                <%if (t == 0) {
                %>
                <tr><td colspan="12" align="center"><h3>No hay ningún DGP por autorizar...</h3></td></tr>
                <%}%>
                <%for (int f = 0; f < List_id_Autorizacion.size(); f++) {

                        V_Autorizar_Dgp a = new V_Autorizar_Dgp();
                        a = (V_Autorizar_Dgp) List_id_Autorizacion.get(f);
                %>

                <tr>
                    <td><%=f + 1%></td>
                    <%
                        /*require_once '../Modelo/Modelo_Imagen.php';
                         $mod_f= new Modelo_Imagen();
                         $idf=$mod_f->LIST_FOTO_TRABAJADOR($idtr);*/
                    %>

                    <% if (true) {%>
                    <td><img src="../../imagenes/avatar_default.jpg"  width="80"  height="80"></td>

                    <%} else {%>
                    <<td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>
                        <% }%>
                    <td style="width: 230px;"><div style="position: relative; margin-top:23px; "><%=a.getAp_paterno() + " " + a.getAp_materno() + " " + a.getNo_trabajador()%></div></td>
                    <td ><%=a.getNo_puesto()%></td>   
                    <td ><%=a.getNo_seccion()%></td> 
                    <td ><%=a.getNo_area()%></td>      
                    <td style="width: 300px;"><%=a.getNo_req()%></td>      
                    <!--     <td><? //echo $listra[$index][5]; ?></td>  -->     
                    <td style="width: 300px;"><%=a.getDe_pasos()%></td>
                    <td><a href="../../dgp?iddgp=<%=a.getId_dgp().trim()%>&opc=Seguimiento">Ver Proceso</a></td>
                    <td><a href="../../comentario?iddgp=<%=a.getId_dgp().trim()%>&idp=<%=a.getId_puesto()%>&opc=Comentar_Dgp">Comentar dgp</a></td> 
                    <td class="caji" ><a href="Documento/Reg_Documento.jsp?iddgp=<%=a.getId_dgp().trim()%>&idtr=<%=a.getId_trabajador().trim()%>">Ver Documentos</a></td> 
                    <%
                        HttpSession sesion = request.getSession(true);
                        String idrol = (String) sesion.getAttribute("IDROL");
                        String iddgp = request.getParameter("iddgp");
                        String idtr = request.getParameter("idtr");
                        InterfaceDgpDAO dgp = new DgpDAO();
                        int num = dgp.VALIDAR_DGP_CONTR(iddgp, idtr);
                    %>

                    <td><a href="../../trabajador?idtr=<%=a.getId_trabajador()%>&IDDETALLE_REQ_PROCESO=<%=a.getId_detalle_req_proceso()%>&iddetalle_dgp=<%=a.getId_dgp()%>&p=<%=a.getId_puesto()%>&cod=<%=a.getCo_pasos()%>&idpasos=<%=a.getId_pasos()%>&autorizacion=1&opc=aut&nup=<%=a.getNu_pasos()%>">
                            <%

                                if (idrol != null) {
                                    if (idrol.trim().equals("ROL-0006")) {
                                        if (num == 1) {
                                            out.println("Registrar Firma");
                                        }
                                        if (num == 0) {
                                            out.print("Hacer Contrato");
                                        } else {
                                            out.print("Autorizar");
                                        }
                                    } else {

                                        out.println("Autorizar");

                                    }

                                }

                            %> </a></td>    
                </tr>
                <% }%>
            </table>
        </div>
    </center>

</body>

</html>

