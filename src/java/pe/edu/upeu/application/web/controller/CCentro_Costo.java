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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Centro_CostoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;

/**
 *
 * @author JAIR
 */
public class CCentro_Costo extends HttpServlet {

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
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        InterfaceCentro_CostosDAO cc = new Centro_CostoDAO();
        try {
            if (opc.equals("Listar_cc")) {
                List<Map<String, ?>> list = cc.List_centro_costo(iddep);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_dir")) {
                List<Map<String, ?>> list = cc.Direccion_CC();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_dep")) {
                String id = request.getParameter("id_dir");
                List<Map<String, ?>> list = cc.Departamento_CC(id);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_CC")) {
                String id = request.getParameter("id_dep");
                List<Map<String, ?>> list = cc.Centro_Costo_Dep(id);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_centro_id")) {
                String id_dgp = request.getParameter("id_dgp");
                List<Map<String, ?>> list = cc.List_centr_id(id_dgp);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_centro_id_dgp")) {
                String id_con = request.getParameter("id_dgp");
                List<Map<String, ?>> list = cc.List_centr_iddgp(id_con);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listar_centro_id_con")) {
                String id_con = request.getParameter("id_con");
                List<Map<String, ?>> list = cc.List_centr_idcon(id_con);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Cargar_cc_DGP")) {
                String id= request.getParameter("id_c");
                List<Map<String, ?>> list = cc.Cargar_cc_dgp(id);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Eliminar_det_cc")) {
                String id_dcc= request.getParameter("id_dcc");
                cc.Eliminar_dcc(id_dcc);
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
