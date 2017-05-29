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

        String iddep = request.getParameter("dep");
        String nom_ape = request.getParameter("nom_ape");
        String puesto = request.getParameter("puesto");
        String area = request.getParameter("area");
        String sueldo = request.getParameter("sueldo");
        String seccion = request.getParameter("seccion");
        String proceso = request.getParameter("`proceso");
        String req = request.getParameter("motivo");
        String iduser = (String) sesion.getAttribute("IDUSUARIO");
       String del = DateFormat.toFormat1(request.getParameter("del").trim());
        String al =  DateFormat.toFormat1(request.getParameter("al").trim());
        String order = request.getParameter("orderby");
        if (true) {

            String sql = "select  *  from RHVD_FILTRO_DGP_AUTORIZADO WHERE FECHA_CREACION IS NOT NULL  ";

            nom_ape = nom_ape.toUpperCase();
            
            sueldo = sueldo.toUpperCase();
            seccion = seccion.toUpperCase();
            puesto = puesto.toUpperCase();

            sql += (!"".equals(nom_ape)) ? " AND  upper(NOMBRE_P)  like '%" + nom_ape + "%'" : "";
            sql += (!"".equals(sueldo)) ? "  and upper(ca_sueldo) like '%" + sueldo + "%'" : "";
            sql += (!"".equals(puesto)) ? "  and upper(no_puesto) like '%" + puesto + "%'" : "";
//             sql +=(!"".equals(area))?"  and id_area='"+area.trim()+"'":"";
            sql += (!"".equals(seccion)) ? "  and upper(no_seccion) like'%" + seccion + "%'" : "";
            //sql += (!"".equals(iduser)) ? "  and us_creacion='" + iduser.trim() + "'" : "";
            sql += (!"0".equals(req)) ? "  and id_requerimiento='" + req.trim() + "'" : "";
            // sql +=(!"".equals(proceso))?"  and dp.id_proceso='"+proceso+"'":"";
            sql +=(!"".equals(del) && !"".equals(al))?" AND FE_CREACION BETWEEN '"+del+"' and '"+al+"'":"";
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
                rec.put("id_dgp", rs.getString("id_dgp"));
                rec.put("nombre_p", rs.getString("nombre_p"));
                rec.put("id_trabajador", rs.getString("id_trabajador"));
                rec.put("no_seccion", rs.getString("no_seccion"));
                rec.put("no_puesto", rs.getString("no_puesto"));
                rec.put("dep", rs.getString("no_dep"));
                rec.put("req", rs.getString("requerimiento"));
                rec.put("fecha_contratacion", rs.getString("fecha_creacion"));
                rec.put("no_area", rs.getString("no_area"));
                rec.put("ca_sueldo", rs.getString("ca_sueldo"));
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