<%@page import="pe.edu.upeu.application.dao.ListaDAO"%>
<%@page import="pe.edu.upeu.application.dao_imp.InterfaceListaDAO"%>
<%@page import="pe.edu.upeu.application.model.Carrera"%>
<%@page import="pe.edu.upeu.application.model.Situacion_Educativa"%>
<%@page import="pe.edu.upeu.application.model.Nacionalidad"%>
<%@page import="pe.edu.upeu.application.model.Puesto"%>
<%@page import="pe.edu.upeu.application.model.Seccion"%>
<%@page import="pe.edu.upeu.application.model.Area"%>
<%@page import="pe.edu.upeu.application.model.Departamento"%>
<%@page import="pe.edu.upeu.application.model.Datos_Generales"%>
<jsp:useBean id="Reporte_Datos_Generales" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Departamento_Lima" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Area_Lima" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="LISTA_RH_SECCION_LIMA" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Puesto_lima" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Nacionalidad" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_SituacionEducativa" scope="application" class="java.util.ArrayList"/>
<jsp:useBean id="List_Carrera" scope="application" class="java.util.ArrayList"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>


        <meta http-equiv="content-type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/ico" href="http://www.sprymedia.co.uk/media/images/favicon.ico">

        <title>Using DataTable with column filter plugin - Place filter in the external form</title>
        <style type="text/css" title="currentStyle">
            @import "../../js/DataTables-1.10.4/media/css/demo_page.css";
            @import "../../js/DataTables-1.10.4/media/css/demo_table.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui.css";
            @import "../../js/DataTables-1.10.4/media/css/jquery-ui-1.7.2.custom.css";
        </style>

        <script src="../../js/DataTables-1.10.4/media/js/jquery-1.4.4.min.js" type="text/javascript"></script>
        <script src="../../js/DataTables-1.10.4/media/js/jquery.dataTables.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="../../js/DataTables-1.10.4/media/css/site.css?_=c3204084d1e8a5f5906d625e768e171a">
        <link rel="stylesheet" type="text/css" href="../../js/DataTables-1.10.4/extensions/TableTools/css/dataTables.tableTools.css">
        <script type="text/javascript" src="../../js/DataTables-1.10.4/media/js/site.js_=5276b3f2bd86cf7d24e4cbe150c3a87e"></script>

        <script type="text/javascript" charset="utf-8">
            $(document).ready(function() {

                TableTools.DEFAULTS.aButtons = ["copy", "xls", "print"];
                $('#example').dataTable({
                    "dom": 'T<"clear">lfrtip', "tableTools": {
                        "sSwfPath": "../../js/DataTables-1.10.4/media/js/copy_csv_xls.swf"
                    }
                });
                $('#example').dataTable().columnFilter({aoColumns: [
                {type: "select", values: ["A", "B", "C"], sSelector: "#co_aps"},
                {type: "select", values: [<%for (int i = 0; i < List_Departamento_Lima.size(); i++) {
                            Departamento d = new Departamento();
                            d = (Departamento) List_Departamento_Lima.get(i);%>
                "<%=d.getNo_dep().trim()%>",<%}%>], sSelector: "#Departamento"},
                {type: "select", values: [<%for (int i = 0; i < List_Area_Lima.size(); i++) {
                        Area a = new Area();
                        a = (Area) List_Area_Lima.get(i);%>
                "<%=a.getNo_area().trim()%>",<%}%>], sSelector: "#Area"},
                {type: "select", values: [<%for (int i = 0; i < LISTA_RH_SECCION_LIMA.size(); i++) {
                        Seccion s = new Seccion();
                        s = (Seccion) LISTA_RH_SECCION_LIMA.get(i);%>
                "<%=s.getNo_seccion().trim()%>",<%}%>], sSelector: "#Seccion"},
                {type: "select", values: [<%for (int i = 0; i < List_Puesto_lima.size(); i++) {
                        Puesto p = new Puesto();
                        p = (Puesto) List_Puesto_lima.get(i);%>
                "<%=p.getNo_puesto().trim()%>",<%}%>], sSelector: "#Puesto"},
                {type: "select", values: ["A", "B"], sSelector: "#Paterno"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Materno"},
                {type: "select", values: [ "A", "B", "C"], sSelector: "#Nombres"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Nombres_com"},
                {type: "select", values: ["Masculino", "Femenino"], sSelector: "#Sexo"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#fecha_nac"},
                {type: "select", values: [<%for (int i = 0; i < List_Nacionalidad.size(); i++) {
                        Nacionalidad n = new Nacionalidad();
                        n = (Nacionalidad) List_Nacionalidad.get(i);%>
                "<%=n.getNo_nacionalidad().trim()%>",<%}%>], sSelector: "#Nacionalidad"},
                {type: "select", values: ["Soltero(a)", "Casado(a)", "Divorsiado(a)", "Viudo(a)", "Separado(a)", "Conviviente"], sSelector: "#Estado_c"},
                {type: "select", values:  ["A", "B", "C"], sSelector: "#Grupo_san"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Factor_rh"},
                {type: "select", values: ["AFP", "ONP", "Ninguno", "Sin Régimen Provisional(jubilado, cesante)", "No registrado"], sSelector: "#Sistema_p"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#NO_AFP"},
                {type: "select", values: [<%for (int i = 0; i < List_SituacionEducativa.size(); i++) {
                        Situacion_Educativa se = new Situacion_Educativa();
                        se = (Situacion_Educativa) List_SituacionEducativa.get(i);%>
                "<%=se.getNo_s_educativa().trim()%>",<%}%>], sSelector: "#Situacion_EDUC"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#ESTUDIO_en"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Regimen_s_e"},
                {type:  "select", values: ["A", "B", "C"], sSelector: "#Tipo_ins"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Institucion_e"},
                {type: "select", values: [<%for (int i = 0; i < List_Carrera.size(); i++) {
                        Carrera ca = new Carrera();
                        ca = (Carrera) List_Carrera.get(i);%>
                "<%=ca.getNo_carrera().trim()%>",<%}%>"No completo Carrera"], sSelector: "#Carrera"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Año_egre"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Tipo_h_p"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Domicilio_ac"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Distrito"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Provincia"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Departamento_u"},
                {type: "select", values: ["Adventista", "Catolico", "Otros"], sSelector: "#Religion_u"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Iglesia"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Cargo"},
                {type: "select", values: ["A", "B", "C"], sSelector: "#Autoridad"},
                {type: "date-range", sSelector: "#platformsFilter"},
                {type:"select", values:["A", "B", "C"], sSelector: "#DIR"}

                ]}
                );
            });
        </script>
    </head>




    <body id="dt_example">
    
    <H1 align="center">FILTRAR DATOS</H1>
    <table cellspacing="0" cellpadding="0" border="0" class="display" ID="Table1">
        <tbody>
            <tr id="filter_global" class="a"><td align="center">Codigo Aps</td><td align="center" id="co_aps"></td></tr>
            <tr id="filter_col1"><td align="center">Departamento</td><td align="center" id="Departamento"></td></tr>
            <tr id="filter_col2"><td align="center">Area</td><td align="center" id="Area"></td></tr>
            <tr id="filter_col3"><td align="center">Seccion</td><td align="center" id="Seccion"></td></tr>
            <tr id="filter_col4"><td align="center">Puesto</td><td align="center" id="Puesto"></td></tr>
            <tr id="filter_col1" class="ap"><td align="center">Ape. Paterno</td><td align="center" id="Paterno"></td></tr>
            <tr id="filter_global" class="apm"><td align="center">Ape. Materno</td><td align="center" id="Materno"></td></tr></tr>
            <tr id="filter_global" class="nom"><td align="center">Nombres</td><td align="center" id="Nombres"></td></tr>
            <tr id="filter_global" class="nc"><td align="center">Nombres y Apellidos</td><td align="center" id="Nombres_com"></td></tr>
            <tr id="filter_col1"><td align="center">Sexo</td><td align="center" id="Sexo"></td></tr>
            <tr id="filter_col2" class="fnac"><td align="center">fecha de Nac.</td><td align="center" id="fecha_nac"></td></tr>
            <tr id="filter_col3"><td align="center">Nacionalidad</td><td align="center" id="Nacionalidad"></td></tr>
            <tr id="filter_col4"><td align="center">Estado civil</td><td align="center" id="Estado_c"></td></tr>
            <tr id="filter_col1" class="gs"><td align="center">Grupo Sanguineo</td><td align="center" id="Grupo_san"></td></tr>
            <tr id="filter_global" class="fr"><td align="center">Factor RH</td><td align="center" id="Factor_rh"></td></tr>
            <tr id="filter_global"><td align="center">Sistema Pencionario</td><td align="center" id="Sistema_p"></td></tr>
            <tr id="filter_global" class="naf"><td align="center">NOMBRE AFP</td><td align="center" id="NO_AFP"></td></tr>
            <tr id="filter_col1" ><td align="center">Situacion educativa</td><td align="center" id="Situacion_EDUC"></td></tr>
            <tr id="filter_col2" class="eins"><td align="center">ESTUDIO EN INST</td><td align="center" id="ESTUDIO_en"></td></tr>
            <tr id="filter_col3" class="rse"><td align="center">Regimen Situacion Educativa</td><td align="center" id="Regimen_s_e"></td></tr>
            <tr id="filter_col4" class="ti"><td align="center">Tipo Intitucion</td><td align="center" id="Tipo_ins"></td></tr>
            <tr id="filter_col1" class="ie"><td align="center">Institucion Educativa</td><td align="center" id="Institucion_e"></td></tr>
            <tr id="filter_global" ><td align="center">Carrera</td><td align="center" id="Carrera"></td></tr></tr>
            <tr id="filter_global" class="an"><td align="center">Año de Egreso</td><td align="center" id="Año_egre"></td></tr>
            <tr id="filter_global" class="tih"><td align="center">Tipo Hora Pago</td><td align="center" id="Tipo_h_p"></td></tr>
            <tr id="filter_col1" class="doa"><td align="center">Domicilio Actual</td><td align="center" id="Domicilio_ac"></td></tr>
            <tr id="filter_col2" class="dis"><td align="center">Distrito</td><td align="center" id="Distrito"></td></tr>
            <tr id="filter_col3" class="pro"><td align="center">Provincia</td><td align="center" id="Provincia"></td></tr>
            <tr id="filter_col4" class="dep"><td align="center">Departamento Ubic</td><td align="center" id="Departamento_u"></td></tr>
            <tr id="filter_col1" ><td align="center">Religion</td><td align="center" id="Religion_u"></td></tr>
            <tr id="filter_global" class="igl"><td align="center">Iglesia</td><td align="center" id="Iglesia"></td></tr>
            <tr id="filter_global" class="car"><td align="center">Cargo</td><td align="center" id="Cargo"></td></tr>
            <tr id="filter_global" class="aut"><td align="center">Autoridad</td><td align="center" id="Autoridad"></td></tr>
            <tr id="filter_col35" ><td align="center">FECHA CREACION</td><td align="center" id="platformsFilter"></td></tr>
            <tr id="filter_col35" class="SDUR"><td align="center">DIRECCION</td><td align="center" id="DIR"></td></tr>
        </tbody>
    </table>


    <div id="demo">

        <table cellpadding="0" cellspacing="0" border="0" class="display" id="example">
            <thead>
                <tr>
                    <th>Codigo Aps</th>
                    <th>Departamento</th>
                    <th>Area</th>
                    <th>Seccion</th>
                    <th>Puesto</th>
                    <th>Ape. Paterno</th>
                    <th>Ape. Materno</th>
                    <th>Nombres</th>
                    <th>Nombres y Apellidos</th>
                    <th>Sexo</th>
                    <th>fecha de Nac.</th>
                    <th>Nacionalidad</th>
                    <th>Estado civil</th>
                    <th>Grupo Sanguineo</th>
                    <th>Factor RH</th>
                    <th>Sistema Pencionario</th>
                    <th>NO_AFP</th>
                    <th>Situacion educativa</th>
                    <th>ESTUDIO EN INST</th>
                    <th>Regimen Situacion Educativa</th>
                    <th>Tipo Intitucion</th>
                    <th>Institucion Educativa</th>
                    <th>Carrera</th>
                    <th>Año de Egreso</th>
                    <th>Tipo Hora Pago</th>
                    <th>Domicilio Actual</th>
                    <th>Distrito</th>
                    <th>Provincia</th>
                    <th>Departamento Ubic</th>
                    <th>Religion</th>
                    <th>Iglesia</th>
                    <th>Cargo</th>
                    <th>Autoridad</th>
                    <th>FE_CREACION</th>
                    <th >direccion</th>
                </tr>
            </thead>
            <tfoot>
                <tr  id="aaa">
                    <th>Codigo Aps</th>
                    <th>Departamento</th>
                    <th>Area</th>
                    <th>Seccion</th>
                    <th>Puesto</th>
                    <th>Ape. Paterno</th>
                    <th>Ape. Materno</th>
                    <th>Nombres</th>
                    <th>Nombres y Apellidos</th>
                    <th>Sexo</th>
                    <th>fecha de Nac.</th>
                    <th>Nacionalidad</th>
                    <th>Estado civil</th>
                    <th>Grupo Sanguineo</th>
                    <th>Factor RH</th>
                    <th>Sistema Pencionario</th>
                    <th>NO_AFP</th>
                    <th>Situacion educativa</th>
                    <th>ESTUDIO EN INST</th>
                    <th>Regimen Situacion Educativa</th>
                    <th>Tipo Intitucion</th>
                    <th>Institucion Educativa</th>
                    <th>Carrera</th>
                    <th>Año de Egreso</th>
                    <th>Tipo Hora Pago</th>
                    <th>Domicilio Actual</th>
                    <th>Distrito</th>
                    <th>Provincia</th>
                    <th>Departamento Ubic</th>
                    <th>Religion</th>
                    <th>Iglesia</th>
                    <th>Cargo</th>
                    <th>Autoridad</th>
                    <th>FE_CREACION(mm/dd/año)</th>
                    <th >direccion</th>
                </tr>
            <script>
                $(document).ready(function() {
                    $(".a").hide();
                    $(".ap").hide();
                    $(".apm").hide();
                    $(".nom").hide();
                    $(".nc").hide();
                    $(".fnac").hide();
                    $(".gs").hide();
                    $(".fr").hide();
                    $(".naf").hide();
                    $(".eins").hide();
                    $(".rse").hide();
                    $(".ti").hide();
                    $(".ie").hide();
                    $(".an").hide();
                    $(".tih").hide();
                    $(".doa").hide();
                    $(".dis").hide();
                    $(".pro").hide();
                    $(".dep").hide();
                    $(".igl").hide();
                    $(".car").hide();
                    $(".aut").hide();
                    $(".SDUR").hide();
                    $("#aaa").hide();
                    ("#aaa").click(function() {
                        alert();
                        var a = ("#footer");
                        a.empty();
                       
                    });
                });
            </script>
            </tfoot>
            <tbody>
                <%for (int i = 0; i < Reporte_Datos_Generales.size(); i++) {
                        Datos_Generales d = new Datos_Generales();
                        d = (Datos_Generales) Reporte_Datos_Generales.get(i);%>
                <tr class="odd_gradeX" >
                    <td class="read_only"><%if (d.getCo_aps() != null) {
                            out.print(d.getCo_aps());
                        } else {
                            out.print("-");
                        }%></td>
                    <td><%=d.getNo_dep()%></td>
                    <td><%=d.getNo_area()%></td>
                    <td class="center"><%=d.getNo_seccion()%></td>
                    <td class="center"><%=d.getNo_puesto()%></td>
                    <td class="center"><%=d.getAp_paterno()%></td>
                    <td class="center"><%=d.getAp_materno()%></td>
                    <td class="center"><%=d.getNo_trabajador()%></td>
                    <td class="center"><%=d.getNo_completo()%></td>
                    <td class="center"><%if (d.getEs_sexo().trim() != null) {
                            if (d.getEs_sexo().equals("M")) {
                                out.print("Masculino");
                            }
                            if (d.getEs_sexo().equals("F")) {
                                out.print("Femenino");
                            }
                        }
                        %></td>
                    <td class="center"><%=d.getFe_nac()%></td>
                    <td class="center"><%=d.getNo_nacionalidad()%></td>
                    <td class="center"><%if (d.getEs_civil().trim() != null) {
                            if (d.getEs_civil().trim().equals("1")) {
                                out.print("Soltero(a)");
                            }
                            if (d.getEs_civil().trim().equals("2")) {
                                out.print("Casado(a)");
                            }
                            if (d.getEs_civil().trim().equals("3")) {
                                out.print("Divorciado(a)");
                            }
                            if (d.getEs_civil().trim().equals("4")) {
                                out.print("Viudo(a)");
                            }
                            if (d.getEs_civil().trim().equals("5")) {
                                out.print("Separado(a)");
                            }
                            if (d.getEs_civil().trim().equals("6")) {
                                out.print("Conviviente");
                            }
                        } else {
                            out.print("No registrado");
                        }%></td>
                    <td class="center"><%
                        if (d.getLi_grupo_sanguineo().trim() != null) {
                            if (d.getLi_grupo_sanguineo().trim().equals("1")) {
                                out.print("A");
                            }
                            if (d.getLi_grupo_sanguineo().trim().equals("2")) {
                                out.print("B");
                            }
                            if (d.getLi_grupo_sanguineo().trim().equals("3")) {
                                out.print("AB");
                            }
                            if (d.getLi_grupo_sanguineo().trim().equals("4")) {
                                out.print("0");
                            }
                        } else {
                            out.print("No registrado");
                        }%></td>
                    <td class="center"><%
                        if (d.getEs_factor_rh().trim() != null) {
                            if (d.getEs_factor_rh().trim().equals("1")) {
                                out.print("POSITIVO");
                            }
                            if (d.getEs_factor_rh().trim().equals("2")) {
                                out.print("NEGATIVO");
                            }
                        } else {
                            out.print("No registrado");
                        }%></td>
                    <td class="center"><%
                        if (d.getCo_sistema_pensionario().trim() != null) {
                            if (d.getCo_sistema_pensionario().trim().equals("1")) {
                                out.print("AFP");
                            }
                            if (d.getCo_sistema_pensionario().trim().equals("2")) {
                                out.print("ONP");
                            }
                            if (d.getCo_sistema_pensionario().trim().equals("3")) {
                                out.print("Ninguno");
                            }
                            if (d.getCo_sistema_pensionario().trim().equals("4")) {
                                out.print("Sin Régimen Provisional(jubilado, cesante)");
                            }
                        } else {
                            out.print("No registrado");
                        }%></td>
                    <td class="center"><%if (d.getId_no_afp().trim() != null) {
                            if (d.getId_no_afp().trim().equals("1")) {
                                out.print("Integra");
                            }
                            if (d.getId_no_afp().trim().equals("2")) {
                                out.print("Prima");
                            }
                            if (d.getId_no_afp().trim().equals("3")) {
                                out.print("Profuturo");
                            }
                            if (d.getId_no_afp().trim().equals("4")) {
                                out.print("Horizonte");
                            }
                            if (d.getId_no_afp().trim().equals("5")) {
                                out.print("Habitat");
                            }
                            if (d.getId_no_afp().trim().equals("6")) {
                                out.print("Ninguno");
                            }
                        } else {
                            out.print("Esta en otro Sist. Pensionario");
                        }%></td>
                    <td class="center"><%=d.getNo_s_educativa()%></td>
                    <td class="center"><% if (d.getEs_inst_educ_peru() != null) {
                            if (d.getEs_inst_educ_peru().trim().equals("1")) {
                                out.print("SI");
                            }
                            if (d.getEs_inst_educ_peru().trim().equals("2")) {
                                out.print("NO");
                            }
                        }%></td>
                    <td class="center"><%=d.getLi_reg_inst_educativa()%></td>
                    <td class="center"><%if (d.getNo_tipo_institucion() != null) {
                            out.print(d.getNo_tipo_institucion().trim());
                        } else {
                            out.print("-");
                        }%></td>
                    <td class="center"><%
                        if (d.getNo_universidad() != null) {
                            out.print(d.getNo_universidad().trim());
                        } else {
                            out.print("No completo Estudios");
                        }%></td>
                    <td class="center"><%if (d.getNo_carrera() != null) {
                            out.print(d.getNo_carrera());
                        } else {
                            out.print("No completo Carrera");
                        }%></td>
                    <td class="center"><%=d.getDe_anno_egreso()%></td>
                    <td class="center"><%=d.getCa_tipo_hora_pago_refeerencial()%></td>
                    <td class="center"><%
                        String Direccion = "";
                        InterfaceListaDAO l = new ListaDAO();
                        for (int b = 0; b < l.List_Dom_D1_Id().size(); b++) {
                            if (d.getLi_di_dom_a_d1().trim().equals(b + 1 + "")) {
                                Direccion += l.List_Dom_D1_Id().get(b);
                            }
                        }
                        if (d.getLi_di_dom_a_d3().trim().equals("1")) {
                            if (d.getDi_dom_a_d2() != null) {
                                Direccion += " " + d.getDi_dom_a_d2().trim() + " Numero";
                            } else {
                                Direccion += " " + "(-)" + " Numero";
                            }
                        }
                        if (d.getLi_di_dom_a_d3().trim().equals("2")) {
                            if (d.getDi_dom_a_d2() != null) {
                                Direccion += " " + d.getDi_dom_a_d2().trim() + " Lote";
                            } else {
                                Direccion += " " + "(-)" + " Lote";
                            }
                        }
                        if (d.getLi_di_dom_a_d3().trim().equals("3")) {
                            if (d.getDi_dom_a_d2() != null) {
                                Direccion += " " + d.getDi_dom_a_d2().trim() + " S/N";
                            } else {
                                Direccion += " " + "(-)" + " S/N";
                            }
                        }
                        for (int c = 0; c < l.List_Dom_D5_Id().size(); c++) {
                            if (d.getLi_di_dom_a_d5().trim().equals(c + 1 + "")) {
                                String d4 = "";
                                if (d.getDi_dom_a_d4() != null) {
                                    d4 = d.getDi_dom_a_d4().trim();
                                } else {
                                    d4 = "(-)";
                                }
                                Direccion += " " + d4 + " " + l.List_Dom_D5_Id().get(c);
                            }
                        }
                        String d6 = "";
                        if (d.getDi_dom_a_d6() != null) {
                            d6 = d.getDi_dom_a_d6().trim();
                        } else {
                            d6 = "(-)";
                        }
                        Direccion += " " + d6;
                        out.print(Direccion);%></td>
                    <td class="center"><%=d.getNo_distrito()%></td>
                    <td class="center"><%=d.getNo_provincia()%></td>
                    <td class="center"><%=d.getNo_departamento()%></td>
                    <td class="center"><%if (d.getLi_religion() != null) {
                            if (d.getLi_religion().trim().equals("1")) {
                                out.print("Adventista");
                            }
                            if (d.getLi_religion().trim().equals("2")) {
                                out.print("Catolico");
                            }
                            if (d.getLi_religion().trim().equals("3")) {
                                out.print("Otros");
                            }
                        } else {
                            out.print("No ingresado");
                        }%></td>
                    <td class="center"><%
                        if (d.getNo_iglesia() != null) {

                            out.print(d.getNo_iglesia().trim());

                        } else {
                            out.print("No ingresado");
                        }%></td>
                    <td class="center"><%
                        if (d.getDe_cargo() != null) {

                            out.print(d.getDe_cargo().trim());

                        } else {
                            out.print("No ingresado");
                        }%></td>
                    <td class="center"><%
                        if (d.getLi_autoridad() != null) {
                            if (d.getLi_religion().trim().equals("1")) {
                                out.print("Pastor");
                            }
                            if (d.getLi_religion().trim().equals("2")) {
                                out.print("Primer Anciano");
                            }
                            if (d.getLi_religion().trim().equals("3")) {
                                out.print("Sacerdote");
                            }

                        } else {
                            out.print("No ingresado");
                        }%></td>
                    <td class="center"><%
                        String fecha = d.getFe_creacion_contrato();
                        String fechasus = "";
                        if (fecha != "" & fecha != null) {
                            /*if (System.getProperty("sun.desktop").trim().equals("windows")) {
                             String f[] = fecha.split("/");
                             fechasus = f[0] + " de " + f[1] + " del " + f[2];
                             } else {*/
                            String f[] = fecha.split("/");
                            fechasus = f[1] + "/" + f[0] + "/" + f[2];
                            out.print(fechasus);
                            /* }*/
                        } else {
                            fechasus = "NO TIENE";
                            out.print(fechasus);
                        }%></td>
                    <td  class="co_dir center"><%=d.getNo_direccion()%></td>
                </tr>
                <%}%>
            </tbody>
        </table>
        <div id="footer" style="text-align:center;">
            <span style="font-size:10px;">
                DataTables Column Filter Add-on &copy; Jovan Popovic 2011.<br>
                DataTables designed and created by <a href="http://www.sprymedia.co.uk">Allan Jardine</a> &copy; 2007-2011<br>
            </span>
        </div>
            <button id="aaa">asasa</button>
    </div>
            <script>
                $(document).ready(function() {
                    ("#aaa").click(function() {
                        alert();
                       
                    });
                });
            </script>
    <script type="text/javascript">
        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-365466-5']);
        _gaq.push(['_trackPageview']);

        (function() {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();
    </script>
</body>
<script type="text/javascript" language="javascript" src="../../js/DataTables-1.10.4/extensions/TableTools/js/dataTables.tableTools.js"></script>
<script src="../../js/DataTables-1.10.4/media/js/jquery.dataTables.columnFilter.js" type="text/javascript"></script>
<script src="../../js/DataTables-1.10.4/media/js/jquery-ui.js" type="text/javascript"></script>





</html>