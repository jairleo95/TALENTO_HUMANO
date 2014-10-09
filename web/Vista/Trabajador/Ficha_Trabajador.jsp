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
       
        <title>Fichas de Trabajador</title>

        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
 <link rel="stylesheet" href="../../css/bootstrap.min.css">
      
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

    <body >  

        <div class="spacing">
            <center><h1 class="spacing" style="font-weight: bold;">Fichas de Trabajador</h1></center>
            <br>

        </div>
    <center>
        <div class="container theme-showcase">

            <div class="form-group">
                <label class="control-label">Elaborar Ficha</label><br>
                <a href="../../trabajador?opc=Form_Reg"    class="btn btn-primary" role="button" >Agregar Nueva Ficha</a>   
            </div>
            <br>
            <div>

                <form method="post" action="../../trabajador" class="form-inline">                    

                    <div class="form-group">
                        <label class="control-label" >Nombres:</label><br>
                        <input type="text"  class="form-control"  name="nom" maxlength="50">
                    </div>
                    <div class="form-group">
                        <label class="control-label" >Apellido Paterno:</label><br>
                        <input type="text"  class="form-control"  name="ape_pat" maxlength="50">
                    </div>
                    <div class="form-group">
                        <label class="control-label" >Apellido Materno:</label><br>
                        <input type="text"  class="form-control"  name="ape_mat" maxlength="50">
                    </div>
                    <div class="form-group">
                        <label class="control-label" >DNI:</label><br>
                        <input type="text"  class="form-control"  onKeyPress="return checkIt(event)" name="dni" maxlength="8">
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
            <h1></h1>
            <%}
                if (count > 0) {%>
            <br>
            <table class="table table-hover">
                <tr class="tab_cabe">
                    <td>Nro</td>
                    <td>Foto</td>
                    <td>Nombres Y Apellidos</td>
                    <td>DNI</td>
                    <td>Carrera</td>
                    <td>Detalle</td>
                </tr>
                <% for (int i = 0; i < ListarTrabajador.size(); i++) {
                        V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                        tr = (V_Ficha_Trab_Num_C) ListarTrabajador.get(i);
                %>
                <tr>
                    <td><%out.println(i + 1);%></td>         


                    <% if (true) {%>
                    <td><img src="../../imagenes/avatar_default.jpg"  width="30"  height="30"></td>
                        <%} else {%>
                    <td><img src="Foto.php?idf=<?echo $idf;?>"  width="80"  height="80"></td>
                        <% }%>

                    <td><div ><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list"><%=tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " " + tr.getNo_trabajador().toUpperCase()%></a></div></td>
                    <td><%=tr.getNu_doc()%></td>
                    <td><%if (tr.getNo_carrera() != null) {
                            out.println(tr.getNo_carrera());
                        } else {
                            out.println("Ninguna");
                        }
                        %></td>
                     <td><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list">Ver Detalle</a></td>

                </tr>


                <%
                            }
                            ListarTrabajador.clear();

                        }

                    }%> 
            </table>
        </div>
    </center>
</body>

</html>
