/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;

/**
 *
 * @author Alfa.sistemas
 */
public class CTrabajador extends HttpServlet {

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
        try {
            HttpSession sesion =  request.getSession(true);
String iddep= (String)sesion.getAttribute("DEPARTAMENTO_ID") ;
            
                  String Buscar =(String) request.getParameter("Buscar");  
            String dni = (String)request.getParameter("dni");  
            String nom = (String)request.getParameter("nom");  
            String ape_mat = (String)request.getParameter("ape_mat");  
            String ape_pat = (String)request.getParameter("ape_pat");  
            String all = (String)request.getParameter("all");  
            
            if ((Buscar=="Buscar"&&(dni!="0"   || nom!=""|| ape_mat!="" || ape_pat!=""   )  ) || all=="Todos") {
                InterfaceListaDAO li= new ListaDAO();
                InterfaceDgpDAO dgp=  new DgpDAO();
                 InterfaceTrabajadorDAO tr =  new TrabajadorDAO();
            getServletContext().setAttribute("ListarTrabajador", tr.ListarTrabajador(iddep, dni, nom, ape_pat, ape_mat));
            getServletContext().setAttribute("List_Carrera", li.List_Carrera());
            
            
            getServletContext().setAttribute("", dgp.VAL_TRA_DGP(iddep));
            }
 
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Vista/Trabajador/Ficha_Trabajador.jsp");
                    dispatcher.forward(request, response);
            
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
