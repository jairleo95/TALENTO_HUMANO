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
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.PrivilegioDAO;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao_imp.InterfacePrivilegioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;

/**
 *
 * @author joserodrigo
 */
public class CPrivilegio extends HttpServlet {
InterfaceRolDAO rol=new RolDAO();
    InterfacePrivilegioDAO priv=new PrivilegioDAO();
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
        try {
             String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        
            if(opc.equals("Listar_Rol")){
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
                
            }
            if(opc.equals("Modificar_Rol")){
                String idrol=request.getParameter("idrol");
                getServletContext().setAttribute("Listar_Rol_id", rol.Listar_Rol_id(idrol));
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Rol.jsp");
                
            }
            if(opc.equals("Modificar")){
                String idrol=request.getParameter("id_rol");
                String no_rol=request.getParameter("Nombre_Rol");
                String Es_rol=request.getParameter("Es_rol");
                rol.Mod_Rol(idrol, no_rol, Es_rol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
                
            }
            if(opc.equals("Desactivar_Rol")){
                String idrol=request.getParameter("idrol");
                rol.Desactivar_Roles(idrol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
            }
            if(opc.equals("Activar_Rol")){
                String idrol=request.getParameter("idrol");
                rol.Activar_Roles(idrol);
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
            }
            if(opc.equals("Listar_Privilegio")){
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
            }
            if(opc.equals("Desactivar_Priv")){
                String idrol=request.getParameter("id_priv");
                priv.Desactivar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
               
            }
            if(opc.equals("Eliminar_Priv")){
                String idrol=request.getParameter("id_priv");
                priv.Eliminar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
               
            }
            if(opc.equals("Activar_Priv")){
                String idrol=request.getParameter("id_priv");
                priv.Activar_Privilegio(idrol);
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
               
            }
            if(opc.equals("modificar_Priv1")){
                String idpriv=request.getParameter("id_priv");
                getServletContext().setAttribute("List_Pri_Id",priv.List_Pri_Id(idpriv));
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Privilegio.jsp");
            }
            if(opc.equals("modificar_Priv2")){
                String id_priv=request.getParameter("Id_priv");
                String No_Link=request.getParameter("No_Link");
                String Es_priv=request.getParameter("Es_Privilegio");
                priv.Mod_Priv(id_priv, No_Link, Es_priv);
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Privilegios.jsp");
            }
            if(opc.equals("Registrar")){
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegios.jsp");
            }
            if(opc.equals("REGISTRAR PRIVILEGIO")){
                String no_link=request.getParameter("No_Link");
                String di_url=request.getParameter("Di_url");
                String es_privilegio=request.getParameter("Es_privilegio");
                String Ic_Link=request.getParameter("Ic_Link");
                out.print(no_link+" "+di_url+" "+es_privilegio+" "+Ic_Link);
                priv.Insert_Privilegio(no_link, di_url, es_privilegio, Ic_Link);
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Privilegios.jsp");
            }
            if(opc.equals("Otorgar")){
                getServletContext().setAttribute("List_Rol", rol.List_Rol());
                getServletContext().setAttribute("List_Privilegio",priv.List_Privilegio());
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Otorgar_Privilegio.jsp");
            }
            if(opc.equals("Listar_PR_ROL")){
                getServletContext().setAttribute("List_Pr_Rol", priv.List_Pr_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Priv_Rol.jsp");
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
