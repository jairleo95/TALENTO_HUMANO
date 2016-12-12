<%@page import="pe.edu.upeu.application.model.Usuario"%>
<%
    HttpSession sesion_1 = request.getSession();
    String id_user_1 = (String) sesion_1.getAttribute("IDUSER");
    if (id_user_1 != null) {
%>

<%@page import="pe.edu.upeu.application.model.Padre_Madre_Conyugue"%>
<jsp:useBean id="List_PMC" scope="session" class="java.util.ArrayList"/>
<!DOCTYPE html >
<html>
    <head>
        <meta charset="windows-1252">
        <title></title>

        <link rel="stylesheet" href="../../../css/Css_Formulario/form.css"  type="text/css" > 
        <script language="javascript" type="text/javascript" src="../../../js/JQuery/jQuery.js"></script>
        <script type="text/javascript">
            $(document).ready(
                    function() {
                        $("#as").focus();
                    }
            );
        </script>
    </head>
    <body>
    <center>
        <label class="title">MODIFICA PADRE, MADRE Y CONYUGUE</label>

        <form class="form" action="../../../familiar"> 
            <div >
                <table class="table" >  
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Padre y Madre</label></div></td></tr>
                    <%for (int i = 0; i < List_PMC.size(); i++) {
                            Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
                            pmc = (Padre_Madre_Conyugue) List_PMC.get(i);
                    %>
                    <tr><td>Apellidos y Nombres del Padre:</td><td><input type="text" name="APELLIDOS_NOMBRES_PADRE"    class="text-box"  id="as" required="" maxlength="50" value="<%=pmc.getAp_nombres_padre()%>" onblur="this.value = this.value.toUpperCase()"></td></tr>         
                    <tr><td>Apellidos  y Nombres de la Madre:</td><td><input type="text" name="APELLIDOS_NOMBRES_MADRE"  class="text-box" required="" maxlength="50" value="<%=pmc.getAp_nombres_madre()%>" onblur="this.value = this.value.toUpperCase()"></td></tr>        
               
                </table>  
                
            </div>
            <div style="display: //none;" >
                <table  class="table">
                    <tr><td colspan="4"><div class="sub_title"><label class="label">Datos del Cónyugue</label></div></td></tr>
                    <tr><td>¿Trabaja Upeu Conyugue?</td><td>
                            <select name="TRABAJA_UPEU_CONYUGUE"  required=""  class="text-box">
                                <%if(pmc.getEs_trabaja_upeu_conyugue().trim().equals("1")){%>
                                <option value="1" selected="">Si</option>
                                <option value="0">No</option>
                                <%}else if(pmc.getEs_trabaja_upeu_conyugue().trim().equals("0")){%>
                                <option value="1">Si</option>
                                <option value="0" selected="">No</option>
                                <%}%>
                            </select>
                        </td></tr>  
                    
                    <tr><td>Apellidos y Nombres :</td><td><input type="text" name="APELLIDO_NOMBRES_CONYUGUE" class="text-box" required="" maxlength="50" value="<%=pmc.getAp_nombres_conyugue()%>" onblur="this.value = this.value.toUpperCase()"></td></tr>    
                    <tr><td>Fecha de Nacimiento:</td><td><input type="date" name="FECHA_NAC_CONYUGUE"  class="text-box" required="" value="<%=pmc.getFe_nac_conyugue()%>"></td></tr>            
                    <tr><td>Tipo Documento:</td><td>
                            <select name="TIPO_DOC_ID"  class="text-box" required="">
                                <%if(pmc.getTi_doc_id().trim().equals("1")){%>
                                <option value="1" selected="">DNI</option>
                                <option value="2">Pasaporte</option>
                                <%}else if(pmc.getTi_doc_id().trim().equals("2")){%>
                                <option value="1">DNI</option>
                                <option value="2" selected="">Pasaporte</option>
                                <%}%>
                            </select>
                    <tr><td>Nro de Documento:</td><td><input type="text" name="NRO_DOC" class="text-box" required="" maxlength="10" value="<%= pmc.getNu_doc()%>"></td></tr>           
                    <tr><td>Inscripcion Vigente en Essalud:</td><td>
                            <select name="INSCRIPCION_VIG_ESSALUD"   class="text-box" required="">
                                <%if(pmc.getLi_inscripcion_vig_essalud().trim().equals("1")){%>
                                <option value="1" selected="">Si</option>
                                <option value="0">No</option>
                                <%}else if(pmc.getLi_inscripcion_vig_essalud().trim().equals("0")){%>
                                <option value="1">Si</option>
                                <option value="0" selected="">No</option>
                                <%}%>
                            </select>
                        </td></tr>
                    
                </table>
            </div>
                            <%}%>
            <div>
                <table class="table">
                    <input type="hidden" name="idtr"  value="<%=request.getParameter("idtr")%>" class="text-box" >  
                    <input type="hidden" name="opc" value="MODIFICAR PMC">
                    <tr><td><input type="submit" class="submit" value="Modificar"></td></tr>

                </table>
            </div>
        </form></center><br><br>
</body>
</html>
<%} else {
        out.print("<script> window.parent.location.href = '/TALENTO_HUMANO/';</script>");
    }
%>
