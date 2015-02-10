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
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.DepartamentoDao;
import pe.edu.upeu.application.dao.NacionalidadDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.ReporteDAO;
import pe.edu.upeu.application.dao.SeccionDAO;
import pe.edu.upeu.application.dao.SituacionEducativaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
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
    InterfaceNacionalidadDAO n = new NacionalidadDAO();
    InterfaceSituacionEducativaDAO se=new SituacionEducativaDAO();
    InterfaceCarrera_UniversidadDAO ca=new Carrera_UniversidadDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String opc = request.getParameter("opc");
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
