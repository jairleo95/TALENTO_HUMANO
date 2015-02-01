<%-- 
    Document   : demo
    Created on : 14-nov-2014, 9:31:58
    Author     : ALFA 3
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Lista docentes</h1>
        <input  type="text" value="" id="sem"/>
        <button class="listar">Buscar</button>
        <span id="cargador">Cargando...</span>
        <ul id="listaDoc" style="display:block;">
        </ul>

        <script type="text/javascript" src="js/JQuery/jQuery.js" ></script>
        <script>

            (function ($) {
                $(document).ready(function () {
                    $('#cargador').show();

                    var url = 'http://localhost/demo/data.php';

                    $(".listar").click(function () {

                        $.post(url, "semestre="+$("#sem").val(), function (data) {
                            $('#cargador').hide();
                            $('#listaDoc').show();
                            $.each(data, function (i, campo) {
                                $('#listaDoc').append('<li><strong>' + campo.dni + '</strong> - ' + campo.nombre + '</li>');
                            });
                        });
                    });



                });
            })(jQuery);

        </script>
        
        <%
        
        out.print("SELECT f.de_pasos, "
                    + "  f.nu_pasos "
                    + "FROM "
                    + "  (SELECT p.id_pasos, "
                    + "    p.id_proceso, "
                    + "    rp.id_detalle_req_proceso, "
                    + "    p.de_pasos, "
                    + "    p.nu_pasos, "
                    + "    p.co_pasos, "
                    + "    pro.no_proceso, "
                    + "    rp.id_direccion, "
                    + "    rp.id_departamento, "
                    + "    rp.id_requerimiento "
                    + "  FROM rhtc_pasos p , "
                    + "    rhtv_proceso pro, "
                    + "    rhtr_detalle_req_proceso rp "
                    + "  WHERE pro.id_proceso = p.id_proceso "
                    + "  AND rp.id_proceso    = pro.id_proceso "
                    + "  AND rp.ES_REQ_PROCESO='1' "
                    + "  AND p.ES_PASOS       ='1' "
                    + "  ) f "
                    + "LEFT OUTER JOIN "
                    + "  (SELECT pu.NO_PUESTO, "
                    + "    du.NO_USUARIO, "
                    + "    a.co_pasos, "
                    + "    a.DE_PASOS, "
                    + "    a.es_autorizacion, "
                    + "    a.fe_creacion, "
                    + "    a.id_autorizacion, "
                    + "    a.id_departamento, "
                    + "    a.id_detalle_pasos, "
                    + "    a.id_detalle_req_proceso, "
                    + "    a.id_dgp, "
                    + "    a.id_direccion, "
                    + "    a.id_pasos, "
                    + "    a.id_proceso, "
                    + "    a.id_puesto, "
                    + "    a.id_requerimiento, "
                    + "    a.no_proceso, "
                    + "    a.nu_pasos, "
                    + "    a.us_creacion , "
                    + "    dt.AP_PATERNO, "
                    + "    dt.AP_MATERNO, "
                    + "    dt.NO_TRABAJADOR, "
                    + "    dgp.CA_SUELDO, "
                    + "    du.AP_PATERNO    AS us_ap_p, "
                    + "    du.AP_MATERNO    AS us_ap_mat , "
                    + "    du.NO_TRABAJADOR AS us_no_tr, "
                    + "    du.NO_PUESTO     AS us_no_puesto, "
                    + "    du.NO_AREA       AS us_no_area, "
                    + "    du.NO_DEP        AS us_no_dep "
                    + "  FROM "
                    + "    (SELECT a.id_detalle_req_proceso, "
                    + "      a.id_dgp, "
                    + "      a.id_pasos, "
                    + "      d.id_proceso, "
                    + "      d.id_detalle_pasos , "
                    + "      d.DE_PASOS, "
                    + "      d.NU_PASOS, "
                    + "      d.CO_PASOS , "
                    + "      d.no_proceso , "
                    + "      d.id_puesto, "
                    + "      d.id_direccion, "
                    + "      d.id_departamento , "
                    + "      d.id_requerimiento , "
                    + "      a.id_autorizacion, "
                    + "      a.fe_creacion, "
                    + "      a.es_autorizacion, "
                    + "      a.us_creacion "
                    + "    FROM "
                    + "      (SELECT * FROM rhvd_req_paso_pu "
                    + "      ) d "
                    + "    LEFT OUTER JOIN rhtv_autorizacion a "
                    + "    ON ( a.id_pasos             =d.id_pasos "
                    + "    AND d.id_pasos              =a.id_pasos "
                    + "    AND d.id_puesto             =a.id_puesto "
                    + "    AND d.id_detalle_req_proceso=a.id_detalle_req_proceso) "
                    + "    ) a , "
                    + "    rhtm_dgp dgp , "
                    + "    rhtm_trabajador dt , "
                    + "    rhvd_usuario du , "
                    + "    rhvd_puesto_direccion pu "
                    + "  WHERE dgp.id_dgp                 =a.id_dgp "
                    + "  AND dt.id_trabajador             = dgp.id_trabajador "
                    + "  AND du.id_usuario                =a.us_creacion "
                    + "  AND dgp.id_puesto                =pu.id_puesto "
                    + "  AND dgp.id_dgp                   ='"  + "' "
                    + "  ) s ON ( s.ID_DETALLE_REQ_PROCESO=f.ID_DETALLE_REQ_PROCESO "
                    + "AND f.id_pasos                     =s.id_pasos ) "
                    + "WHERE f.ID_DETALLE_REQ_PROCESO     ='" +  "' "
                    + "ORDER BY to_number(SUBSTR(f.nu_pasos,2,LENGTH(f.nu_pasos))) ASC");%>
    </body>
</html>
