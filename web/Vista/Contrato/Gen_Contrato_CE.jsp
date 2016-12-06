<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {
%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<jsp:useBean id="ListarTrabajador2" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
            <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <title></title>
    </head>
    <body>
    <center>
        <div class="spacing" >
            <center><h1 class="spacing" style="font-weight: bold;">
                    BUSCAR TRABAJADOR
                    <%
                        HttpSession sesion_1 = request.getSession(true);
                        String text = request.getParameter("text");
                        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");

                    %>
                </h1></center>
        </div>
        <hr/>
        <div>
            <form method="post" action="../../contrato" class="form-inline">                    
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
                    <input type="text"  class="form-control"  onKeyPress="return checkIt(event)" name="dni" maxlength="8">
                </div>
                <input type="hidden" name="opc" value="Buscar">
                <input type="hidden" name="busc" value="Busc">
                <input type="hidden" name="text" value="<%=text%>">
                <div class="form-group">
                    <br>
                    <input class="btn btn-primary"  type="submit" name="busqueda"  value="Buscar">
                    <a href="?cancel=true&text=<%=text%>" class="btn btn-primary" role="button">Cancelar</a>
                    <a href="../../contrato?opc=Reporte_CE" class="btn btn-success" role="button">Contratos Especiales</a>
                </div>

            </form>
        </div>
        <hr/>
        <%
            int count = ListarTrabajador2.size();
            String cancel = request.getParameter("cancel");
            if (cancel != null) {
                if (cancel.equals("true")) {
                    ListarTrabajador2.clear();
                }
            } else {

                if (count == 0) {
        %>
        <strong>No se encontraron registros...</strong>
        <%}
            if (count > 0) {%>
        <table class="table table-hover" style="width: 50%" >
            <tr class="tab_cabe">
                <td>Nro</td>
                <td>Foto</td>
                <td>Nombre</td>
                <td>Carrera</td>
                <td>Acciones</td>
            </tr>
            <% for (int i = 0; i < ListarTrabajador2.size(); i++) {
                    V_Ficha_Trab_Num_C tr = new V_Ficha_Trab_Num_C();
                    tr = (V_Ficha_Trab_Num_C) ListarTrabajador2.get(i);
            %>
            <tr>
                <td><%out.println(i + 1);%></td>         
                <% if (tr.getAr_foto() == null) {%>
                <td><img src="../../img/avatar_default.jpg"  width="30"  height="30"></td>
                    <% } else {%>
                <td><img src="../Usuario/Fotos/<%=tr.getAr_foto()%>"  width="30"  height="30"></td>
                    <% }%>
                <td><div><a href="../../trabajador?idtr=<%=tr.getId_trabajador()%>&opc=list"><%=tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " " + tr.getNo_trabajador().toUpperCase()%></a></div></td>
                <td><%if (tr.getNo_carrera() != null) {
                        out.println(tr.getNo_carrera());
                    } else {
                        out.println("Ninguna");
                    }
                    %></td>
                <td>
                    <%if (tr.getVi_contrato().equals("0")) {%>
                    <%String nom = tr.getAp_paterno().toUpperCase() + " " + tr.getAp_materno().toUpperCase() + " " + tr.getNo_trabajador().toUpperCase();%>
                    <a href="../../contrato?idtr=<%=tr.getId_trabajador()%>&iddep=<%=iddep%>&nom=<%=nom%>&opc=LIST_FORMULARIO" class="btn bg-color-teal txt-color-white">Elaborar Contrato</a>
                    <%} else {%>
                      <a href="" disabled="" class="btn bg-color-red txt-color-white">Contrato Vigente</a>
                        <%}%>
                </td> 
              
            </tr>
            <%
                        }
                        ListarTrabajador2.clear();
                    }
                }%> 
        </table>

        <?}}?>

    </center>

</body>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>