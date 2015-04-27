/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.Reporte_HistorialDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceReporte_HistorialDAO;

/**
 *
 * @author Andres
 */
@WebServlet(name = "CReporte_Historial", urlPatterns = {"/RHistorial"})
public class CReporte_Historial extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String id_user = (String) sesion.getAttribute("IDUSER");
        InterfaceReporte_HistorialDAO re = new Reporte_HistorialDAO();
        InterfaceListaDAO li = new ListaDAO();
        try {
            if (opc.equals("hist_tra")) {
                String pagina = "Vista/Reportes/Trabajador/Historial.jsp";
                response.sendRedirect(pagina);
            }
            if (opc.equals("list_mod_fecha")) {
                String FE_INICIO = request.getParameter("fe_inicio");
                String FE_FIN = request.getParameter("fe_fin");
                List<Map<String, ?>> list = re.Listar_Tra_Fecha(FE_INICIO, FE_FIN);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("mod_tra")) {
                String ID_TRABAJADOR = request.getParameter("idtr");
                response.sendRedirect("Vista/Reportes/Trabajador/detalleHistorial.jsp?idtr=" + ID_TRABAJADOR);
            }
            if (opc.equals("list_mod_tra")) {
                String ID_TRABAJADOR = request.getParameter("idtr");
                System.out.println(ID_TRABAJADOR);
                List<Map<String, ?>> list = re.Listar_Mod_Tra(ID_TRABAJADOR);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("hist_es_civil")) {
                getServletContext().setAttribute("List_Estado_Civil", li.List_Estado_Civil());
                response.sendRedirect("Vista/Reportes/Trabajador/Historial_Est_Civil.jsp");
            }
            if (opc.equals("list_hist_es_civil")) {
                String FE_INICIO = request.getParameter("fe_inicio");
                String FE_FIN = request.getParameter("fe_fin");
                List<Map<String, ?>> list = re.Listar_His_Estado_Civil(FE_INICIO, FE_FIN);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if(opc.equals("val_reg_ec")){
            }
            if (opc.equals("Filtro_hijo")) {
                String FE_INICIO = request.getParameter("fe_inicio");
                String FE_FIN = request.getParameter("fe_fin");
                String tipo = request.getParameter("tipo");
                List<Map<String, ?>> lista = re.List_historial_modf_hijo(FE_INICIO, FE_FIN, tipo);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Fe_Modif_Hijo")) {
                String id = request.getParameter("hijo");
                List<Map<String, ?>> lista = re.list_fecha_modif(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Comparar_dato_Hijo")) {
                String id = request.getParameter("id");
                String fecha1 = request.getParameter("fecha1");
                String fecha2 = request.getParameter("fecha2");
                List<Map<String, ?>> lista = re.Lista_campos_modif(fecha1, fecha2, id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("list_hist_fecha")) {
                String fe_modif = request.getParameter("fe_modif");
                String idtra = request.getParameter("idtra");
                List<Map<String, ?>> lista = re.Listar_hist_fecha(fe_modif, idtra);
                String[] r = re.decode((String) lista.get(60).get("det"));
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
                rpta.put("ipp", r);
            }
            if (opc.equals("list_actual")) {
                String idtra = request.getParameter("idtra");
                List<Map<String, ?>> lista = re.Listar_dat_actual(idtra);
                String[] r = re.decode((String) lista.get(60).get("det"));
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
                rpta.put("ipp", r);
            }
            if (opc.equals("Comparar_hijo")) {
                String id_trabajador = request.getParameter("idtr");
                String id_hijo = request.getParameter("idh");
                String fecha_default = request.getParameter("fecha_default");
                response.sendRedirect("Vista/Reportes/Hijo/Detalle_Comparacion.jsp?idtr=" + id_trabajador + "&idh=" + id_hijo + "&fecha_default=" + fecha_default);
            }
            if (opc.equals("Listar_hijo_trabajador")) {
                String id_trabajador = request.getParameter("idtr");
                List<Map<String, ?>> lista = re.list_hijo_trabajdor(id_trabajador);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Procesar_datos_hijos")) {
                String es_fecha = request.getParameter("es_fecha");
                String fecha = request.getParameter("fecha");
                String idh = request.getParameter("idh");
                re.Procesar_historial_hijo(idh, es_fecha, fecha);
                rpta.put("rpta", "1");
            }

        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
