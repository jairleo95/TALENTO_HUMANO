<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%
    HttpSession sesion = request.getSession(true);
    String iddep = (String) request.getAttribute("DEPARTAMENTO_ID");

%>
<jsp:useBean id="ListarTrabajador" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link rel="stylesheet" href="../../css1/bootstrap.min.css">
        <title>Fichas de Trabajador</title>
        <link rel="stylesheet" href="../../css/Css_Trabajador/style.css" />
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <script type="text/javascript" src="../../js/Js_Alerta/alertify.js"></script>
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.core.css" />
        <link rel="stylesheet" href="../../css/Css_Alerta/alertify.default.css" />
        <script type="text/javascript"  src="../../js/Js_Alerta/Alertas.js"></script>
    </head>
    <SCRIPT LANGUAGE="JavaScript">
        function checkIt(evt) {
            evt = (evt) ? evt : window.event
            var charCode = (evt.which) ? evt.which : evt.keyCode
            if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                status = "This field accepts numbers only."
                return false
            }
            status = ""
            return true
        }
    </SCRIPT>

    <body style="height: 1024px;">  

        <div class="spacing">
            <center><h1 class="spacing">Fichas de Trabajador</h1></center>


        </div>
    <center>
        <div class="container theme-showcase">
           
            <div class="form-group">
                <label class="control-label">Elaborar Ficha</label>
                <a href="../../trabajador?opc=Form_Reg"    class="btn btn-primary" role="button" >Agregar Nueva Ficha</a>   
            </div>
            <div>
     
                <form method="post" action="../../trabajador" class="form-inline">                    

                <div class="form-group">
                    <label class="control-label">Nombres:</label><br>
                    <input type="text"  class="form-control"  name="nom">
                </div>
                <div class="form-group">
                    <label class="control-label" >Apellido Paterno:</label><br>
                    <input type="text"  class="form-control"  name="ape_pat">
                </div>
                <div class="form-group">
                    <label class="control-label" >Apellido Materno:</label><br>
                    <input type="text"  class="form-control"  name="ape_mat">
                </div>
                <div class="form-group">
                    <label class="control-label" >DNI:</label><br>
                    <input type="text"  class="form-control"  onKeyPress="return checkIt(event)" name="dni">
                </div>
                    <input type="hidden" name="opc" value="Buscar">
                <div class="form-group">
                    <br>
                    <input class="btn btn-primary"  type="submit" name="busqueda"  value="Buscar">

                    <a href="?cancel=true"  class="btn btn-primary" role="button">Cancelar</a>
                </div>

            </form>
            </div>
            <%                int count = ListarTrabajador.size();
                String cancel = request.getParameter("cancel");
                if (cancel != null) {
                    if (cancel.equals("true")) {
                        ListarTrabajador.clear();
                    }
                } else {

                    if (count == 0) {
            %>
            <h1>No se encontraron registros...</h1>
            <%}
                if (count > 0) {%>
                <br>
            <table class="table table-hover">
                <tr class="tab_cabe">
                    <td>Nro</td>
                    <td>Foto</td>
                    <td>Nombre</td>
                    <td>Carrera</td>
                    <td>Acciones</td>
                </tr>
                <% for (int i = 0; i < ListarTrabajador.size(); i++) {
                        V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                        tr = (V_Ficha_Trab_Num_C) ListarTrabajador.get(i);
                %>
                <tr>
                    <td><%out.println(i + 1);%></td>         
                    <%
                        /*require_once '../Modelo/Modelo_Imagen.php';
                         $mod_f= new Modelo_Imagen();
                         $idf=$mod_f->LIST_FOTO_TRABAJADOR($listra[$index][0]);*/

                    %>

                    <% //if ($idf==null) {%>
                    <td><img src="../../imagenes/avatar_default.jpg"  width="80"  height="80"></td>
                        <%//}else{%>
                    <!--<td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>-->
                    <% //}%>

                    <td><div ><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list"><%=tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " " + tr.getNo_trabajador().toUpperCase()%></a></div></td>
                    <td><%=tr.getNo_carrera()%></td>
                    <td>
                        <%
                            /*require_once '../Modelo/ModeloDGP.php';
                             $mddgp= new ModeloDGP();
                             $num=$mddgp->VAL_TRA_DGP($listra[$index][0]);

                             $n_v=$mddgp->VAL_OPC_DGP($listra[$index][0]);
                             if ($n_v>0) {
                             */
                        %>
                        <a href="List_Dgp_Trabajador.jsp?idtr=<? echo $listra[$index][0];?>">Ver DGP's</a>
                        <%//}else{%> 
                        <% //if ($listra[$index][62]>0) {%>
                        <% //if ($num[0][0]!=0) {%>
                        <a href="List_Dgp_trabajador.jsp?idtr=<? echo $listra[$index][0];?>">Ver DGP's</a>
                        <%//}%>
                        <a href="../Contrato/Detalle_Info_Contractual.jsp?idtr=<? echo $listra[$index][0];?>">Ver Contratos</a>
                        <%//}else{%>
                        <a href="../Dgp/Reg_Dgp.jsp?idtr=<?echo $listra[$index][0];?>">Solicitar Contratación</a>        
                        <%  //if ($_SESSION["IDROL"]==6) {%>
                        <a href="../Contrato/Reg_Contrato.jsp?idtr=<?echo $listra[$index][0];?>">ELaborar Contrato</a>                       
                        <%//}%>
                        <%//}}%>
                    </td>

                </tr>
                <% //} %>

                <%//}}%>


                <%
                            }
                        }

                    }%> 
            </table>
        </div>
    </center>
</body>

</html>
