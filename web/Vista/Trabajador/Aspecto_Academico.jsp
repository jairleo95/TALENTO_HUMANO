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
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" media="screen" href="../../HTML_version/css/font-awesome.min.css">
        <script src=" ../../../../js1/jquery-1.11.1.min.js" type="text/javascript"></script>
        <title></title>

    </head>
    <body>


        <form align="center">
        <table class="table table-striped table-hover table-responsive">
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>   
                <tr><td class="text-info">Situacion Educativa:</td><td><%out.println(trb.getLi_nivel_educativo());
                        %></td></tr>
                <tr><td class="text-info">Grado Academico:</td><td><%
                        %></td></tr>
                <tr><td class="text-info">Carrera:</td><td><%if(trb.getNo_carrera()==null){out.print("NINGUNA");}else{out.print(trb.getNo_carrera());}%></td></tr>
                <tr><td class="text-info">Titulo Profesional:</td><td><%
                        %></td></tr>
                <tr><td class="text-info">Centro de Estudios:</td><td><%if(trb.getNo_universidad()==null){out.print("NINGUNA");}else{out.print(trb.getNo_universidad());}%></td></tr>
                <tr><td class="text-info">Tipo de Hora Referencial:</td><td><%=trb.getCa_tipo_hora_pago_refeerencial()%></td></tr>
                <tr><td class="text-info">Otros Estudios:</td><td><%if(trb.getCm_otros_estudios()==null){out.print("NINGUNA");}else{out.print(trb.getCm_otros_estudios());}%></td></tr>
                <tr><td  class="text-info">Correo Institucional:</td><td><%=trb.getDi_correo_inst()%></td></tr>
                <%}%>
                <tr><td colspan="2"><input class=""  type="submit" value="Editar"></td></tr>
            </table>
        </form>

    </body>
</html>
