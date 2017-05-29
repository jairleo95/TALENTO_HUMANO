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
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;

/**
 *
 * @author joserodrigo
 */
public class CRenuncias extends HttpServlet {

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
        HttpSession sesion = request.getSession(true);
        String idtr = request.getParameter("idtr");
        String idreq = request.getParameter("idreq");
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        String iddep = (String)sesion.getAttribute("DEPARTAMENTO_ID");

        if ("Reg_renuncia".equals(request.getParameter("opc"))) {
            String Tipo_planilla = tr.tipo_planilla(idtr);
            /*if (Tipo_planilla.equals("TPL-0001")) {
                idreq = "REQ-0015";
            }
            if (Tipo_planilla.equals("TPL-0002")) {
                idreq = "REQ-0016";
            }
            if (Tipo_planilla.equals("TPL-0003")) {
                idreq = "REQ-0017";
            }*/
            out.print(Tipo_planilla+idtr + idreq + iddep);
           // sesion.setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
          //  sesion.setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
            //response.sendRedirect("Vista/Renuncias/Reg_Dgp_Renuncia.jsp?idreq=" + idreq);
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
