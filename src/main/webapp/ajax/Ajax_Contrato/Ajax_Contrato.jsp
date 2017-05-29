<%@page import="pe.edu.upeu.application.util.DateFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="pe.edu.upeu.application.model.V_Filtro_Dgp_Aut"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>
<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>

<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    HttpSession sesion = request.getSession(true);
    ConexionBD cnn;
    String Accion = request.getParameter("action");

    // if (Accion.equals("listar")) {
    if (true) {
     String nom_ape = request.getParameter("nom_ape");
        String puesto = request.getParameter("puesto");
        String area = request.getParameter("area");
        String sueldo = request.getParameter("sueldo");
        String seccion = request.getParameter("seccion");
       String del = request.getParameter("del").trim();
        String al =  request.getParameter("al").trim();
        String iduser = (String) sesion.getAttribute("IDUSUARIO");
        String fecha_ini = request.getParameter("fec_i").trim();
        String fecha_fin = request.getParameter("fec_f").trim();
        String order = request.getParameter("orderby");
        if (true) {

            String sql = "select  *  from RHVD_FILTRO_CONTRATO_TERMINADO WHERE FE_CREACION IS NOT NULL ";

            nom_ape = nom_ape.toUpperCase();
            sueldo = sueldo.toUpperCase();
            seccion = seccion.toUpperCase();
            puesto = puesto.toUpperCase();

            sql += (!"".equals(nom_ape)) ? " AND  upper(NOM_APE)  like '%" + nom_ape + "%'" : "";
            sql += (!"".equals(sueldo)) ? "  and upper(CA_SUELDO_TOTAL) like '%" + sueldo + "%'" : "";
            //sql += (!"".equals(puesto)) ? "  and ID_PUESTO ='"+puesto+"'" : "";
//            sql +=(!"".equals(area))?"  and id_area='"+area.trim()+"'":"";
            sql += (!"".equals(seccion)) ? "  and upper(no_seccion) like'%" + seccion + "%'" : "";
            //sql += (!"".equals(iduser)) ? "  and us_creacion='" + iduser.trim() + "'" : "";
            // sql +=(!"".equals(proceso))?"  and dp.id_proceso='"+proceso+"'":"";
            sql += (!"".equals(DateFormat.toFormat1(del.trim())) && !"".equals(DateFormat.toFormat1(al.trim()))) ? " AND FE_CREACION BETWEEN '" +
                    DateFormat.toFormat1(del.trim())+ "' and '" + DateFormat.toFormat1(al.trim())+ "'" : "";
            /* sql +=(!"".equals(iddep))?"  and du.id_departamento='"+iddep+"'":"";
            
             if(!"".equals(order)){
             sql +="ORDER BY A.ID_AUTORIZACION ,"+order;
             }*/
            
            cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

            ResultSet rs = cnn.query(sql);

            Map<String, Object> rpta = new HashMap<String, Object>();

            List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();

            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                rec.put("nom_ape", rs.getString("nom_ape"));
                rec.put("id_contrato", rs.getString("ID_DCONTRATO"));
               rec.put("no_puesto", rs.getString("no_puesto"));
                rec.put("no_area", rs.getString("no_area"));
                 rec.put("no_seccion", rs.getString("no_seccion"));
               rec.put("fe_desde", rs.getString("fe_desde"));
                rec.put("fe_hasta", rs.getString("fe_hasta"));
                rec.put("ca_sueldo", rs.getString("ca_sueldo_total"));
                rec.put("id_trabajador", rs.getString("id_trabajador"));
                rec.put("fecha_contratacion", rs.getString("fe_creacion"));
                lista.add(rec);

            }
            rpta.put("lista", lista);
            Gson gson = new Gson();
            out.print(gson.toJson(rpta));
            out.flush();
            out.close();

        }

    }
%>