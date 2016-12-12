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
    String Accion = request.getParameter("action");
    ConexionBD cnn;

    // if (Accion.equals("listar")) {
    if (true) {

        String id_Moda = request.getParameter("MODALIDAD");
        /*String id_Dir = request.getParameter("DIRECCION");
        String id_Dep = request.getParameter("DEPARTAMENTO");
        String id_Area = request.getParameter("AREA");*/
        String opc = request.getParameter("opc");
        if (true) {
            if (opc.equals("submodalidad")) {
                String sql = "select  *  from RHTX_SUB_MODALIDAD ";
                sql += (!"".equals(id_Moda)) ? " where  ID_MODALIDAD='" + id_Moda.toUpperCase() + "'" : "";
            //id_Moda = id_Moda.toUpperCase();

            //sql += (!"".equals(id_Moda)) ? " where  trim(id_modalidad)='"+id_Moda.trim()+"'":" ";
            /* sql +=(!"".equals(iddep))?"  and du.id_departamento='"+iddep+"'":"";
            
                 if(!"".equals(order)){
                 sql +="ORDER BY A.ID_AUTORIZACION ,"+order;
                 }*/
                cnn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);

                ResultSet rs = cnn.query(sql);

                Map<String, Object> rpta = new HashMap<String, Object>();

                List<Map<String, ?>> lista2 = new ArrayList<Map<String, ?>>();

                while (rs.next()) {
                    Map<String, Object> rec = new HashMap<String, Object>();
                    rec.put("id_submodalidad", rs.getString("ID_SUB_MODALIDAD"));
                    rec.put("co_sub_mod", rs.getString("CO_SUB_MODALIDAD"));
                    rec.put("de_submod", rs.getString("DE_SUB_MODALIDAD"));
                    lista2.add(rec);
                }
                rpta.put("lista", lista2);
                Gson gson = new Gson();
                out.print(gson.toJson(rpta));
                out.flush();
                out.close();
            }
          

        }

    }%>