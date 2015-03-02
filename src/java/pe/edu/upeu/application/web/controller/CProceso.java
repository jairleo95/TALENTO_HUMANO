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
import pe.edu.upeu.application.dao.ProcesoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceProcesoDAO;

/**
 *
 * @author ALFA 3
 */
@WebServlet(name = "CProceso", urlPatterns = {"/Proceso"})
public class CProceso extends HttpServlet {

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
        InterfaceProcesoDAO p = new ProcesoDAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            String opc = request.getParameter("opc");

            if (opc.equals("Mantenimiento")) {
                response.sendRedirect("Vista/Dgp/Plazo/Reg_Plazo_Dgp.jsp");

            }
            if (opc.equals("Registrar")) {

            }
            if (opc.equals("Modificar")) {

            }
            if (opc.equals("Listar")) {
                List<Map<String, ?>> lista = p.List_Proceso();
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }

            if (opc.equals("Listar_Pro_Paso_Id")) {
                String id_req = request.getParameter("id_req");
                String id_pro = request.getParameter("id_pro");
                String id_dir = request.getParameter("id_dir");
                String id_dep = request.getParameter("id_dep");
                String id_area = request.getParameter("id_area");
                String id_ti_planilla = request.getParameter("id_ti_planilla");
                List<Map<String, ?>> lista = p.List_Pro_Paso_Id(id_req, id_pro, id_dir, id_dep, id_area, id_ti_planilla);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Eliminar")) {

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
