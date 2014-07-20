/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.web.controller;

import pe.edu.upeu.application.model.ModeloUsuario;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Alfa.sistemas
 */
@WebServlet(name = "ControlUsuario", urlPatterns = {"/ControlUsuario"})
public class ControlUsuario extends HttpServlet {
    
    Connection cx=null;
    ModeloUsuario mu= new ModeloUsuario();

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opc= request.getParameter("opc");
             
       // out.println("1");
        
        if (opc.equals("ingresar")) {
            String Usuario = request.getParameter("username");
            String Clave = request.getParameter("clave");
       
            
        ResultSet rs = mu.ValidarUsuario(Usuario, Clave);
      
          
                if (rs.next()) {
                   HttpSession sesion =  request.getSession(true);
                    sesion.setAttribute("IDUSER", rs.getString("IDUSUARIO"));
                    sesion.setAttribute("IDPER", rs.getString("IDEMPLEADO"));
                    sesion.setAttribute("IDROL", rs.getString("IDROLES"));
                    sesion.setAttribute("CL", rs.getString("CLAVE"));
                    sesion.setAttribute("PUESTO_ID", rs.getString("PUESTO_ID"));
                    sesion.setAttribute("AREA_ID", rs.getString("AREA_ID"));
                    sesion.setAttribute("AREA", rs.getString("AREA"));
                    sesion.setAttribute("DEPARTAMENTO", rs.getString("DEPARTAMENTO"));
                    sesion.setAttribute("DEPARTAMENTO_ID", rs.getString("DEPARTAMENTO_ID"));
                    sesion.setAttribute("PUESTO", rs.getString("PUESTO"));
                    response.sendRedirect("Vista/Principal.jsp");
                }else  {
                    response.sendRedirect("index.jsp");
                }
            
            
            
        
        try {
         
            
        } finally {
            out.close();
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ControlUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(ControlUsuario.class.getName()).log(Level.SEVERE, null, ex);
        }
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
