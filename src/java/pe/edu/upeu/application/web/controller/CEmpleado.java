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
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;

/**
 *
 * @author Admin
 */
public class CEmpleado extends HttpServlet {

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

        InterfaceEmpleadoDAO Iem = new EmpleadoDAO();

        HttpSession sesion = request.getSession(true);
        String opc = request.getParameter("opc");

        if (opc.equals("Eva_Emp")) {
            String ID_Trabajador = request.getParameter("idtr");
            String ID_Empleado = Iem.ID_Empleado(ID_Trabajador);
            String estado = Iem.ES_Empleado(ID_Empleado);
            
            getServletContext().setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_Empleado));
           if(estado!=null){
            if(estado.equals("1")){
            response.sendRedirect("Vista/Empleado/List_Evaluacion_Emp.jsp?idemp="+ID_Empleado);      
            } else{
            response.sendRedirect("Vista/Empleado/Evaluacion_Empleado.jsp?idtr="+ID_Trabajador);
            }
           }
            else{
            response.sendRedirect("Vista/Empleado/Evaluacion_Empleado.jsp?idtr="+ID_Trabajador);
            }
            
            
        }
        if (opc.equals("Reg_Evaluar_Emp")) {
            
          String ID_EVALUACION_EMP = null;
          String ES_EVALUACION = request.getParameter("ESTADO") ;
          String RE_EVALUACION = request.getParameter("RE_EVALUACION");
          String ID_TRABAJADOR = request.getParameter("ID_TRABAJADOR");
          
          String ID_EMPLEADO = Iem.ID_Empleado(ID_TRABAJADOR);
          Iem.Insert_Evaluacion_Emp(ID_EVALUACION_EMP, ES_EVALUACION, RE_EVALUACION, ID_EMPLEADO);
          getServletContext().setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_EMPLEADO));
           response.sendRedirect("Vista/Empleado/List_Evaluacion_Emp.jsp?idemp="+ID_EMPLEADO );
        }
        if(opc.equals("Editar")){
            String ID_EMP = request.getParameter("idemp");
         
          getServletContext().setAttribute("LIST_EVALUACION", Iem.Listar_Evaluacion_Emp(ID_EMP));
            
           response.sendRedirect("Vista/Empleado/Mod_Evaluacion_Emp.jsp?idemp="+ID_EMP);
        }
       
        
        if (opc.equals("Reporte")) {

            String iddepa = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            getServletContext().setAttribute("List_Empleado", Iem.Listar_Empleado(iddepa));

            out.print(Iem.Listar_Empleado(iddepa).size());

            response.sendRedirect("Vista/Empleado/Filtro_Empleado.jsp?idtr");
        }

        try {

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
