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
import pe.edu.upeu.application.dao.FuncionDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;

/**
 *
 * @author joserodrigo
 */
public class CFuncion extends HttpServlet {

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
        InterfaceFuncionDAO f = new FuncionDAO();
        InterfacePuestoDAO p = new PuestoDAO();
        /* TODO output your page here. You may use following sample code. */
        try {
            if (opc.equals("princpal_funcion")) {
                response.sendRedirect("Vista/Funciones/Priv_Funciones.jsp");
            }
            if (opc.equals("Listar")) {
                getServletContext().setAttribute("Listar_funciones", f.Listar_funciones());
                response.sendRedirect("Vista/Funciones/List_Funciones.jsp");
            }
            if (opc.equals("listar_x_puesto")) {
                String id_pu = request.getParameter("id_puesto");
                List<Map<String, ?>> list = f.Listar_fun_x_pu(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("otorgar_funciones")) {
                getServletContext().setAttribute("List_Puesto", p.List_Puesto());
                getServletContext().setAttribute("Listar_funciones", f.Listar_funciones());
                response.sendRedirect("Vista/Funciones/Otorgar_funciones.jsp");
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
