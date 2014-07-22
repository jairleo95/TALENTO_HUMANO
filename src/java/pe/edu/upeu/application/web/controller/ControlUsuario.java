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
                    sesion.setAttribute("IDUSER", rs.getString("ID_USUARIO"));
                    sesion.setAttribute("USER", rs.getString("NO_USUARIO"));
                    sesion.setAttribute("IDPER", rs.getString("ID_EMPLEADO"));
                    sesion.setAttribute("IDROL", rs.getString("ID_ROL"));
                    sesion.setAttribute("CL", rs.getString("PW_USUARIO"));
                    sesion.setAttribute("PUESTO_ID", rs.getString("ID_PUESTO"));
                    sesion.setAttribute("AREA_ID", rs.getString("ID_AREA"));
                    sesion.setAttribute("AREA", rs.getString("NO_AREA"));
                    sesion.setAttribute("DEPARTAMENTO", rs.getString("NO_DEP"));
                    sesion.setAttribute("DEPARTAMENTO_ID", rs.getString("ID_DEPARTAMENTO"));
                    sesion.setAttribute("PUESTO", rs.getString("NO_PUESTO"));
                    response.sendRedirect("Principal.jsp");
                }else  {
                    response.sendRedirect("index.jsp");
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
