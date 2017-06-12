/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.HorarioDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.model.V_Horario;

/**
 *
 * @author Admin
 */
public class CHorario extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceHorarioDAO IHor = new HorarioDAO();
    InterfaceListaDAO Ilis = new ListaDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        Map<String, Object> rpta = new HashMap<String, Object>();
        PrintWriter out = response.getWriter();

        HttpSession sesion = request.getSession();

        String iduser = (String) sesion.getAttribute("IDUSER");

        List<String> dia = new ArrayList<String>();
        dia.add("lun");
        dia.add("mar");
        dia.add("mie");
        dia.add("jue");
        dia.add("vie");
        dia.add("dom");

        String opc = request.getParameter("opc");

        try {
            if (opc.equals("REGISTRAR HORARIO")) {
                String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");
                String ID_DGP = request.getParameter("IDDETALLE_DGP");
                String ES_DETALLE_HORARIO = "1";
                String ES_HORARIO = "1";
                String ID_TRABAJJADOR = request.getParameter("idtr");
                String ID_TIPO_HORARIO = request.getParameter("HORARIO");
                String ES_MOD_FORMATO = "1";
                Double Ca_ho_total = Double.parseDouble(request.getParameter("h_total"));
                ID_DETALLE_HORARIO = IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, ID_DGP, ES_DETALLE_HORARIO, iduser, null, null, null, ID_TIPO_HORARIO, ES_MOD_FORMATO, Ca_ho_total);
                for (int i = 0; i < dia.size(); i++) {
                    for (int j = 0; j < 10; j++) {
                        String hora_desde = request.getParameter("HORA_DESDE_" + dia.get(i) + j);
                        String hora_hasta = request.getParameter("HORA_HASTA_" + dia.get(i) + j);
                        String d = request.getParameter("DIA_" + dia.get(i) + j);
                        if (hora_desde != null & d != null & hora_hasta != null) {
                            if (!hora_hasta.equals("") & !hora_desde.equals("") & !d.equals("")) {
                                IHor.Insert_Horario(null, hora_desde, hora_hasta, d, ES_HORARIO, ID_DETALLE_HORARIO);
                            }
                        }
                    }

                }

                sesion.setAttribute("List_V_Horario", IHor.List_V_Horario(ID_DGP));
                sesion.setAttribute("List_H", Ilis.List_H());
//out.print(ID_DGP);
                response.sendRedirect("Vista/Dgp/Horario/Detalle_Horario.jsp?iddgp=" + ID_DGP + "&idtr=" + ID_TRABAJJADOR + "&P2=1");
            }

            if (opc.equals("Listar")) {
                String ID_DGP = request.getParameter("iddgp");
                sesion.setAttribute("List_V_Horario", IHor.List_V_Horario(ID_DGP));
                sesion.setAttribute("List_H", Ilis.List_H());

                response.sendRedirect("Vista/Dgp/Horario/Detalle_Horario.jsp");

            }
            if (opc.equals("Listar2")) {
                ArrayList<Map<String, ?>> lista = new ArrayList<>();                
                String ID_DGP = request.getParameter("iddgp");
                List<V_Horario> lv = IHor.List_V_Horario(ID_DGP);
                for (int i = 0; i < lv.size(); i++) {
                    Map<String, Object> a = new HashMap<>();
                    a.put("dia_horario", lv.get(i).getDia_horario());
                    a.put("ho_desde", lv.get(i).getHo_desde());
                    a.put("ho_hasta", lv.get(i).getHo_hasta());
                    a.put("id_detalle_horario", lv.get(i).getId_detalle_horario());
                    a.put("id_dgp", lv.get(i).getId_dgp());
                    a.put("id_horario", lv.get(i).getId_horario());
                    a.put("no_horario", lv.get(i).getNo_ti_horario());
                    lista.add(a);
                }                
                rpta.put("listar", lista);
            }
            if (opc.equals("listaHorario")) {

            }
        } catch (NumberFormatException | IOException e) {
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
