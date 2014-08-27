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
import pe.edu.upeu.application.dao.Comentario_DGPDAO;
import pe.edu.upeu.application.dao_imp.InterfaceComentario_DGPDAO;

/**
 *
 * @author Karencita
 */
public class CComentario extends HttpServlet {

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
        InterfaceComentario_DGPDAO x = new Comentario_DGPDAO();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String idu=(String)sesion.getAttribute("IDUSER");
        
        /*try {*/
        if (opc.equals("COMENTAR")) {
            String ID_COMENTARIO_DGP = null;
            String ID_DGP = request.getParameter("IDDETALLE_DGP");
            String ID_AUTORIZACION = request.getParameter("ID_AUTORIZACION");
            String CM_COMENTARIO = request.getParameter("COMENTARIO");
            String FE_CREACION = null;
            String US_MODIFICACION = null;
            String FE_MODIFICACION = null;
            String ES_COMENTARIO_DGP = "1";
            x.INSERT_COMENTARIO_DGP(ID_COMENTARIO_DGP, ID_DGP, ID_AUTORIZACION, CM_COMENTARIO, idu, FE_CREACION, US_MODIFICACION, FE_MODIFICACION, ES_COMENTARIO_DGP);
            getServletContext().setAttribute("List_Comentario_DGP", x.List_Comentario_DGP(ID_DGP));
            response.sendRedirect("Vista/Dgp/Comentario/Reg_Comentario.jsp?iddgp="+ID_DGP);
        }
        if (opc.equals("Comentar_Dgp")) {

        String iddgp=request.getParameter("iddgp");
            getServletContext().setAttribute("List_Comentario_DGP", x.List_Comentario_DGP(iddgp));
            response.sendRedirect("Vista/Dgp/Comentario/Reg_Comentario.jsp?iddgp="+iddgp);
        }

        /*} finally {
         out.close();
         }*/
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
