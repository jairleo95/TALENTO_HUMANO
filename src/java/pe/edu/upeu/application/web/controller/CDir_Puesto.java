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
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.DepartamentoDao;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.SeccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;

/**
 *
 * @author joserodrigo
 */
@WebServlet(name = "CDir_Puesto", urlPatterns = {"/Direccion_Puesto"})
public class CDir_Puesto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceDepartamentoDAO dep = new DepartamentoDao();
    InterfaceAreaDAO are = new AreaDAO();
    InterfaceSeccionDAO sec = new SeccionDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        PrintWriter out = response.getWriter();
        try {
            if (opc.equals("Listar")) {
                List<Map<String, ?>> lista = dep.List_departamento_2();
                //List<Map<String, ?>> lista2 = dep.dep_id(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
                //rpta.put("lista2", lista2);
            }
            if (opc.equals("Listar_area")) {
                String id_dep = request.getParameter("id_dep");
                List<Map<String, ?>> lista = are.List_area_id_json(id_dep);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_dir")) {
                String id_dep = request.getParameter("id_dep");
                List<Map<String, ?>> lista = are.List_area_id_json(id_dep);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_sec")) {
                String id_are = request.getParameter("id_are");
                List<Map<String, ?>> lista = sec.List_sec_id(id_are);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_dir_dep")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = dep.Listar_dep_id(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("selec_dep")) {
                String id_pu = request.getParameter("id_pu");
                List<Map<String, ?>> lista = dep.dep_id(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("selec_are")) {
                String id_pu = request.getParameter("id_pu");
                List<Map<String, ?>> lista = are.selec_area(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("selec_sec")) {
                String id_pu = request.getParameter("id_pu");
                List<Map<String, ?>> lista = sec.selec_sec(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }

        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.print(gson.toJson(rpta));
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
