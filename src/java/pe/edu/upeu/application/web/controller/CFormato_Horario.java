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

import java.util.Map;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.Formato_HorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFormato_HorarioDAO;

/**
 *
 * @author Alex
 */
public class CFormato_Horario extends HttpServlet {

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

        HttpSession sesion = request.getSession(true);

        InterfaceFormato_HorarioDAO Ifh = new Formato_HorarioDAO();

        String opc = request.getParameter("opc");
        Map<String, Object> rpta = new HashMap<String, Object>();
        InterfaceCarrera_UniversidadDAO model = new Carrera_UniversidadDAO();
        List<String> dia = new ArrayList<String>();
        dia.add("lun");
        dia.add("mar");
        dia.add("mie");
        dia.add("jue");
        dia.add("vie");
        dia.add("sab");
        dia.add("dom");
        try {

            if (opc.equals("registrar")) {
                String ID_TIPO_HORARIO = null;
                String NO_HORARIO = request.getParameter("NO_HORARIO");
                String DE_HORARIO = request.getParameter("DE_HORARIO");
                String ES_HORARIO = request.getParameter("ES_HORARIO");
                Double CA_HORAS = Double.parseDouble(request.getParameter("CA_HORAS"));

                Ifh.Insert_Horario(ID_TIPO_HORARIO, NO_HORARIO, DE_HORARIO, ES_HORARIO, CA_HORAS, null, null, null);
                getServletContext().setAttribute("List_Tipo_Horario", Ifh.Listar_Tipo_Horario());
                response.sendRedirect("Vista/Formato_Horario/Detalle_Formato_Horario.jsp");

            }
            if (opc.equals("GuardarFH")) {
                String NO_HORARIO = request.getParameter("NO_HORARIO");
                String DE_HORARIO = request.getParameter("DE_HORARIO");
                String ES_HORARIO = "1";
                String ID_DEP = sesion.getAttribute("DEPARTAMENTO_ID").toString();
                Double CA_HORAS = Double.parseDouble(request.getParameter("CA_HORAS"));
                String id_ar = request.getParameter("id_ar");
                String id_sec= request.getParameter("id_sec");
                
                Ifh.Insert_Horario(null, NO_HORARIO, DE_HORARIO, ES_HORARIO, CA_HORAS, ID_DEP, id_ar, id_sec);
            }

            if (opc.equals("Listar_Formato")) {
                getServletContext().setAttribute("List_Tipo_Horario", Ifh.Listar_Tipo_Horario());
                response.sendRedirect("Vista/Formato_Horario/Detalle_Formato_Horario.jsp");
            }
            if(opc.equals("LFH")){
                List<Map<String, ?>> lista = Ifh.List_Tipo_Horarios();
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }

            if (opc.equals("REGISTRAR_FOR_HORARIO")) {
                String ID_FORMATO_HORARIO = request.getParameter(null);
                String ID_TIPO_HORARIO = request.getParameter("IDTIPOHORARIO");
                String ES_F_HORARIO = request.getParameter("ESTADO");

                for (int i = 0; i < dia.size(); i++) {
                    for (int j = 0; j < 10; j++) {
                        String HO_DESDE = request.getParameter("HORA_DESDE_" + dia.get(i) + j);
                        String HO_HASTA = request.getParameter("HORA_HASTA_" + dia.get(i) + j);
                        String NO_TURNO = request.getParameter("TURNO_" + dia.get(i) + j);
                        String NO_DIA = request.getParameter("DIA_" + dia.get(i) + j);

                        if (HO_DESDE != null & NO_DIA != null & HO_HASTA != null) {
                            if (!HO_HASTA.equals("") & !HO_DESDE.equals("") & !NO_DIA.equals("")) {
                                Ifh.Insert_Formato_Horario(ID_FORMATO_HORARIO, NO_TURNO, NO_DIA, HO_DESDE, HO_HASTA, ES_F_HORARIO, ID_TIPO_HORARIO);
                            }
                        }
                    }

                }
                getServletContext().setAttribute("List_Tipo_Horario", Ifh.Listar_Tipo_Horario());
                response.sendRedirect("Vista/Formato_Horario/Detalle_Formato_Horario.jsp");

            }
            if (opc.equals("LISTAR_FORMATO_HORARIO")) {
                String ID_TIPO_HORARIO = request.getParameter("idth");
                String nofor = request.getParameter("nofor");
                getServletContext().setAttribute("LISTAR_FORMATO_HORARIO", Ifh.Listar_Formato_Horario(ID_TIPO_HORARIO));
                getServletContext().setAttribute("List_D", Ifh.List_D());
                response.sendRedirect("Vista/Formato_Horario/List_Formato_Horario.jsp?nofor=" + nofor + "");
            }
            if (opc.equals("Listar_Tip_Horario")) {
                String id = request.getParameter("sec");
                List<Map<String, ?>> lista = Ifh.List_Tipo_HorarioSec(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);

            }
            if (opc.equals("Eliminar_turno")) {
                String id_horario = request.getParameter("id_horario");
                Ifh.Eliminar_turno(id_horario);
            }
            if (opc.equals("Listar_Horas_horario")) {
                String id_dgp = request.getParameter("iddgp");
                List<Map<String, ?>> lista = Ifh.Listar_Horario_dgp(id_dgp);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_Horario")) {
                String id = request.getParameter("id");
                List<Map<String, ?>> lista = Ifh.List_Formato_h(id);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("cargar_dep")) {
                                
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
