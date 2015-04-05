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
import pe.edu.upeu.application.dao.Solicitud_RequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSolicitud_RequerimientoDAO;

/**
 *
 * @author ALFA 3
 */
public class CSolicitud_Requerimiento extends HttpServlet {

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
        InterfaceSolicitud_RequerimientoDAO s = new Solicitud_RequerimientoDAO();
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        try {
            if (opc.equals("Listar_Solicitud")) {
                getServletContext().setAttribute("Listar_solicitud", s.Listar_solicitud());
                response.sendRedirect("Vista/Solicitud/Reporte_Solicitud.jsp");
            }
            if (opc.equals("Registrar_solicitud")) {
                String FE_DESDE = request.getParameter("FE_DESDE");
                String ID_DGP = request.getParameter("ID_DGP");
                String ID_PLAZO = request.getParameter("ID_PLAZO");
                String DE_SOLICITUD = request.getParameter("DE_SOLICITUD");
                String ES_AUTORIZAR = request.getParameter("ES_AUTORIZAR");
                String ES_SOLICITUD_DGP = request.getParameter("ES_SOLICITUD_DGP");
                String IP_USUARIO = request.getParameter("IP_USUARIO");
                String US_CREACION = request.getParameter("US_CREACION");
                String FE_CREACION = request.getParameter("FE_CREACION");
                String US_MODIF = request.getParameter("US_MODIF");
                String FE_MODIF = request.getParameter("FE_MODIF");
                String NO_USUARIO = request.getParameter("NO_USUARIO");
                String tipo = request.getParameter("tipo");
                if (tipo.equals("month")) {
                    FE_DESDE = FE_DESDE + "-01";
                }
                s.INSERT_SOLICITUD_DGP(null, FE_DESDE, ID_DGP, ID_PLAZO, DE_SOLICITUD, ES_AUTORIZAR, ES_SOLICITUD_DGP, IP_USUARIO, iduser, FE_CREACION, US_MODIF, FE_MODIF, NO_USUARIO);
            }

        } catch (Exception e) {
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
