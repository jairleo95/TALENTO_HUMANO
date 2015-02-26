/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.FuncionDAO;
import pe.edu.upeu.application.dao.PlantillaContractualDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;

/**
 *
 * @author joserodrigo
 */
public class CPlantilla_Contractual extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    
    InterfacePuestoDAO pu = new PuestoDAO();
    InterfaceTrabajadorDAO tr = new TrabajadorDAO();
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("UTF-8");
        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        String opc = request.getParameter("opc");
        InterfacePlantillaContractualDAO pl = new PlantillaContractualDAO();
        InterfaceContratoDAO con = new ContratoDAO();
        InterfaceFuncionDAO fu = new FuncionDAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            if (opc.equals("List_planti")) {
                String idpu = request.getParameter("id_pu");
                List<Map<String, ?>> list = pl.List_PLantillas(idpu);
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("Listpuesto")) {
                List<Map<String, ?>> list = pu.List_puesto();
                rpta.put("rpta", "1");
                rpta.put("lista", list);
            }
            if (opc.equals("cargar")) {
                String no_arch = request.getParameter("Imprimir");
                String id_con = request.getParameter("id_con");
                getServletContext().setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_con));
                //getServletContext().setAttribute("", tr.Calculaedad(idtraba));
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/reg_formato.jsp?no_arc=" + no_arch);
            }
            if (opc.equals("Imprimir")) {
                String id_puesto = request.getParameter("puesto");
                String id_planti_con = request.getParameter("id_plan_contr");
                String no_arch = pl.List_pl_con_x_id(id_planti_con);
                String id_con = request.getParameter("id_con");
                out.print(no_arch);
                getServletContext().setAttribute("List_x_fun_x_idpu", fu.List_x_fun_x_idpu(id_puesto));
                getServletContext().setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_con));
                //out.print(getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 11)+"Vista\\Contrato\\Formato_Plantilla\\Formato");
                out.print(id_puesto);
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/reg_formato.jsp?&no_arc=" + no_arch);
            }
        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();
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
