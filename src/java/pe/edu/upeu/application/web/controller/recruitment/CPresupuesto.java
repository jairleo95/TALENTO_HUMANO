/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.PresupuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;

/**
 *
 * @author Leandro Burgos
 */
public class CPresupuesto extends HttpServlet {

    InterfaceDireccionDAO dO = new DireccionDAO();
    InterfacePresupuestoDAO pD = new PresupuestoDAO();
    Map<String, Object> rpta = new HashMap<>();

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
        PrintWriter out = response.getWriter();
        //int opc = Integer.parseInt(request.getParameter("opc"));
        String opc = request.getParameter("opc");
        String idArea = "";
        switch (opc) {
            case "gest":
                response.sendRedirect("Vista/Presupuesto/Gpresupuesto.jsp");
                break;
            case "list":
                rpta.put("rpta", dO.List_Direccion());
                break;
            case "reg":
                Map<String, Object> c = new HashMap<>();
                idArea = request.getParameter("idA");
                double PA = Double.parseDouble(request.getParameter("PA"));
                int NT = Integer.parseInt(request.getParameter("NT"));
                String f_inicio = request.getParameter("f_i");
                String f_fin = request.getParameter("f_fin");
                System.out.println(idArea + " " + PA + " " + NT + " " + f_inicio + " " + f_fin);
                c.put("idA", idArea);
                c.put("PA", PA);
                c.put("NT", NT);
                c.put("f_i", f_inicio);
                c.put("f_fin", f_fin);
                rpta.put("rpta", pD.Reg_PresupuestoArea(c));
                break;
            case "comp":
                idArea = request.getParameter("idArea");
                rpta.put("datos", pD.comprobar(idArea));
                break;
            case "actual":
                idArea = request.getParameter("idArea");
                rpta.put("datos", pD.dataPresupuesto(idArea));
                break;
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
