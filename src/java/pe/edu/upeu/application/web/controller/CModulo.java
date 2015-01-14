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
import pe.edu.upeu.application.model.Privilegio;

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
        InterfaceModuloDAO modu = new ModuloDAO();
        InterfacePrivilegioDAO prv = new PrivilegioDAO();
        try {
            String opc = request.getParameter("opc");
            if (opc.equals("lis_mod")) {
                List<Map<String, ?>> list = modu.List_Modulo();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("lis_req")) {
                List<Map<String, ?>> list = prv.List_Priv();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("lis_pr_mod")) {
                List<Map<String, ?>> list = prv.List_Priv_Mod();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("lis_pr_mod_x_id")) {
                String id_mod = request.getParameter("id_modulo");
                List<Map<String, ?>> list = prv.List_Priv_Mod_x_id(id_mod);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("activar_pri_mod")) {
                String id_priv = request.getParameter("id_pr");
                prv.Activar_Privilegio(id_priv);
                response.sendRedirect("");

            }
            if (opc.equals("desactivar_pri_mod")) {
                String id_priv = request.getParameter("id_privilegio");
                prv.Desactivar_Privilegio(id_priv);
            }
            if (opc.equals("Registrar")) {
                String id_priv = request.getParameter("id_privi");
                String id_mod = request.getParameter("id_modulo");
               // prv.List_Pri_Id(id_priv);
                String no_link="";
                for (int i = 0; i < prv.List_Pri_Id(id_priv).size(); i++) {
                    Privilegio x = new Privilegio();
                    x = (Privilegio) prv.List_Pri_Id(id_priv).get(i);
                    no_link = x.getNo_link();
                    String di_url = x.getDi_url();
                    String ic_link = x.getIc_link();
                    String es_priv = x.getEs_privilegio();
                    prv.Insert_Privilegio(no_link, di_url, es_priv, ic_link,id_mod);
                }
                 //rpta.put("rpta",no_link);
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
