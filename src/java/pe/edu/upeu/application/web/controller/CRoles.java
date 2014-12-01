/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.PrivilegioDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao_imp.InterfacePrivilegioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;

/**
 *
 * @author joserodrigo
 */
@WebServlet(name = "CRoles", urlPatterns = {"/Roles"})
public class CRoles extends HttpServlet {
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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        try {
            if(opc.equals("Listar_Rol")){
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if(opc.equals("Modificar_Rol")){
                String idrol=request.getParameter("idrol");
                getServletContext().setAttribute("Listar_Rol_id", rol.Listar_Rol_id(idrol));
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Rol.jsp");
            }
            if(opc.equals("Modificar")){
                String idrol=request.getParameter("id_rol");
                String no_rol=request.getParameter("Nombre_Rol");
                String Es_rol=request.getParameter("Es_rol");
                rol.Mod_Rol(idrol, no_rol, Es_rol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if(opc.equals("Activar_Rol")){
                String idrol=request.getParameter("idrol");
                rol.Activar_Roles(idrol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if(opc.equals("Desactivar_Rol")){
                String idrol=request.getParameter("idrol");
                rol.Desactivar_Roles(idrol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if(opc.equals("Eliminar_Rol")){
                String idrol=request.getParameter("idrol");
                rol.Desactivar_Roles(idrol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
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
