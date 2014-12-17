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
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;

/**
 *
 * @author Alfa.sistemas
 */
public class CAutorizacion extends HttpServlet {

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

        InterfaceEmpleadoDAO e = new EmpleadoDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        HttpSession sesion = request.getSession(true);

        String iduser = (String) sesion.getAttribute("IDUSER");
        String ide = (String) sesion.getAttribute("IDPER");
        String idp = (String) sesion.getAttribute("PUESTO_ID");

        String opc = request.getParameter("opc");

        if (opc != null) {
            if (opc.equals("Aceptar")) {
                String iddgp = request.getParameter("IDDETALLE_DGP");
                String estado = "1";
                String nropaso = request.getParameter("NROPASO");
                String usuario_ip = "";
                String cod = request.getParameter("COD");
                String iddrp = request.getParameter("IDDETALLE_REQ_PROCESO");
                String idpasos = request.getParameter("IDPASOS");
                /*Cambiar con un trigger al momento de insertar*/
                dgp.VAL_DGP_PASOS();

                a.Insert_Autorizacion("", iddgp, estado, nropaso, "", iduser, "", "", cod.trim(), idp, iddrp, idpasos);
                String idpu = e.Id_Puesto_Personal(ide);
                getServletContext().setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?r=ok");
            }
            if (opc.equals("Rechazar")) {
                String iddgp = request.getParameter("IDDETALLE_DGP");
                String estado = "2";
                String nropaso = request.getParameter("NROPASO");
                String usuario_ip = "";
                String cod = request.getParameter("COD");
                String iddrp = request.getParameter("IDDETALLE_REQ_PROCESO");
                String idpasos = request.getParameter("IDPASOS");
                /*Cambiar con un trigger al momento de insertar*/
                dgp.VAL_DGP_PASOS();
                dgp.RECHAZAR_DGP(iddgp);
                a.Insert_Autorizacion("", iddgp, estado, nropaso, "", iduser, "", "", cod.trim(), idp, iddrp, idpasos);
                String idpu = e.Id_Puesto_Personal(ide);
                getServletContext().setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?r=ok");
            }
            //try {
        } else {

            String idpu = e.Id_Puesto_Personal(ide);
            getServletContext().setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
            response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp");

        }
        /* } finally {
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
