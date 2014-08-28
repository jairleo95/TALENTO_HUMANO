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
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;

/**
 *
 * @author Jose
 */
public class CDocumento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceDocumentoDAO d = new DocumentoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String dgp = request.getParameter("iddgp");
        String idtr = request.getParameter("idtr");
        String opc = request.getParameter("opc");

        try {

            if (opc.equals("Ver_Documento")) {
                getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
                int i = d.List_Req_nacionalidad(idtr);
                int num_ad = d.List_Adventista(idtr);
                getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
                getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));
                response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad);
            }
            if (opc.equals("Registrar")) {
                
                String iddgp=request.getParameter("iddgp");
                int i=Integer.parseInt(request.getParameter("num"));
                for (int j =1; j < i; j++) {
                    String name=request.getParameter("lob_upload"+i);
                    
                    
                    
                }
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
