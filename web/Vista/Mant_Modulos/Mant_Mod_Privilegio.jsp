<%@page import="pe.edu.upeu.application.properties.globalProperties"%>
<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>
<%-- 
    Document   : Mant_Mod_Privilegio
    Created on : 13-ene-2015, 17:44:48
    Author     : joserodrigo
--%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
        <link type="text/css" rel="stylesheet" href="../../css/Css_Reporte/Reportes.css">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Formulario/form.css">
        <link rel="stylesheet" href="../../css/bootstrap.min.css">
        <title>MANTENIMIENTO DE MODULO & REQUERIMIENTO</title>
    </head>
    <body>
        <div>
            <center><h1 class="spacing" style="font-weight: bold;"> MANT. DE MOD. Y PRIV.</h1></center>
        </div>
        <div id="contenido">
            <div class="form-group row">
                <center>
                    <form  class="form-modulo" action="">
                        <table>
                            <tr><td colspan="3"><label>MODULO:</label></td>
                                <td colspan="3">
                                    <select class="selec_id_modulo form-control" name="id_modulo" required="" id="selec_modulo">
                                        <option >[SELECCIONAR]</option>
                                    </select>
                                </td>
                            </tr>
                            <tr><td colspan="3"><label>PRIVILEGIO:</label></td>
                                <td colspan="3">
                                    <select class="form-control" name="id_privi" required="" id="selec_priv">
                                        <option>[SELECCIONAR]</option>
                                    </select>
                                </td>
                            </tr>
                            <input  type="hidden" name="opc" value="Registrar"/>
                            <tr><td colspan="6"><button class="btn btn-primary" name="" id="btn_prv" >REGISTRAR</button></td></tr>

                        </table>
                    </form>
                </center>
            </div>
            <div class="container" >
                <center>
                    <table id="rellena" class="table">
                        <thead class="tab_cabe">
                            <tr class="tr">
                                <td><span >Nro</span></td>
                                <td><span title="no_md">MODULO</span></td>
                                <td><span title="es_md">ESTADO MODULO </span></td>
                                <td><span title="no_pr">PRIVILEGIO</span></td>
                                <td><span title="es_pr">ESTADO MODULO PRIV.</span></td>
                                <td colspan="2"><span>OPCIONES</span></td>
                            </tr>
                        </thead>
                        <tbody class="tbodys" id="list">

                        </tbody>
                    </table>
                </center>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="../../js/JQuery/jQuery.js"></script>
    <script src="../../js/libs/jquery-ui-1.10.3.min.js"></script>

    <script src="../../js/businessLogic/Modulo/mantModPrivilegio.js?v=<%=globalProperties.VERSION_JS%>" type="text/javascript"></script>
</html>

<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
