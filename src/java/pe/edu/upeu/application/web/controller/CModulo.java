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
import pe.edu.upeu.application.dao.ModuloDAO;
import pe.edu.upeu.application.dao.PrivilegioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceModuloDAO;
import pe.edu.upeu.application.dao_imp.InterfacePrivilegioDAO;

/**
 *
 * @author joserodrigo
 */
public class CModulo extends HttpServlet {

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
        InterfaceModuloDAO modu=new ModuloDAO();
        InterfacePrivilegioDAO prv=new PrivilegioDAO();
        try {
            String opc=request.getParameter("opc");
            if(opc.equals("lis_mod")){
                List<Map<String, ?>> list = modu.List_Modulo();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if(opc.equals("lis_req")){
                List<Map<String, ?>> list = prv.List_Priv();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if(opc.equals("lis_pr_mod")){
                List<Map<String, ?>> list = prv.List_Priv_Mod();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if(opc.equals("lis_pr_mod_x_id")){
                List<Map<String, ?>> list = prv.List_Priv_Mod();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
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
