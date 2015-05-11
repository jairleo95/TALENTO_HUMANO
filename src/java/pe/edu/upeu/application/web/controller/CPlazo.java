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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import pe.edu.upeu.application.dao.Plazo_DgpDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;

/**
 *
 * @author JAIR
 */
@WebServlet(name = "CPlazo", urlPatterns = {"/plazo_dgp"})
public class CPlazo extends HttpServlet {

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        InterfacePlazo_DgpDAO pl = new Plazo_DgpDAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            String opc = request.getParameter("opc");
            if (opc.equals("Mantenimiento")) {
                response.sendRedirect("Vista/Dgp/Plazo/Reg_Plazo_Dgp.jsp");
            }
            if (opc.equals("Registrar")) {
                String NO_PLAZO = request.getParameter("nombre_plazo");
                String DET_ALERTA = request.getParameter("descripcion");
                String FE_DESDE = request.getParameter("desde");
                String FE_HASTA = request.getParameter("hasta");
                String ID_REQUERIMIENTO = request.getParameter("id_req");
                String TI_PLAZO = request.getParameter("tipo");
                int CA_DIAS_TOLERANCIA = Integer.parseInt(request.getParameter("tolerancia"));
                String ID_DEPARTAMENTO_TOLERANCIA = request.getParameter("dep_tolerancia");
                pl.INSERT_PLAZO(null, NO_PLAZO, DET_ALERTA, FE_DESDE, FE_HASTA, "1", ID_REQUERIMIENTO.trim(), TI_PLAZO, CA_DIAS_TOLERANCIA, ID_DEPARTAMENTO_TOLERANCIA);
            }
            if (opc.equals("Modificar")) {
                String ID_PLAZO = request.getParameter("ID");
                String NO_PLAZO = request.getParameter("nombre_plazo");
                String DET_ALERTA = request.getParameter("descripcion");
                String FE_DESDE = request.getParameter("desde");
                String FE_HASTA = request.getParameter("hasta");
                pl.UPDATE_PLAZO(ID_PLAZO, NO_PLAZO, DET_ALERTA, FE_DESDE, FE_HASTA, null);
            }
            if (opc.equals("Listar")) {
                String t_List = request.getParameter("t_List");
                List<Map<String, ?>> lista = pl.List_Plazo(t_List);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_Plazo")) {
                String tipo = request.getParameter("tipo");
                String req = request.getParameter("id_req");
                int dias = Integer.parseInt(request.getParameter("tolerancia"));
                String dep = request.getParameter("dep_tolerancia");
                List<Map<String, ?>> lista = pl.Listar_Plazo(tipo, req, dias, dep);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Eliminar")) {
                String id = request.getParameter("plz");
                pl.REMOVE_PLAZO(id);
            }
            if (opc.equals("Ver_detalle_plazo")) {
                String iddgp = request.getParameter("iddgp");
                getServletContext().setAttribute("Lista_detalle_plazo", pl.Lista_detalle_plazo(iddgp));
                response.sendRedirect("Vista/Dgp/Plazo/Detalle_Plazo.jsp");
            }
            if (opc.equals("List_id_plazo")) {
                String id = request.getParameter("tipo");
                String iddgp = request.getParameter("iddgp");
                List<Map<String, ?>> lista = pl.Listar_Plazo_id(id, iddgp);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("fecha_habilitada")) {
                String tipo = request.getParameter("tipo");
                String req = request.getParameter("req");
                String dias = request.getParameter("dias");
                String dep = request.getParameter("dep");
                String fecha = pl.HABILITAR_FECHA(tipo, req, dias, dep);
                rpta.put("fecha", fecha);
                rpta.put("rpta", "1");
            }
        } catch (Exception e) {
            rpta.put("rpta", "-1");
            rpta.put("mensaje", e.getMessage());
        }
        Gson gson = new Gson();
        out.print(gson.toJson(rpta));
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
