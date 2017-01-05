
<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Direccion"%>
<%
    HttpSession sesion = request.getSession();
    String id_user = (String) sesion.getAttribute("IDUSER");
    if (id_user != null) {

%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%@page import="pe.edu.upeu.application.model.Requerimiento"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<jsp:useBean id="Listar_Direccion" scope="session" class="java.util.ArrayList"/>
<jsp:useBean class="java.util.ArrayList" scope="session"  id="Listar_Requerimiento"/>
<jsp:useBean class="java.util.ArrayList" scope="session"  id="List_Area_ID"/>
<%    HttpSession sesion_1 = request.getSession(true);
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    String id_dep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
    if (id_user_1 != "") {
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <!-- SmartAdmin Styles : Please note (smartadmin-production.css) was created using LESS variables -->
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production-plugins.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-production.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../css/smartadmin-skins.min.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <title>Contratos</title>
    </head>
    <body class="slideInDown fast animated"> 

        <form class="form-inline validarform" id="frm_filtro2" method="post" action="../../Imprimir" name="formulario" onclick="return marcado();" >
            <center><h1 class="text-danger" >Contratos</h1></center>
            <center>
                <div id="contenido">                
                    <div class="col-md-12" style="padding:0 2%;box-sizing: border-box;">
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-calendar"></i>   Buscar por Fechas</li>
                            </ol>
                            <div class="form-group" >
                                <label>Fecha de Contratacion</label><br>
                                <input type="date"  class="form-control" name="del"  length="45" style="width: 250px" id="del"/>
                            </div>
                            <div class="form-group" >
                                <label>Al</label><br>
                                <input type="date"  class="form-control" name="al" size="45" maxlength="100" style="width: 250px" id="al" />
                                <input type="hidden" name="iddep" value="<%%>">
                                <input type="hidden" class="is_d_ses" value="<%=id_dep%>">
                            </div>
                            <div class="form-group">
                                <label>Fecha Inicio:</label><br>
                                <input type="date" name="fec_i" class="form-control" length="45" style="width: 250px" id="fe_i">
                            </div>
                            <div class="form-group">
                                <label>Fecha Fin :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_fin">
                            </div>
                            <div class="form-group">
                                <label>Fecha Suscripcion :</label><br>
                                <input type="date" name="fec_f" class="form-control" size="45" maxlength="100" style="width: 250px" id="fe_sus">
                            </div>
                        </div>
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-briefcase"></i>   Datos de empleo</li>
                            </ol>
                            <%if (id_dep.equals("DPT-0019")) {%>
                            <div class="form-group">  
                                <label>Direccion :</label><br>
                                <select name="direccion" class="form-control selecdireccion" style="width: 250px" id="select_direccion">
                                    <option value="" selected disabled>[Seleccione]</option>
                                    <%for (int i = 0; i < Listar_Direccion.size(); i++) {
                                            Direccion a = new Direccion();
                                            a = (Direccion) Listar_Direccion.get(i);
                                    %>
                                    <option value="<%=a.getId_direccion()%>"><%=a.getNo_direccion()%></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group" >
                                <label>Departamento :</label><br>
                                <select name="departamento" class="form-control selectdep" id="select_dep" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <%}%>
                            <%if (!id_dep.trim().equals("DPT-0019")) {%>
                            <div class="form-group">
                                <label>Area :</label><br>
                                <select name="area" class="form-control selectarea" id="select_area" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                    <%for (int i = 0; i < List_Area_ID.size(); i++) {
                                            Area ar = new Area();
                                            ar = (Area) List_Area_ID.get(i);
                                    %>
                                    <option value="<%=ar.getId_area()%>"><%=ar.getNo_area()%></option>
                                    <%}%>
                                </select>
                            </div><%} else {%>
                            <div class="form-group">
                                <label>Area :</label><br>
                                <select name="area" class="form-control selectarea" id="select_area" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div><%}%>
                            <div class="form-group" >
                                <label>Seccion :</label><br>
                                <select name="seccion" class="form-control selectsec" id="select_sec" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Puesto :</label><br>
                                <select name="puesto" class="form-control selectpu" id="select_pu" style="width: 250px"> 
                                    <option value="" selected disabled>[Seleccione]</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <ol class="breadcrumb" style="background: #01579b ;border-radius: 15px;color: white;font-family: arial;opacity: 0.8;">
                                <li><i class="glyphicon glyphicon-user"></i>   Datos del Trabajador</li>
                            </ol>
                            <div class="form-group">
                                <label>Persona :</label><br>
                                <div class="input-group">
                                    <div class="input-group-addon"><i class="glyphicon glyphicon-user"></i></div>
                                    <input type="text"  class="form-control" name="nom_ape"   id="ap" placeholder="Nombre y/o los Apellidos">
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Sueldo :</label><br>
                                <div class="input-group">
                                    <div class="input-group-addon">$</div>
                                    <input type="number" name="sueldo" class="form-control" maxlength="10" id="sueldo" value="" placeholder="Ingrese el sueldo">
                                    <div class="input-group-addon">.00</div>
                                </div>
                            </div>
                            
                        </div>
                        <br/>
                        <div class="col-md-12" style="padding: 1% 0;box-sizing: border-box;">
                            <div class="form-group">                            
                                <button type="button" class="btn btn-primary" id="btnbuscar"><i class="glyphicon glyphicon-search"></i>  Buscar</button>
                            </div>
                            <div class="form-group">  
                                <a href="javascript:;"  id="btncancel" class="btn btn-danger" ><i class="glyphicon glyphicon-remove"></i>   Cancelar</a>
                            </div>
                        </div>   
                    </div> 
                    <div class="col-md-12 advice hidden">
                        <div class="alert alert-danger alert-dismissible" role="alert" style="width: 50%;">
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <i class="glyphicon glyphicon-exclamation-sign"></i>   No se encontraron datos en la búsqueda
                        </div>
                    </div>
                    <div class="col-md-12">
                        <center><div class="container conTable" style="width: 95%;">
                            </div></center>
                    </div>
                    <div id="wait" style="display:none;width:69px;height:89px;position:absolute;top:50%;left:50%;padding:2px;" align="center"><img src='../../img/por-favor-espere.gif' width="100" height="100" /><br>Loading..</div>
                </div>
            </center>
        </form>
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <script src="../../ajax/ajax.google.min.js"></script>     
        
        <script src="../../js/businessLogic/Contrato/buscContrato.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
    </body>
</html>

<%        }%>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }


%>
