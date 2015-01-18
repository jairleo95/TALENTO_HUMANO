/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.HorarioDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;

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

    public void Det_Horario(String iddgp) {
        getServletContext().setAttribute("List_V_Horario", IHor.List_V_Horario(iddgp));
        getServletContext().setAttribute("List_V_Horario", Ilis.List_H());

        //List<V_Horario> List_V_H = IHor.List_V_Horario(iddgp);
        //String [][]List_H =Ilis.List_H();
        /*for (int i = 0; i < List_H.length; i++) {
         int g = 0;
         for (int j = 0; j < List_V_H.size() ; j++) {
         V_Horario h =  new V_Horario();
                
         if (List_H[i][0].equals(h.getDia_horario())) {
         if (g==0) {
         out.println(List_H[i][1]);
         }
                   
         g++;
         }
         out.println(h.getHo_desde());
         }
         }*/
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        if (opc.equals("REGISTRAR HORARIO")) {

            String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");
            String ID_DGP = request.getParameter("IDDETALLE_DGP");
            String ES_DETALLE_HORARIO = "1";
            //  String US_MODIFICACION = request.getParameter("USER_MODIFICACION");
            // String FE_MODIFICACION = request.getParameter("FECHA_MODIFICACION");
            String ES_HORARIO = "1";
            String ID_TRABAJJADOR = request.getParameter("idtr");

            IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, ID_DGP, ES_DETALLE_HORARIO, iduser, null, null, null);

            ID_DETALLE_HORARIO = IHor.Max_id_Detalle_Horario();

            for (int i = 0; i < dia.size(); i++) {
                for (int j = 0; j < 10; j++) {
                    String hora_desde = request.getParameter("HORA_DESDE_" + dia.get(i) + j);
                    String hora_hasta = request.getParameter("HORA_HASTA_" + dia.get(i) + j);
                    String d = request.getParameter("DIA_" + dia.get(i) + j);

                    if (hora_desde != null & d != null & hora_hasta != null) {
                        if (!hora_hasta.equals("") & !hora_desde.equals("") & !d.equals("")) {
                            IHor.Insert_Horario(null,
                                    hora_desde,
                                    hora_hasta,
                                    d,
                                    ES_HORARIO,
                                    ID_DETALLE_HORARIO);
                        }
                    }
                }

            }

            getServletContext().setAttribute("List_V_Horario", IHor.List_V_Horario(ID_DGP));
            getServletContext().setAttribute("List_H", Ilis.List_H());
//out.print(ID_DGP);
            response.sendRedirect("Vista/Dgp/Horario/Detalle_Horario.jsp?iddgp=" + ID_DGP + "&idtr=" + ID_TRABAJJADOR + "&P2=1");
        }

        if (opc.equals("Listar")) {
            String ID_DGP = request.getParameter("iddgp");
            getServletContext().setAttribute("List_V_Horario", IHor.List_V_Horario(ID_DGP));
            getServletContext().setAttribute("List_H", Ilis.List_H());

            response.sendRedirect("Vista/Dgp/Horario/Detalle_Horario.jsp");

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
