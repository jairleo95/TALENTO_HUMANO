/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import pe.edu.upeu.application.util.DateFormat;
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
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;

/**
 *
 * @author joserodrigo
 */
public class CImpresion_Masiva extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    DateFormat co = new DateFormat();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        PrintWriter out = response.getWriter();
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        DateFormat co = new DateFormat();
        InterfaceContratoDAO c = new ContratoDAO();
        try {
            if (opc.equals("filtrar")) {
                String del = request.getParameter("desde").trim();

                String al = request.getParameter("al").trim();
                String nom_ape = request.getParameter("nom_ape");
                String direccion = request.getParameter("direccion");
                String departamento = request.getParameter("departamento");
                String area = request.getParameter("area");
                String seccion = request.getParameter("seccion");
                String puesto = request.getParameter("puesto");
                String fec_i = request.getParameter("fec_i");
                String fec_f = request.getParameter("fec_f");
                String sueldo = request.getParameter("sueldo");
                String fe_sus = request.getParameter("fe_sus");
                if (direccion.equals("null")) {
                    direccion = null;
                }
                List<Map<String, ?>> list = c.Listar_Contratos(del, al, direccion, departamento, area, seccion, puesto, sueldo, nom_ape, fec_i, fec_f, fe_sus, iddep);
                String List = del + "," + al + "," + direccion + "," + nom_ape + "," + departamento + "," + area + "," + seccion + "," + puesto + "," + fec_i + "," + fec_f + "," + sueldo;
                rpta.put("rpta", "1");
                rpta.put("lista", list);
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
