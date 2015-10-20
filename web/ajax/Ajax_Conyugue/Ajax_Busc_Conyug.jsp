<%-- 
    Document   : Ajax_Busc_Conyug
    Created on : 08/10/2014, 01:14:31 PM
    Author     : Alex
--%>

<%@page import="pe.edu.upeu.application.factory.ConexionBD"%>
<%@page import="com.google.gson.Gson"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="pe.edu.upeu.application.factory.FactoryConnectionDB"%>



<%
    response.setContentType("application/json");
    response.setCharacterEncoding("UTF-8");

    HttpSession sesion = request.getSession(true);
    ConexionBD cnn;
    String Accion = request.getParameter("action");

    // if (Accion.equals("listar")) {
    if (true) {
        
        String nom=request.getParameter("nom");
        String dni = request.getParameter("dni");
        String ape_pa = request.getParameter("ap_pa");
        String ape_ma = request.getParameter("ap_ma");
        
        if (true) {
            String sql = "select  ID_CONYUGUE,ID_EMPLEADO,NO_TRABAJADOR, AP_MATERNO,AP_PATERNO, NU_DOC,TI_DOC, FE_NAC as fe_nac, id_trabajador  from RHVD_LIST_EMPLEADO WHERE NO_TRABAJADOR IS NOT NULL   ";
            nom = nom.toUpperCase();
            dni = dni.toUpperCase();
            ape_pa = ape_pa.toUpperCase();
            ape_ma = ape_ma.toUpperCase();

            sql += (!"".equals(nom)) ? " AND upper(NO_TRABAJADOR) like '%" +nom.trim()+ "%'" : "";
            sql += (!"".equals(ape_ma)) ? " AND upper(AP_MATERNO) like '%" +ape_ma.trim()+ "%'" : "";
            sql += (!"".equals(ape_pa)) ? " AND upper(AP_PATERNO) like '%" +ape_pa.trim()+ "%'" : "";
            sql += (!"".equals(dni)) ? " AND upper(NU_DOC) like '%" +dni.trim()+ "%'" : "";
            
            cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

            ResultSet rs = cnn.query(sql);

            Map<String, Object> rpta = new HashMap<String, Object>();

            List<Map<String, ?>> lista = new ArrayList<Map<String, ?>>();

            while (rs.next()) {
                Map<String, Object> rec = new HashMap<String, Object>();
                
                rec.put("NOM", rs.getString("NO_TRABAJADOR"));
                rec.put("AP_MA", rs.getString("AP_MATERNO"));
                rec.put("AP_PA", rs.getString("AP_PATERNO"));
                rec.put("NU_DOC", rs.getString("NU_DOC"));
                rec.put("ID_TRAB", rs.getString("id_trabajador"));
                rec.put("TIPO", rs.getString("TI_DOC"));
                rec.put("NAC", rs.getString("FE_NAC"));
                rec.put("ID_C", rs.getString("ID_CONYUGUE"));
                
                
                //rec.put("id_dgp", rs.getString("id_dgp"));
                //rec.put("id_trabajador", rs.getString("id_trabajador"));
                //rec.put("req", rs.getString("requerimiento"));
                //rec.put("fecha_contratacion", rs.getString("fecha_creacion"));
                //rec.put("no_area", rs.getString("no_area"));
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
