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
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author joserodrigo
 */
public class CImpresion_Masiva extends HttpServlet {

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
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        PrintWriter out = response.getWriter();
        try{
            if(opc.equals("filtrar")){
                String del=request.getParameter("del");
                String al=request.getParameter("al");
                String nom_ape=request.getParameter("nom_ape");
                String direccion=request.getParameter("direccion");
                String departamento=request.getParameter("departamento");
                String area=request.getParameter("area");
                String seccion=request.getParameter("seccion");
                String puesto=request.getParameter("puesto");
                String fec_i=request.getParameter("fec_i");
                String fec_f=request.getParameter("fec_f");
                String sueldo=request.getParameter("sueldo");
                //List<Map<String, ?>> lista = dep.Listar_dep_id(id_dir);
                
            }
        }catch(Exception e){
        }
        Gson gson =new Gson();
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
