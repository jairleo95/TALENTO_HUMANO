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
import pe.edu.upeu.application.dao.Carga_AcademicaDAO;
import pe.edu.upeu.application.dao.PagoDocenteDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePagoDocenteDAO;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.PagoDocente;
import pe.edu.upeu.application.util.CCriptografiar;
import pe.edu.upeu.application.util.DateFormat;

/**
 *
 * @author ALFA 3
 */
public class CPago_Docente extends HttpServlet {

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
        InterfaceCarga_AcademicaDAO c = new Carga_AcademicaDAO();
        String opc = request.getParameter("opc");
        InterfacePagoDocenteDAO pd = new PagoDocenteDAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        try {
            if (opc.equals("Listar_Cuotas")) {
                String feDesde = request.getParameter("fe_desde");
                String feHasta = request.getParameter("fe_hasta");
                double ca_pago_semanal = Double.parseDouble(request.getParameter("pago_semanal"));
                feDesde = DateFormat.toFormat3(feDesde);
                feHasta = DateFormat.toFormat3(feHasta);
                List<Map<String, ?>> lista = c.Cuotas_Pago_Docente(DateFormat.toFormat1(feDesde), DateFormat.toFormat1(feHasta), ca_pago_semanal);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("getPagoDocenteHtml")) {
                String idpca = CCriptografiar.Desencriptar(request.getParameter("id"));
                List<PagoDocente> x = pd.getPagoDocenteByIdProcCA(idpca);
                String html = "";
                html += "<div class='row text-center'><div class='col-md-2'>Mes</div><div class='col-md-5'>Fecha Pago Aprox.</div><div class='col-md-5'>Monto</div></div>";

                for (int i = 0; i < x.size(); i++) {
                    html += "<div class='row text-center'>";
                    html += "<div class='form-group'><label class='col-md-2 control-label'>" + (i + 1) + "</label>";

                    html += "<div class='col-md-5'>";
                    html += "<div class='input-group'>";
                    html += "<span class='input-group-addon'><i class='fa fa-calendar'></i></span>";
                    html += "<input type='text' class='form-control' disabled='disabled' value='" + x.get(i).getFePago() + "' />";
                    html += "</div>";
                    html += "</div>";
                    html += "<div class='col-md-5'>";
                    html += "<div class='input-group'>";
                    html += "<span class='input-group-addon'>S/.</span>";
                    html += "<input type='text' class='form-control'  disabled='disabled' value='" + x.get(i).getCaCuota() + "' />";
                    html += "</div>";
                    html += "</div>";
                    html += "</div>";
                    html += "</div>";

                    //   html += "<div class='row'><div class='col-md-2 text-center' ><label class=''>"
                    //      + (i + 1) + "</label></div><div class='col-md-10'><input type='text' class='form-control' readonly='' value='" + x.get(i).getCaCuota() + "' /></div></div>";
                }
                rpta.put("html", html);
                rpta.put("status", true);

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
