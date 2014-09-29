<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css"> 
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title></title>

    </head>
    <body>


        <form>
            <table class="table table">
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>   
                <tr><td class="text-info">Situacion Educativa:</td><td><%                    out.println(trb.getLi_nivel_educativo());
                        %></td></tr>
                <tr><td class="text-info">Grado Academico:</td><td><%
                    for (int x = 0; x < l.List_Grado_Academico().size(); x++) {
                        if (trb.getLi_grado_academico().equals(x + 1 + "")) {
                            out.println(l.List_Grado_Academico().get(x));
                        }
                    }

                        %></td></tr>
                <tr><td class="text-info">Carrera:</td><td><%=trb.getNo_carrera()%></td></tr>
                <tr><td class="text-info">Titulo Profesional:</td><td><%
                    if (trb.getLi_titulo_profesional().trim().equals("1")) {
                        out.println("Ninguno");
                    }
                    if (trb.getLi_titulo_profesional().trim().equals("2")) {
                        out.println("Titulo Profesional");
                    }
                    if (trb.getLi_titulo_profesional().trim().equals("3")) {
                        out.println("Titulo Tecnico");
                    }
                        %></td></tr>
                <tr><td class="text-info">Centro de Estudios:</td><td><%=trb.getNo_universidad()%></td></tr>
                <tr><td class="text-info">Tipo de Hora Referencial:</td><td><%=trb.getCa_tipo_hora_pago_refeerencial()%></td></tr>
                <tr><td class="text-info">Otros Estudios:</td><td><%=trb.getCm_otros_estudios()%></td></tr>
                <tr><td  class="text-info">Correo Institucional:</td><td><%=trb.getDi_correo_inst()%></td></tr>
                <%}%>
                <tr><td colspan="2"></td><td><input class=""  type="submit" value="Editar"></td></tr>
            </table>
        </form>

    </body>
</html>
