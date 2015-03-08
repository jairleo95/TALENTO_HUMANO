/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import com.google.gson.Gson;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.PlantillaContractualDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlantillaContractualDAO;

/**
 *
 * @author joserodrigo
 */
public class CImprimir extends HttpServlet {

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
        Map<String, Object> rpta = new HashMap<String, Object>();
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        InterfaceContratoDAO con = new ContratoDAO();
        InterfacePlantillaContractualDAO pl = new PlantillaContractualDAO();
        try {
            /* TODO output your page here. You may use following sample code. */
            if (opc.equals("Imprimir")) {
                String[] id_con = request.getParameterValues("Imprimir");
                List<String> list = new ArrayList<String>();
                for (int i = 0; i < id_con.length; i++) {
                    list.add(id_con[i]);
                }
                getServletContext().setAttribute("lista", list);
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Impresion_Masiva.jsp");
                // out.print(list.get(0).toString());
            }
            if (opc.equals("Imprimir1")) {
                String[] id_con = request.getParameterValues("Imprimir");

                List<String> list = new ArrayList<String>();
                List<String> texto = new ArrayList<String>();
                for (int i = 0; i < id_con.length; i++) {
                    String[] alma;
                    String textor="";
                    String imprimir="";
                    list.add(id_con[i]);
                    alma = id_con[i].split("/");
                   // String ubicacion = "/var/lib/tomcat7/webapps/TALENTO_HUMANO/Vista/Contrato/Formato_Plantilla/Formato/";
                    String ubicacion = getServletContext().getRealPath(".").substring(0, getServletContext().getRealPath(".").length() - 11)+"web\\Vista\\Contrato\\Formato_Plantilla\\Formato\\";
                    String no_arhivo_or = pl.List_pl_con_x_id(alma[1]);
                    FileReader lector = new FileReader(ubicacion + no_arhivo_or.trim());
                    BufferedReader contenido = new BufferedReader(lector);
                    while ((textor = contenido.readLine()) != null) {
                        imprimir =imprimir+ textor;
                    }
                    texto.add(imprimir);
                }
                getServletContext().setAttribute("lista", list);
                getServletContext().setAttribute("texto", texto);
                response.sendRedirect("Vista/Contrato/Formato_Plantilla/Impresion_Masiva2.jsp");
                // out.print(list.get(0).toString());
            }
            if (opc.equals("Listar_contrato")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> list = con.List_contra_x_idcto_json(id);
                // out.print(list.get(0).toString());
                rpta.put("rpta", "1");
                rpta.put("lista", list);
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
