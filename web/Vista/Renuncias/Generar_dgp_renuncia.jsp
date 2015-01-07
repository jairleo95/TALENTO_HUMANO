<%@page import="pe.edu.upeu.application.model.X_Lis_Empleados"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<jsp:useBean id="Buscar_Empl" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">

        <title></title>
    </head>
    <body>
    <center>
        <div class="spacing" >
            <center><h1 class="spacing" style="font-weight: bold;">
                    REQUERIMIENTO DE RENUNCIA</h1></center>
                    <%String text = request.getParameter("text");
                        HttpSession sesion = request.getSession(true);
                        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");%>
        </div>
        <hr>
        <div>
            <form method="post" action="../../empleado" class="form-inline">                    
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
                <input type="hidden" name="opc" value="Listar_empleados">
                <input type="hidden" name="busc" value="Busc">
                <input type="hidden" name="text" value="<%=text%>">
                <div class="form-group">
                    <br>
                    <input class="btn btn-primary"  type="submit" name="busqueda"  value="Buscar">
                    <a href="?cancel=true&text=" class="btn btn-primary" role="button">Cancelar</a>
                </div>

            </form>
        </div>
        <hr>
        <% int count = Buscar_Empl.size();
            String cancel = request.getParameter("cancel");
            if (cancel != null) {
                if (cancel.equals("true")) {
                    Buscar_Empl.clear();
                }
            } else {
                if (count == 0) {%>
        <strong>No se encontraron registros...</strong>
        <%} else if (count > 0) {%>
        <table class="table table-hover" style="width: 50%" >
            <tr class="tab_cabe">
                <td>Nro</td>
                <td>Foto</td>
                <td>Nombre</td>
                <td>Acciones</td>
            </tr>
            <%  for (int i = 0; i < Buscar_Empl.size(); i++) {
                    X_Lis_Empleados x = new X_Lis_Empleados();
                    x = (X_Lis_Empleados) Buscar_Empl.get(i);
            %>
            <tr>
                <td><%=i + 1%></td>
                <td><img src="../../imagenes/avatar_default.jpg"  width="30"  height="30"></td>
                <!--<td><img src="../Usuario/Fotos/"  width="30"  height="30"></td>-->
                <td><div><a href="../../trabajador?idtr=<%=x.getId_trabajador()%>&opc=list"><%=x.getAp_paterno() + " " + x.getAp_materno() + " " + x.getNo_trabajador()%></a></div></td>
                        <%%>
                <td><div ><a href="../../Renuncias?opc=Reg_renuncia&idtr=<%=x.getId_trabajador()%>&iddep=<%=iddep%>" class="btn bg-color-teal txt-color-white">Elaborar Requerimiento</a></div></td>
                
                    <%}}Buscar_Empl.clear();
                        }%>
            </tr>

        </table>

    </center>

</body>
</html>
