<%-- 
    Document   : Mod_Asp_Religioso
    Created on : 28/01/2015, 02:18:06 PM
    Author     : Alex
--%>

<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form align="center" action="../../../trabajador"  >
            <fieldset>
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);
                %>   
                <div class="row" >
                    <section class="col col-2">
                        <label class="select" id="titu">Religion:
                            <select name="RELIGION" required="" class="input-group-sm" id="reli">
                                <option value="" disabled="" >[SELECCIONE]</option> 
                                <%if (trb.getLi_religion().equals("1")) {%>
                                <option value="1" selected="">Adventida</option> 
                                <option value="2" >Catlico</option> 
                                <option value="3" >Ótros</option> 
                                <%}
                                    if (trb.getLi_religion().equals("2")) {%>
                                <option value="1" >Adventida</option> 
                                <option value="2" selected="">Catlico</option> 
                                <option value="3" >Ótros</option> 
                                <%}
                                    if (trb.getLi_religion().equals("3")) {%>
                                <option value="1" >Adventida</option> 
                                <option value="2" >Catlico</option> 
                                <option value="3" selected="">Ótros</option> 
                                <%}%>   
                            </select> 
                        </label>
                    </section>
                    <section class="col col-2">
                        <label class="input" id="titu">Nombre de la Iglesia:
                            <input type="text" name="IGLESIA" class="input-group-sm" value="<%=trb.getNo_iglesia()%>" id="igle">
                        </label>
                    </section>
                    <section class="col col-2">
                        <label class="input" id="titu">Cargo en la Iglesia:
                            <input type="text" name="CARGO" class="input-group-sm" value="<%=trb.getDe_cargo()%>">
                        </label>
                    </section>
                    <section class="col col-2">
                        <label class="select" id="titu">Autoridad:
                            <select name="AUTORIDAD" class="input-group-sm">
                                <option value="" >[SELECCIONE]</option> 
                                <%if (trb.getLi_autoridad().trim().equals("1")) {%>
                                <option value="1" selected="">Pastor</option> 
                                <option value="2" >Primer Anciano</option> 
                                <option value="3" >Sacerdote</option> 
                                <%}
                                    if (trb.getLi_autoridad().trim().equals("2")) {%>
                                <option value="1" >Pastor</option> 
                                <option value="2" selected="">Primer Anciano</option> 
                                <option value="3" >Sacerdote</option> 
                                <%}
                                    if (trb.getLi_autoridad().trim().equals("3")) {%>
                                <option value="1" >Pastor</option> 
                                <option value="2" >Primer Anciano</option> 
                                <option value="3" selected="">Sacerdote</option> 
                                <%}%>
                            </select> 
                        </label>
                    </section>
                    <section class="col col-2">
                        <label class="input" id="titu">Nombre y Apellidos (Autoridad)
                            <input type="text" name="AUT_APELLIDOSNOMBRES" class="input-group-sm" value="<%=trb.getNo_ap_autoridad()%>">
                        </label>
                    </section>
                    <section class="col col-2">
                        <label class="input" id="titu">Telefono/Celular
                            <input  class="input-group-sm" type="text" name="AUT_CELULAR" value="<%=trb.getCl_autoridad()%>">
                        </label>
                    </section>
                        <%String idtr = request.getParameter("idtr");%>
                        <input type="text" value="<%=idtr %>" name="idtr">
                        <input type="submit" value="Modificar" name="opc">
              
                </div>
                         <%}%>
            </fieldset>
        </form>
    </body>
    <script>
        $(document).ready(
                function() {
                    $("#reli").change(
                            function() {
                                if ($("#reli").val() == "1") {
                                    $("#igle").attr("required", "required")
                                } else {

                                    $("#igle").removeAttr("required");
                                }

                            }
                    );

                });

    </script>
</html>
