/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.user;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.ValidarFotoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceValidarFoto;

/**
 *
 * @author USUARIO
 */
@WebServlet(name = "CValidar_Foto", urlPatterns = {"/validar_foto"})
public class CValidar_Foto extends HttpServlet {

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
        response.setContentType("application/json;charset=UTF-8");
        String opc; opc = request.getParameter("opc");
        String idtr; idtr = request.getParameter("idtr");
        String estado; estado = request.getParameter("estado");
        String bus; bus = request.getParameter("bus");
        String btipo; btipo = request.getParameter("btipo");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();
        InterfaceValidarFoto x = new ValidarFotoDAO();
        
        if(opc.equals("Index")){
            response.sendRedirect("Vista/Reportes/Validar_Foto/Index.jsp");
        }
        if(opc.equals("getFotos")){
            rpta.put("Fotos_NoVal",x.ListFotos(estado));
            Gson gson = new Gson();
            out.print(gson.toJson(rpta));
            out.flush();
            out.close(); 
            
        }
        if(opc.equals("validar")){
          x.validar(idtr.trim(),estado.trim());
           rpta.put("val","1");
            Gson gson = new Gson();
            out.print(gson.toJson(rpta));
            out.flush();
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
