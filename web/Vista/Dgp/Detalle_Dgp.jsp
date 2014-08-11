

<%@page import="pe.edu.upeu.application.dao.UsuarioDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.V_Det_DGP"%>
<%@page import="pe.edu.upeu.application.model.X_List_id_dgp"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.dao.DgpDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceDgpDAO"%>
<jsp:useBean id="LIST_ID_DGP" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="VALIDAR_DGP_CONTR" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LIST_ID_USER" scope="application" class="java.util.ArrayList"/>
<?    session_start();

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link href="../../css/Css_Bootstrap/bootstrap.css" rel="stylesheet">
        <link href="../../css/Css_Bootstrap/bootstrap-theme.min.css" rel="stylesheet">
        <title>Detalle DGP</title>
        
        <style type="text/css">
            body{
                background-color: #D2E0E6;
            }
            
            .tab_det{
                margin-top: 0px;
               // margin-left: 5%;
               // font-family: cursive;
               //font-size:18px;
            }
            .td-det{ 
            font-weight:bold ;
            text-align: right;
            }
            
        </style>
    </head>
    <body><center>
        
       
        <form>
        <table class="tab_det">
            
             <% for (int i = 0; i < LIST_ID_DGP.size(); i++) {
             V_Det_DGP d = new V_Det_DGP();
             d=(V_Det_DGP)LIST_ID_DGP.get(i);
             %>
            
            <label style="color: red; //font-family: cursive;"><h2><%=d.getNo_req()%></h2></label>
         
            
            <tr><td class="td-det">Fecha Desde:</td><td><%=d.getFe_desde()%></td></tr>
             <tr ><td class="td-det">Fecha Hasta:</td><td><%=d.getFe_hasta()%></td></tr>
            
             <tr><td class="td-det">Sueldo : S/.</td><td><%=d.getCa_sueldo()%></td></tr>
             <tr><td class="td-det">Bono Alimentario : S/.</td><td><%=d.getCa_bono_alimentario()%></td></tr>
             <tr style="color: red;"><td class="td-det" >Sueldo Total : S/.</td><td><%=(d.getCa_sueldo()+d.getCa_bono_alimentario())%></td></tr>
           
            <!-- <tr><td class="td-det">Dias de Trabajo:</td><td><?//echo $list[$index][4];?></td></tr>
             <tr><td class="td-det">Horario:</td><td><?//echo $list[$index][5];?></td></tr>
            -->
             <tr><td class="td-det">Puesto:</td><td><%=d.getNo_puesto()%></td></tr>
             <tr><td class="td-det">Horario:</td><td><a href="../../horario?iddgp=<%=d.getId_dgp()%>&opc=Listar ">Ver Horario</a></td></tr>
             
             </tr>
             <tr><td class="td-det">BEV: </td><td><%=d.getDe_bev()%></td></tr>
             <tr><td class="td-det">Centro de Costos: </td><td><%=d.getCa_centro_costos()%></td></tr>
             <tr><td class="td-det">Antecedentes Policiales: </td><td><%=d.getDe_antecedentes_policiales()%></td></tr>
             <tr><td class="td-det">Certificado de Salud: </td><td><%=d.getDe_certificado_salud()%></td></tr>
             
             <!--<tr><td class="td-det">Ruc:</td><td><?echo $list[$index][9];?></td></tr>
             <tr><td class="td-det">Lugar de Servicio:</td><td><?echo $list[$index][10];?></td></tr>
             <tr><td class="td-det">Periodo de Pago:</td><td><?echo $list[$index][12];?></td></tr>
             <tr><td class="td-det">Horario de Capacitación:</td><td><?echo $list[$index][15];?></td></tr>
             <tr><td class="td-det">Horario de Refrigerio:</td><td><?echo $list[$index][16];?></td></tr>
             <tr><td class="td-det">Dias Capacitación:</td><td><?echo $list[$index][17];?></td></tr>
             <tr><td class="td-det">Subvención:</td><td><?echo $list[$index][14];?></td></tr>
             ->
             

             <!--<tr><td colspan="2"></td><td><input class="btn btn-success" style="width: 100px" type="submit" value="Editar"></td>
-->               

                      
               
                <% 
                HttpSession sesion = request.getSession(true);
                String idrol=(String)sesion.getAttribute("IDROL");
                String num=request.getParameter("num");
                if(num.equals("0") && d.getEs_dgp().equals("0") && idrol.equals("ROL-0006")){ 
                %>
                
                <td><a href="Reg_Dgp.jsp?iddgp=<%=d.getId_dgp()%>&idtr=<%=d.getId_requerimiento()%>">Hacer Contrato</a></td></tr>
           <%}if(d.getEs_dgp().equals("1") && num.equals("0") && idrol!="6"){%>
                 <td><a href="">Ver Contrato</a></td></tr>
           <%}%>
   
             <tr style="color: red;">
                 <% InterfaceUsuarioDAO us = new UsuarioDAO();
                      Usuario u = new Usuario();
                    if (d.getUs_modif()!=null){ %>
                 <td class="td-det">Modificado por:</td>
                 <td><%
               for(int j = 0 ; j < us.List_ID_User(d.getUs_modif()).size(); j++){
                     
                     u=(Usuario)LIST_ID_USER.get(j);
                     out.print(u.getId_rol());
               }%>
                 </td>
                 <%}%>
                 
             <% if(d.getUs_creacion() != null){%>
             <td class="td-det">Creado por:</td><td><% 
             //$list_us=$mdu->LIST_ID_USER($list[$index][19]);
             for (int k = 0; k < us.List_ID_User(d.getUs_creacion()).size(); k++) {
                 out.print(u.getId_rol());
             }
             %></td>
                 <%}%>
             </tr>
              <%}%>
             
              <% if(request.getParameter("opc")!=null){ 
             if (request.getParameter("opc").equals("reg_doc")) {%>
             <tr><td><h3>Registrar documentos</h3>
                     <a href="Documento/Reg_Documento.jsp?iddgp=<%=request.getParameter("ID_DGP")%>&idtr=<%=request.getParameter("ID_TRABAJADOR")%>">Siguiente</a></td></tr>
                <%}}%>
        </table>
            </form>
        </center>
    </body>
</html>
