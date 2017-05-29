<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%
    HttpSession sesion = request.getSession(true);
    String iddep = (String) request.getAttribute("DEPARTAMENTO_ID");

%>
<jsp:useBean id="ListarTrabajador" scope="session" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>Fichas de Trabajador</title>
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/font-awesome.min.css">

        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">


    </head>
    <body>  
        <div id="main" role="main" style="margin-left: 0px;">
            <!-- MAIN CONTENT -->
            <div id="content">
                <section id="widget-grid" class="">
                    <center>
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="well well-sm">
                                    <div class="slideInDown fast animated">
                                        <div class="spacing">
                                            <center><h1 class="text-info" >Fichas de Trabajador</h1></center>
                                        </div>
                                        <form method="post" action="../../trabajador" class="form-inline">                    
                                            <div class="form-group">
                                                <input type="text"  class="form-control input-sm"  name="nom" maxlength="50" placeholder="Nombres">
                                            </div>
                                            <div class="form-group">
                                                <input type="text"  class="form-control input-sm"  name="ape_pat" maxlength="50" placeholder="Apellido Paterno">
                                            </div>
                                            <div class="form-group">
                                                <input type="text"  class="form-control input-sm"  name="ape_mat" maxlength="50" placeholder="Apellido Materno">
                                            </div>
                                            <div class="form-group">
                                                <input type="text"  class="form-control input-sm"  onKeyPress="return checkIt(event)" name="dni" maxlength="10" placeholder="DNI">
                                            </div>
                                            <input type="hidden" name="opc" value="Buscar_Trabajador">
                                            <input   type="hidden" name="busqueda"  value="Buscar">
                                            <div class="form-group">
                                                <button type="submit" class="btn btn-labeled btn-default"><span class="btn-label"><i class="fa fa-search"></i></span>Buscar </button>
                                                <a href="?cancel=true" class="btn btn-labeled btn-danger"> <span class="btn-label"><i class="glyphicon glyphicon-remove"></i></span>Cancelar </a>
                                                <a href="../../trabajador?opc=Form_Reg" class="btn btn-labeled btn-primary"> <span class="btn-label"><i class="fa fa-plus"></i></span>Nueva Ficha </a>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
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

                        <%}
                        if (count > 0) {%>
                        <div class="row">
                            <div class="col col-sm-12">
                                <div class="well">
                                    <table class="table table-hover text-center" >
                                        <tr class="tab_cabe" >
                                            <td>Nro</td>
                                            <td>Foto</td>
                                            <td>Nombres Y Apellidos</td>
                                            <td>DNI</td>
                                            <td>Carrera</td>
                                            <td>Datos</td>
                                        </tr>
                                        <% for (int i = 0; i < ListarTrabajador.size(); i++) {
                                                V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                                                tr = (V_Ficha_Trab_Num_C) ListarTrabajador.get(i);
                                        %>
                                        <tr>
                                            <td><%out.println(i + 1);%></td>         
                                            <%

                                                if (tr.getAr_foto() == null) {%>
                                            <td><img src="../../img/avatar_default.jpg"  width="30"  height="30"></td>
                                                <%} else {%>
                                            <td><img src="<%=FactoryConnectionDB.url_archivos + "Fotos/" + tr.getAr_foto()%>"  width="30"  height="30"></td>
                                                <% }%>

                                            <td><div><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list"><%=tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " " + tr.getNo_trabajador().toUpperCase()%></a></div></td>
                                            <td><%=tr.getNu_doc()%></td>
                                            <td><%if (tr.getNo_carrera() != null) {
                                                    out.println(tr.getNo_carrera());
                                                } else {
                                                    out.println("Ninguna");
                                                }
                                                %></td>
                                            <td>
                                                <a class="btn btn-default" href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list">
                                                    <i class="fa fa-info fa-lg"></i></a>
                                            </td>

                                        </tr>


                                        <%
                                                    }
                                                    ListarTrabajador.clear();

                                                }

                                            }%> 
                                    </table>
                                </div>
                            </div>
                        </div>

                    </center>
                </section>
            </div>
        </div>



    </body>
    <script  type="text/javascript">
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
    </script>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>