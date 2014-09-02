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
        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("IDUSER");


        try {
        if (opc.equals("Ver_Documento")) {
            getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
            int i = d.List_Req_nacionalidad(idtr);
            int num_ad = d.List_Adventista(idtr);
            getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
            getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

            response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad);
        }
        if (opc.equals("Reg_Pro_Dgp")) {
            getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
            int i = d.List_Req_nacionalidad(idtr);
            int num_ad = d.List_Adventista(idtr);
            getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
            getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));
            response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad+"&pro=pr_dgp");
        }
        if (opc.equals("Registrar")) {
            String iddgp = request.getParameter("iddgp");
            int i = Integer.parseInt(request.getParameter("num"));
            for (int j = 1; j < i; j++) {

                String name = request.getParameter("lob_upload" + j);
                String desc = request.getParameter("lob_description" + j);
                String iddoc = request.getParameter("iddoc" + j);
                String estado = request.getParameter("estado" + j);
                //out.println(iddgp);

                String AR_DATO_ARCHIVO = request.getParameter("AR_DATO_ARCHIVO");
                String NO_ARCHIVO = request.getParameter("NO_ARCHIVO");
                String TA_ARCHIVO = request.getParameter("TA_ARCHIVO");
                String AR_FILE_TYPE = request.getParameter("AR_FILE_TYPE");
                if (AR_DATO_ARCHIVO == null & (desc != null | estado != null)) {
                    d.INSERT_DOCUMENTO_ADJUNTO(null, iddgp, iddoc, estado, user, null, null, null, null, desc, AR_DATO_ARCHIVO, NO_ARCHIVO, TA_ARCHIVO, AR_FILE_TYPE);
                }
            }

            getServletContext().setAttribute("List_doc_req_pla", d.List_doc_req_pla(iddgp, idtr));
            int s = d.List_Req_nacionalidad(idtr);
            int num_ad = d.List_Adventista(idtr);
            getServletContext().setAttribute("List_Hijos", d.List_Hijos(idtr));
            getServletContext().setAttribute("List_Conyugue", d.List_Conyugue(idtr));

            String pr = request.getParameter("P2");
            if (pr != null) {
                if (pr.equals("enter")) {

                    response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&P2=TRUE");

                }
            } else {
                response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad);
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
