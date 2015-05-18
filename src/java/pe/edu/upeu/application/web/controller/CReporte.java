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
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.DepartamentoDao;
import pe.edu.upeu.application.dao.NacionalidadDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.ReporteDAO;
import pe.edu.upeu.application.dao.SeccionDAO;
import pe.edu.upeu.application.dao.SituacionEducativaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfaceDepartamentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceNacionalidadDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceReporteDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSeccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSituacionEducativaDAO;

/**
 *
 * @author joserodrigo
 */
public class CReporte extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceReporteDAO r = new ReporteDAO();
    InterfaceDepartamentoDAO d = new DepartamentoDao();
    InterfaceAreaDAO a = new AreaDAO();
    InterfaceSeccionDAO s = new SeccionDAO();
    InterfacePuestoDAO p = new PuestoDAO();
    InterfaceReporteDAO RP = new ReporteDAO();
    InterfaceNacionalidadDAO n = new NacionalidadDAO();
    InterfaceSituacionEducativaDAO se = new SituacionEducativaDAO();
    InterfaceCarrera_UniversidadDAO ca = new Carrera_UniversidadDAO();
    InterfaceDatos_Hijo_Trabajador dah = new Datos_Hijo_TrabajadorDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        try {
            //Reportes
            if (opc.equals("reporte1")) {
                getServletContext().setAttribute("Reporte_Datos_Generales", r.Reporte_Datos_Generales());
                getServletContext().setAttribute("List_Departamento_Lima", d.List_Departamento_Lima());
                getServletContext().setAttribute("List_Area_Lima", a.List_Area_Lima());
                getServletContext().setAttribute("LISTA_RH_SECCION_LIMA", s.LISTA_RH_SECCION_LIMA());
                getServletContext().setAttribute("List_Puesto_lima", p.List_Puesto_lima());
                getServletContext().setAttribute("List_Nacionalidad", n.List_Nacionalidad());
                getServletContext().setAttribute("List_SituacionEducativa", se.List_SituacionEducativa());
                getServletContext().setAttribute("List_Carrera", ca.List_Carrera());
                response.sendRedirect("Vista/Reportes/newjsp.jsp");
            }
            if (opc.equals("reporte_hijo")) {
                String desde = request.getParameter("desde");
                String hasta = request.getParameter("hasta");
                String edad = request.getParameter("edad");
                List<Map<String, ?>> lista = dah.Listar_hijo_filtro(desde, hasta, edad);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("reporte_padre_hijo")) {
                String desde = request.getParameter("desde");
                String hasta = request.getParameter("hasta");
                String edad = request.getParameter("edad");
                List<Map<String, ?>> lista = RP.listar_padre_hi(desde, hasta, edad);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }

            if (opc.equals("reporte_cumpleaños")) {
                String mes = request.getParameter("mes");
                String dia = request.getParameter("dia");
                String aps = request.getParameter("aps");
                String dep = request.getParameter("departamento");
                String are = request.getParameter("seccion");
                String sec = request.getParameter("area");
                String puesto = request.getParameter("puesto");
                String fec = request.getParameter("fecha");
                String edad = request.getParameter("edad");
                String ape = request.getParameter("paterno");
                String mat = request.getParameter("materno");
                String nom = request.getParameter("nombre");
                String num = request.getParameter("num");
                List<Map<String, ?>> lista = dah.Listar_Cumpleaños(mes, dia,aps);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("reporte_t_navidad")) {
                String mes = request.getParameter("mes");
                List<Map<String, ?>> lista = RP.lirtar_trabajor_Navidad(mes);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("reporte_datos_genereales")) {
                String aps = request.getParameter("aps");
                String dep = request.getParameter("departamento");
                String are = request.getParameter("seccion");
                String sec = request.getParameter("area");
                String puesto = request.getParameter("puesto");
                String fec = request.getParameter("fecha");
                String edad = request.getParameter("edad");
                String ape = request.getParameter("paterno");
                String mat = request.getParameter("materno");
                String nom = request.getParameter("nombre");
                String num = request.getParameter("num");
                List<Map<String, ?>> lista = r.Reporte_Datos_Gen(aps, dep, are, sec, puesto, fec, edad, ape, mat,nom, num);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }

            //vistas
            if (opc.equals("Reporte_padres_madres")) {
                response.sendRedirect("Vista/Reportes/Reporte_Padres_Madres.jsp");
            }
            if (opc.equals("Reporte_datos")) {
                response.sendRedirect("Vista/Reportes/Reporte_Datos_Generales.jsp");
            }
            if (opc.equals("Reporte_Datos_Hijos")) {
                response.sendRedirect("Vista/Reportes/Reporte_Datos_Hijos.jsp");
            }

            if (opc.equals("Reporte_Datos_cumpl")) {
                response.sendRedirect("Vista/Reportes/Reporte_Cumpleanos.jsp");
            }
            if (opc.equals("Reporte_Navidad")) {
                response.sendRedirect("Vista/Reportes/Reporte_para_navidad.jsp");
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
