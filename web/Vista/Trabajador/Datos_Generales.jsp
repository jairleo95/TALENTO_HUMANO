<%@page import="pe.edu.upeu.application.model.V_Ficha_Trab_Num_C"%>
<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<jsp:useBean id="ListaridTrabajador" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">

        <title>Datos generales</title>
        <link type="text/css" rel="stylesheet" href="../../css/Css_Detalle/CSS_DETALLE.css">
    </head>

    <body>
        <form method="post" action="">
            <table class="tables">

                <%for (int index = 0; index < ListaridTrabajador.size(); index++) {
                        V_Ficha_Trab_Num_C trb = new V_Ficha_Trab_Num_C();
                        trb = (V_Ficha_Trab_Num_C) ListaridTrabajador.get(index);

                %>           
                <tr><td class="text-info">Nacionalidad:</td><td><%=trb.getNo_nacionalidad().trim()%></td></tr>

                <tr><td  class="text-info">Distrito:</td><td><%=trb.getNo_distrito()%></td></tr>
                <tr><td  class="text-info">Tipo Documento:</td><td>
                        <%                             
                        InterfaceListaDAO list = new ListaDAO();
                        for (int t = 0; t < list.List_Doc().size(); t++) {
                                    if((t+1+"").equals(trb.getTi_doc())){
                                        out.println(list.List_Doc().get(t));
                                    }  
                            }
                        %>
                    </td></tr>
                <tr><td  class="text-info">Numero Documento:</td><td><%=trb.getNu_doc()%></td></tr>
                <tr><td  class="text-info">Estado Civil:</td><td><? 
                        $list_e_c =$mod_list->LISTA_ESTADO_CIVIL();

                        for ($r = 0; $r < count($list_e_c); $r++) {
                        if ($list[$index][6]==($r+1)) {
                        echo $list_e_c[$r][0];
                        }
                        }
                        ?></td></tr>

                <tr><td  class="text-info">Grupo Sanguíneo:</td><td><? 
                        $list_g_s=$mod_list->LISTA_GS();
                        for ($n = 0; $n < count($list_g_s); $n++) {
                        if ($list[$index][24]==($n+1)) {
                        echo $list_g_s[$n][0];
                        }
                        }
                        ?></td></tr>
                <tr><td  class="text-info">Factor RH:</td><td><?
                        if ($list[$index][36]==1) {
                        echo 'Positivo';
                        }
                        if ($list[$index][36]==2) {
                        echo 'Negativo';
                        }
                        ?></td></tr>

                <tr><td  class="text-info">Telefono:</td><td><%=trb.getTe_trabajador()%></td></tr>
                <tr><td  class="text-info">Celular:</td><td><%=trb.getCl_tra()%></td></tr>
                <tr><td  class="text-info">Correo:</td><td><%=trb.getDi_correo_personal()%></td></tr>



                <tr><td   class="text-info">Sistema Pensionario:</td><td><?
                        $list_sp=$mod_list->LISTA_SP();
                        for ($d = 0; $d < count($list_sp); $d++) {
                        if ($list[$index][16]==($d+1)) {
                        echo $list_sp[$d][0];
                        }
                        }
                        ?></td></tr>
                <tr><td  class="text-info">Nombre AFP:</td><td><? 
                        $list_afp=$mod_list->LISTA_NOM_AFP();
                        for ($w = 0; $w < count($list_afp); $w++) {
                        if ($list[$index][32]==($w+1)) {
                        echo $list_afp[$w][0];
                        }    
                        }?></td></tr>
                <tr><td  class="text-info">Afiliado a EsSalud-vida:</td><td><? 
                        if ($list[$index][33]==1) {
                        echo 'Si';
                        }
                        if ($list[$index][33]==2) {
                        echo 'No';
                        }
                        ?></td></tr>
                <tr><td  class="text-info">Tipo Trabajador:</td><td><? 
                        if ($list[$index][34]=="T") {
                        echo 'Trabajador'; 
                        }
                        if ($list[$index][34]=="A") {
                        echo 'Alumno'; 
                        }
                        ?></td></tr>

                <tr><td colspan="2"></td><td><input class="btn btn-success"  type="submit" value="Editar"></td></tr>
                        <%}%>
            </table>
        </form>

    </body>
</html>
