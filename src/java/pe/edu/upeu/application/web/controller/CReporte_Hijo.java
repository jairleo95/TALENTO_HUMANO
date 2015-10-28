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
import pe.edu.upeu.application.dao.ReporteDAO;
import pe.edu.upeu.application.dao_imp.InterfaceReporteDAO;

/**
 *
 * @author Alexander
 */
@WebServlet(name = "CReporte_Hijo", urlPatterns = {"/CReporte_Hijo"})
public class CReporte_Hijo extends HttpServlet {
    InterfaceReporteDAO rep= new ReporteDAO();

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
        PrintWriter out= response.getWriter();
        Map<String, Object> rpta= new HashMap<>();
        String opc =request.getParameter("opc");
        List<Map<String,?>> lista;
        try {
            if (opc.equals("reporte_hijos")) {
                String sql="SELECT * FROM RHVD_REPORTE_HIJOS";
                String nombre=request.getParameter("nombre");
                String paterno=request.getParameter("paterno");
                String materno=request.getParameter("materno");
                String genero=request.getParameter("genero");
                String edad=request.getParameter("edad");
                String desde=request.getParameter("desde");
                String hasta=request.getParameter("hasta");
                String dni=request.getParameter("dni");
                int cont=0;
                if (!nombre.equals("")) cont++;
                if (!paterno.equals("")) cont++;
                if (!materno.equals("")) cont++;
                if (!edad.equals("")) cont++;
                if (!genero.equals("")) cont++;
                if (!desde.equals("")&&!hasta.equals("")) cont++;
                if (!dni.equals("")) cont++;
                if(cont>0)sql+=" WHERE";
                if (!nombre.equals("")) {
                    sql+=" UPPER(NO_HIJO_TRABAJADOR) LIKE UPPER('%"+nombre+"%')";
                }
                if (!paterno.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" UPPER(AP_PATERNO_HIJO) LIKE UPPER('%"+paterno+"%')";
                }
                if (!materno.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" UPPER(AP_MATERNO_HIJO) LIKE UPPER('%"+materno+"%')";
                }
                if (!genero.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" UPPER(ES_SEXO) LIKE UPPER('%"+genero+"%')";
                }
                if (!dni.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" NU_DOC_HIJO ='"+dni+"'";
                }
                if (!edad.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" EDAD_HIJO="+edad;
                }
                if (!desde.equals("") && !hasta.equals("")) {
                    if((sql.length()-sql.indexOf("WHERE"))>5)sql+=" AND";
                    sql+=" (FE_NACIMIENTO_HIJO>=TO_DATE('"+desde+"','yyyy-mm-dd') AND FE_NACIMIENTO_HIJO<=TO_DATE('"+hasta+"','yyyy-mm-dd'))";
                }
                sql+=" ORDER BY AP_PATERNO";
                System.out.println(sql);
                lista= rep.reporte_hijos(sql);
                rpta.put("lista", lista);
            }
            
        } catch (Exception e) {
            System.out.println(e);
            rpta.put("err", "Error al Procesar los Datos, intentelo nuevamente");
        }
        Gson gson= new Gson();
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
