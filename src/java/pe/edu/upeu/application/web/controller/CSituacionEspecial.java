/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.SituacionEspecialDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSituacionEspecialDAO;

/**
 *
 * @author JAIR
 */
public class CSituacionEspecial extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            Map<String, Object> rpta = new HashMap<>();
            HttpSession sesion = request.getSession(true);
            String user = (String) sesion.getAttribute("IDUSER");
            String opc = request.getParameter("opc");
            InterfaceSituacionEspecialDAO s = new SituacionEspecialDAO();
            if (user != null) {
                try {
                    if (opc.equals("list")) {
                        rpta.put("lista", s.list());
                        rpta.put("status", true);
                    }

                } catch (Exception e) {
                    rpta.put("rpta", false);
                    System.out.println("1ER - ERROR " + Arrays.toString(e.getStackTrace()));
                    System.out.println("2DO - ERROR " + e.getMessage());
                    rpta.put("mensaje", e.getMessage());
                } finally {
                    Gson gson = new Gson();
                    out.print(gson.toJson(rpta));
                    out.flush();
                    out.close();
                }
            }

        }
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
