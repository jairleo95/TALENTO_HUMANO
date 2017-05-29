/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.DepartamentoDao;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.FuncionDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.SeccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;
import pe.edu.upeu.application.model.Puesto;

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
        String id_user = (String) sesion.getAttribute("IDUSER");
        InterfaceFuncionDAO f = new FuncionDAO();
        InterfacePuestoDAO p = new PuestoDAO();
        InterfaceDireccionDAO di = new DireccionDAO();
        /* TODO output your page here. You may use following sample code. */
        try {
            if (opc.equals("princpal_funcion")) {
                sesion.setAttribute("Listar_Direccion", di.Listar_Direccion());
                response.sendRedirect("Vista/Funciones/Otorgar_funciones.jsp");
            }
            
            if (opc.equals("listar_x_puesto")) {
                String id_pu = request.getParameter("id_puesto");
                List<Map<String, ?>> list = f.Listar_fun_x_pu(id_pu);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("listarF")) {
                List<Map<String, ?>> list = f.Listar_Funciones();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("listar_Direccion")) {
                List<Map<String, ?>> list = di.List_Direccion();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("otorgar_funciones")) {
                sesion.setAttribute("Listar_Direccion", di.Listar_Direccion());
                response.sendRedirect("Vista/Funciones/Otorgar_funciones.jsp");
            }
            if (opc.equals("otorgar")) {
                String id_puesto=request.getParameter("id_puesto");
                String de_funcion=request.getParameter("de_funcion");
                String ti_funcion=request.getParameter("ti_funcion");
                f.Insertar_funcion(id_puesto, de_funcion, id_user, ti_funcion);
            }
            if(opc.equals("list_pu")){
                List<Map<String, ?>> list = p.List_puesto();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("del_fun")) {
                String id_funcion=request.getParameter("id_fun");
                f.Eliminar_funcion(id_funcion);
            }
            if (opc.equals("edit_function")) {
                String id_funcion=request.getParameter("id_fun");
                String de_funcion=request.getParameter("de_fun");
                String es_funcion=request.getParameter("es_fun");
                String id_puesto=request.getParameter("id_pu");
                String ti_funcion=request.getParameter("ti_funcion");
                f.Modificar_funcion(id_funcion, es_funcion, de_funcion, id_puesto, id_user, ti_funcion);
            }
            if (opc.equals("direccion")){
                String id_de=request.getParameter("idDireccion");
                List<Map<String, ?>> list = f.Listar_dep_x_dir(id_de);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("departamento")){
                String id_de=request.getParameter("idDepartamento");
                List<Map<String, ?>> list = f.Listar_ar_x_dep(id_de);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("area")){
                String id_de=request.getParameter("idArea");
                List<Map<String, ?>> list = f.Listar_sec_x_area(id_de);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("seccion")){
                String id_se=request.getParameter("idSeccion");
                List<Map<String, ?>> list = f.Listar_pu_x_sec(id_se);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
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
