<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<%@page import="pe.edu.upeu.application.model.Trabajador"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css"> 
        <title></title>

    </head>
    <body>


        <form>
            <table class="tables">
                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        Trabajador trb = new Trabajador();
                        trb = (Trabajador) ListaridTrabajador.get(index);

                %>   
                <tr><td class="text-info">Nivel Educativo:</td><td><? 
                        $list_ne=$mod_list->LISTA_NIVEL_EDUCATIVO();
                        for ($h = 0; $h < count($list_ne); $h++) {
                        if ($list[$index][17]==($h+1)) {
                        echo $list_ne[$h][0];
                        }

                        }

                        ?></td></tr>
                <tr><td class="text-info">Grado Academico:</td><td><? 
                        $list_ga=$mod_list->LISTA_GRADO_ACADEMICO();
                        for ($l = 0; $l < count($list_ga); $l++) {
                        if ($list[$index][18]==($l+1)) {
                        echo $list_ga[$l][0];
                        }
                        }

                        ?></td></tr>
                <tr><td class="text-info">Carrera:</td><td><? 
                        $list_carr=$mod_list->LISTA_CARRERA();
                        for ($g = 0; $g < count($list_carr); $g++) {
                        if ($list[$index][20]==$list_carr[$g][0]) {
                        echo $list_carr[$g][1];
                        }
                        }

                        ?></td></tr>
                <tr><td class="text-info">Titulo Profesional:</td><td><?
                        if ($list[$index][19]==1) {
                        echo 'Ninguno';       
                        }
                        if ($list[$index][19]==2) {
                        echo 'Titulo Profesional';       
                        }

                        if ($list[$index][19]==3) {
                        echo 'Titulo Tecnico';       
                        };

                        ?></td></tr>
                <tr><td class="text-info">Centro de Estudios:</td><td><? 
                        $list_ce=$mod_list->LISTA_UNIVERSIDAD();
                        for ($e = 0; $e < count($list_ce); $e++) {
                        if ($list[$index][21]==$list_ce[$e][0]) {
                        echo $list_ce[$e][1];
                        }
                        }

                        ?></td></tr>
                <tr><td class="text-info">Tipo de Hora Referencial:</td><td><%=trb.getCa_tipo_hora_pago_refeerencial()%></td></tr>
                <tr><td class="text-info">Otros Estudios:</td><td><%=trb.getCm_otros_estudios()%></td></tr>
                <tr><td  class="text-info">Correo Institucional:</td><td><%=trb.getDi_correo_inst()%></td></tr>





                <%}%>
                <tr><td colspan="2"></td><td><input class=""  type="submit" value="Editar"></td></tr>
            </table>
        </form>

    </body>
</html>
