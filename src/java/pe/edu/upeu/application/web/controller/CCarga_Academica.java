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
import pe.edu.upeu.application.dao.Carga_AcademicaDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.Tipo_DocumentoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;

/**
 *
 * @author ALFA 3
 */
public class CCarga_Academica extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        InterfaceCarga_AcademicaDAO carga = new Carga_AcademicaDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceListaDAO li = new ListaDAO();
        InterfaceUbigeoDAO ub = new UbigeoDAO();
        InterfaceDireccionDAO dir = new DireccionDAO();
        InterfaceTipo_DocumentoDAO tdoc = new Tipo_DocumentoDAO();
        String opc = request.getParameter("opc");
        CCriptografiar cripto = new CCriptografiar();

        if (opc.equals("Completar_Datos")) {

            String dni = request.getParameter("dni");
            String idtr = carga.DNI_ID_TRABAJADOR(dni);
            if (idtr.equals("")) {

                getServletContext().setAttribute("List_Carrera", li.List_Carrera());
                getServletContext().setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                getServletContext().setAttribute("List_Universidad", li.List_Universidad());
                getServletContext().setAttribute("List_Departamento", ub.List_Departamento());
                getServletContext().setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                getServletContext().setAttribute("Listar_via", dir.Listar_via());
                getServletContext().setAttribute("Listar_zona", dir.Listar_zona());
                getServletContext().setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                getServletContext().setAttribute("list_año", li.lista_años());

                response.sendRedirect("Vista/Trabajador/Reg_Trabajador.jsp");

            } else {
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?" + "id=" + cripto.Encriptar("idtr=" + idtr));
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
