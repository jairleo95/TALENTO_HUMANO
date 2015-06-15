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
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Solicitud_RequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceSolicitud_RequerimientoDAO;
import pe.edu.upeu.application.factory.FactoryConnectionDB;

/**
 *
 * @author ALFA 3
 */
public class CSolicitud_Requerimiento extends HttpServlet {

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
        String opc = request.getParameter("opc");
        InterfaceSolicitud_RequerimientoDAO s = new Solicitud_RequerimientoDAO();
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        Map<String, Object> rpta = new HashMap<String, Object>();
        if (opc.equals("Listar_Solicitud")) {
            getServletContext().setAttribute("Listar_solicitud", s.Listar_solicitud());
            response.sendRedirect("Vista/Solicitud/Reporte_Solicitud.jsp");
        }
        if (opc.equals("Registrar_solicitud")) {
            String FE_DESDE = request.getParameter("desde");
            String ID_DGP = request.getParameter("iddgp");
            String ID_PLAZO = request.getParameter("plazo");
            String DE_SOLICITUD = request.getParameter("descripcion");
            String ES_AUTORIZAR = request.getParameter("ES_AUTORIZAR");
            String ES_SOLICITUD_DGP = request.getParameter("ES_SOLICITUD_DGP");
            String IP_USUARIO = request.getParameter("IP_USUARIO");
            String FE_CREACION = request.getParameter("FE_CREACION");
            String US_MODIF = request.getParameter("US_MODIF");
            String FE_MODIF = request.getParameter("FE_MODIF");
            String NO_USUARIO = request.getParameter("NO_USUARIO");
            String tipo = request.getParameter("tipo_fecha");
            if (tipo.equals("month")) {
                FE_DESDE = FE_DESDE + "-01";
            }
            s.INSERT_SOLICITUD_DGP(null, FE_DESDE, ID_DGP, ID_PLAZO, DE_SOLICITUD, ES_AUTORIZAR, ES_SOLICITUD_DGP, IP_USUARIO, iduser, FE_CREACION, US_MODIF, FE_MODIF, NO_USUARIO);
            getServletContext().setAttribute("List_Solicitud_User", s.Listar_solicitud_id_us(iduser, ID_DGP));
            response.sendRedirect("Vista/Solicitud/Reg_List_Solicitud.jsp?iddgp=" + ID_DGP + "");
        }
        if (opc.equals("Reg_List_Solicitud")) {
            String iddgp = request.getParameter("iddgp");
            getServletContext().setAttribute("List_Solicitud_User", s.Listar_solicitud_id_us(iduser, iddgp));
            response.sendRedirect("Vista/Solicitud/Reg_List_Solicitud.jsp?iddgp=" + iddgp + "");
        }
        if (opc.equals("Ver_Detalle_Solicitud")) {
            String id = request.getParameter("id");
            getServletContext().setAttribute("Detalle_Solicitud", s.Listar_solicitud_id(id));
            response.sendRedirect("Vista/Solicitud/Detalle_Solicitud.jsp");
        }
        if (opc.equals("Ver_Solicitud")) {
            String id = request.getParameter("id");
            List<Map<String, ?>> list = s.List_solicitud_id(id);
            rpta.put("rpta", "1");
            rpta.put("lista", list);
        }
        if (opc.equals("Procesar_Solicitud")) {
            String id = request.getParameter("id");
            String tipo = request.getParameter("tipo");
            String fecha = request.getParameter("fecha");
            String comentario = request.getParameter("comentario");
            s.procesar_solicitud(tipo, id, FactoryConnectionDB.convertFecha3(fecha), iduser, comentario);
            rpta.put("rpta", "1");
        }
        if (opc.equals("Val_Envio_Solicitud")) {
            String h = "";
            String id = request.getParameter("iddgp");
            boolean estado = s.Validar_Envio_Solicitud(id);
            if (estado == true) {
                h = "<form id=\"checkout-form\" class=\"smart-form solicitud_plazo\">\n"
                        + "                                            <div class=\"row\">\n"
                        + "\n"
                        + "                                                <section class=\"col col-4\">\n"
                        + "                                                    <label class=\"label\">Tipo de Plazo :</label>\n"
                        + "                                                    <label class=\"select\"> \n"
                        + "                                                        <select name=\"tipo\" class=\"tipo\" required=\"\">\n"
                        + "                                                            <option value=''>[SELECCIONE]</option>\n"
                        + "                                                            <option value='2'>Ingreso a planilla</option>\n"
                        + "                                                            <option value='1' selected >Inicio de Contrato</option>\n"
                        + "\n"
                        + "                                                        </select>          \n"
                        + "                                                    </label>\n"
                        + "                                                </section>\n"
                        + "                                                <section class=\"col col-4\">\n"
                        + "                                                    <label class=\"label\">Plazo :</label>\n"
                        + "                                                    <label class=\"select\"> \n"
                        + "                                                        <select name=\"plazo\" class=\"plazo\" required=\"\">\n"
                        + "                                                            <option value='' selected >[SELECCIONE]</option>\n"
                        + "                                                        </select>          \n"
                        + "                                                    </label>\n"
                        + "                                                </section>\n"
                        + "                                                <section class=\"col col-4\">\n"
                        + "                                                    <label class=\"label lb_fecha_solicitud\">Fecha de Inicio :</label>\n"
                        + "                                                    <label class=\"input\"> \n"
                        + "\n"
                        + "                                                        <input type=\"date\" name=\"desde\"  class=\"fe_inicio\" required=\"\">\n"
                        + "                                                        <input type=\"hidden\" name=\"tipo_fecha\"  class=\"tipo_fecha\" value=\"date\" required=\"\">\n"
                        + "                                                    </label>\n"
                        + "                                                </section>\n"
                        + "                                            </div>\n"
                        + "                                            <section >\n"
                        + "                                                <label class=\"label\">Motivo :</label>\n"
                        + "                                                <label class=\"textarea\"> 										\n"
                        + "                                                    <textarea rows=\"3\" class=\"comentario\" name=\"descripcion\" placeholder=\"\" required=\"\"></textarea> \n"
                        + "                                                </label>\n"
                        + "                                            </section>\n"
                        + "                                            <footer>\n"
                        + "                                                <button type=\"button\" class=\"btn btn-default\" data-dismiss=\"modal\">\n"
                        + "                                                    Cancelar\n"
                        + "                                                </button>\n"
                        + "                                                <button type=\"button\" class=\"btn btn-primary sbm_solicitud\" >\n"
                        + "                                                    Enviar\n"
                        + "                                                </button>\n"
                        + "                                            </footer>\n"
                        + "\n"
                        + "                                        </form>  ";
            } else {
                h = "Ya tiene una solicitud en proceso";
            }
            rpta.put("rpta", "1");
            rpta.put("estado", estado);
            rpta.put("html", h);
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
