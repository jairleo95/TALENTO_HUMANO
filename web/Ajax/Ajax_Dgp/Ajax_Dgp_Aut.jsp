<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.model.V_Filtro_Dgp_Aut"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>
<%@page import="pe.edu.upeu.application.web.controller.CConversion"%>

<%

    HttpSession sesion = request.getSession(true);
    CConversion c = new CConversion();
    ConexionBD cnn;
    String Accion = request.getParameter("action");

    if (Accion.equals("listar")) {

        String iddep = request.getParameter("dep");
        String nom_ape = request.getParameter("nom_ape");
        String puesto = request.getParameter("puesto");
        String area = request.getParameter("area");
        String sueldo = request.getParameter("sueldo");
        String seccion = request.getParameter("seccion");
        String proceso = request.getParameter("`proceso");
        String req = request.getParameter("motivo");
        String iduser = (String) sesion.getAttribute("IDUSUARIO");
        /*  String del = (!"".equals(request.getParameter("del"))) ? c.convertFecha(request.getParameter("del")) : "";
         String al = (!"".equals(request.getParameter("al"))) ? c.convertFecha(request.getParameter("al")) : "";*/
        String order = request.getParameter("orderby");
        if (true) {

            String sql = "select  *  from RHVD_FILTRO_DGP_AUTORIZADO";

            /*  nom_ape=nom_ape.toUpperCase();
             sueldo=sueldo.toUpperCase();
             seccion=seccion.toUpperCase();
             puesto = puesto.toUpperCase();
             */
            /* sql +=(!"".equals(nom_ape))?" and upper(tr.no_trabajador ||' '||tr.ap_paterno ||' '||tr.ap_materno)  like '%"+nom_ape+"%'":"";
             sql +=(!"".equals(sueldo))?"  and upper(dgp.ca_sueldo) like '"+sueldo+"'":"";
             sql +=(!"".equals(puesto))?"  and upper(id.no_puesto) like '%"+sueldo+"%'":"";
             sql +=(!"".equals(area))?"  and dd.id_area='"+sueldo+"'":"";
             sql +=(!"".equals(seccion))?"  and upper(dd.seccion) like'"+seccion+"'":"";
             sql +=(!"".equals(iduser))?"  and a.us_creacion='"+seccion+"'":"";
             sql +=(!"".equals(req))?"  and dgp.id_requerimiento='"+req+"'":"";
             sql +=(!"".equals(proceso))?"  and dp.id_proceso='"+proceso+"'":"";
             sql +=(!"".equals(del) && !"".equals(al))?" AND dgp.fe_creacion BETWEEN '"+del+"' and '"+al+"'":"";
             sql +=(!"".equals(iddep))?"  and du.id_departamento='"+iddep+"'":"";
            
             if(!"".equals(order)){
             sql +="ORDER BY A.ID_AUTORIZACION ,"+order;
             }*/
            cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

            ResultSet rs = cnn.query(sql);
            JSONArray list = new JSONArray();

            List<V_Filtro_Dgp_Aut> a = new ArrayList<V_Filtro_Dgp_Aut>();
            while (rs.next()) {
                V_Filtro_Dgp_Aut f = new V_Filtro_Dgp_Aut();
                f.setId_dgp(rs.getString("id_dgp"));
                f.setNombre_p(rs.getString("nombre_p"));
                f.setId_trabajador(rs.getString("id_trabajador"));
                f.setNo_seccion(rs.getString("no_seccion"));
                f.setNo_puesto(rs.getString("no_puesto"));
                f.setDep(rs.getString("dep"));
                f.setRequerimiento(rs.getString("requerimiento"));
                f.setFecha_creacion(rs.getString("fecha_creacion"));
                f.setNo_area(rs.getString("no_area"));
                f.setCa_sueldo(rs.getString("ca_sueldo"));
                list.add(f);
            }

            String jsonText = null;

            jsonText = list.toString();

            out.print(jsonText);

        }

    }


%>