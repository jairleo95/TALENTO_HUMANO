/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.user;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.RolDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRolDAO;

/**
 *
 * @author joserodrigo
 */
@WebServlet(name = "CRoles", urlPatterns = {"/Roles"})
public class CRoles extends HttpServlet {

    InterfaceRolDAO rol = new RolDAO();

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
        String iduser = (String) sesion.getAttribute("IDUSER");

        try {
            if (opc.equals("mat_rol")) {
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if (opc.equals("Listar_Rol")) {
                List<Map<String, ?>> list = rol.List_rol();
                rpta.put("rpta", "1");
                rpta.put("data", list);
            }
            if (opc.equals("Modificar_Rol")) {
                String idrol = request.getParameter("idrol");
                sesion.setAttribute("Listar_Rol_id", rol.Listar_Rol_id(idrol));
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Mod_Rol.jsp");
            }
            if (opc.equals("Modificar")) {
                String idrol = request.getParameter("id_rol");
                String no_rol = request.getParameter("Nombre_Rol");
                String Es_rol = request.getParameter("Es_rol");
                rol.Mod_Rol(idrol, no_rol, Es_rol);
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if (opc.equals("Activar_Rol")) {
                String idrol = request.getParameter("idrol");
                rol.Activar_Roles(idrol);
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if (opc.equals("Desactivar_Rol")) {
                String idrol = request.getParameter("idrol");
                rol.Desactivar_Roles(idrol);
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            if (opc.equals("Eliminar_Rol")) {
                String idrol = request.getParameter("idrol");
                rol.Desactivar_Roles(idrol);
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/List_Roles.jsp");
            }
            if (opc.equals("REGISTRAR")) {
                String no_rol = request.getParameter("NOMBRE");
                String ESTADO = request.getParameter("ESTADO");
                if (ESTADO == null) {
                    ESTADO = "0";
                    rol.INSERT_ROLES(no_rol, ESTADO);
                } else {
                    rol.INSERT_ROLES(no_rol, ESTADO);
                }
                out.print(request.getParameter("ESTADO"));
                sesion.setAttribute("List_Rol", rol.List_Rol());
                response.sendRedirect("Vista/Usuario/Rol_Privilegio/Reg_Roles.jsp");
            }
            rpta.put("status", true);
        } catch (Exception e) {

            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
            rpta.put("status", false);
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
