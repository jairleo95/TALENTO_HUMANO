/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;

/**
 *
 * @author joserodrigo
 */
public class CUsuario extends HttpServlet {
    InterfaceUsuarioDAO usu=new UsuarioDAO();
    InterfaceEmpleadoDAO emp=new EmpleadoDAO();
    InterfaceRolDAO rol=new RolDAO();
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
        String opc=request.getParameter("opc");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            if("Reg_Usuario".equals(opc)){
                getServletContext().setAttribute("List_Usuario",usu.List_Usuario());
                getServletContext().setAttribute("Listar_Emp",emp.Listar_Emp());
                getServletContext().setAttribute("List_Rol",rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
            }
            if("Registrar Usuario".equals(opc)){
                String id_empleado=request.getParameter("IDEMPLEADO");
                String id_rol=request.getParameter("IDROLES");
                String no_usuario=request.getParameter("USUARIO");
                String no_pw=request.getParameter("CLAVE");
                String Estado="1";
                usu.Insert_usuario(no_usuario, no_pw, id_empleado, id_rol, Estado);
                getServletContext().setAttribute("List_Usuario_var", usu.List_Usuario_var());
                response.sendRedirect("Vista/Usuario/Reg_Usuario.jsp");
            }
            if("list".equals(opc)){
                getServletContext().setAttribute("List_Usuario_var", usu.List_Usuario_var());
                response.sendRedirect("Vista/Usuario/List_Usuario.jsp");
            }
            
        } finally {
            out.close();
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
