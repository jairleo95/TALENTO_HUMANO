/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;
import java.util.List;
import pe.edu.upeu.application.dao.DepartamentoDao;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;

/**
 *
 * @author Andres
 */
@WebServlet(name = "CPuesto", urlPatterns = {"/Puesto"})
public class CPuesto extends HttpServlet {

    
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
        InterfaceDireccionDAO di= new DireccionDAO();
        InterfaceDepartamentoDAO de= new DepartamentoDao();
        try {
            String opc = request.getParameter("opc");
            if (opc.equals("menu")) {
                response.sendRedirect("Vista/Puesto/Menu_puesto.jsp");
            }
            //----DIRECCION
            if (opc.equals("list_direccion")) {
                List<Map<String ,?>> list= di.List_Direccion();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("editar-Direccion")) {
                String id, nombre, ncorto, estado, filial;
                id=request.getParameter("id");
                nombre=request.getParameter("nombre");
                ncorto=request.getParameter("ncorto");
                estado=request.getParameter("estado");
                filial=request.getParameter("filial");
                di.Editar_Direccion(id, nombre, ncorto, estado, filial);
            }
            if (opc.equals("crear-Direccion")) {
                String nombre, ncorto, estado, filial;
                nombre=request.getParameter("nombre");
                ncorto=request.getParameter("ncorto");
                estado=request.getParameter("estado");
                filial=request.getParameter("filial");
                di.Crear_Direccion(nombre, ncorto, estado, filial);
            }
            if (opc.equals("activar-Direccion")) {
                String id;
                id=request.getParameter("id");
                di.Activar_Direccion(id);
            }
            if (opc.equals("desactivar-Direccion")) {
                String id;
                id=request.getParameter("id");
                di.Desactivar_Direccion(id);
            }
            if (opc.equals("eliminar-Direccion")) {
                String id;
                id=request.getParameter("id");
                di.Eliminar_Direccion(id);
            }
            //--DEPARTAMENTO
            if (opc.equals("listar_dir_es")) {
                 List<Map<String ,?>> list= di.List_Direccion_estado();
                rpta.put("rpta", "1");
                rpta.put("lista", list);   
            }
            if (opc.equals("listar_dep_dir")) {
                String id=request.getParameter("id");
                 List<Map<String ,?>> list= de.Listar_dep_x_dir(id);
                rpta.put("rpta", "1");
                rpta.put("lista", list);                
            }
            if (opc.equals("editar-Dep")) {
                String id, nombre, ncorto, estado;
                id=request.getParameter("id");
                nombre=request.getParameter("nombre");
                ncorto=request.getParameter("ncorto");
                estado=request.getParameter("estado");
                de.Editar_Dep(id.trim(), nombre.trim(), ncorto.trim(), estado.trim());
            }
            if (opc.equals("crear-Dep")) {
                String nombre, ncorto, estado, idDir;
                nombre=request.getParameter("nombre");
                ncorto=request.getParameter("ncorto");
                estado=request.getParameter("estado");
                idDir=request.getParameter("idDir");
                de.Crear_Dep(nombre.trim(), ncorto.trim(), estado.trim(), idDir.trim());
            }
            if (opc.equals("activar-Dep")) {
                String id;
                id=request.getParameter("id");
                de.Activar_Dep(id.trim());
            }
            if (opc.equals("desactivar-Dep")) {
                String id;
                id=request.getParameter("id");
                de.Desactivar_Dep(id.trim());
            }
            if (opc.equals("eliminar-Dep")) {
                String id;
                id=request.getParameter("id");
                de.Eliminar_Dep(id.trim());
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
