/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import static oracle.security.o3logon.b.a;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;

/**
 *
 * @author Admin
 */
public class CDgp extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        /*Declaramos*/
        HttpSession sesion = request.getSession(true);
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String idtr = request.getParameter("idtr");
        String iddepa = request.getParameter("iddep");
        String idreq = request.getParameter("idreq");
        InterfacePuestoDAO pu = new PuestoDAO();
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceDgpDAO dgp = new DgpDAO();

        String opc = request.getParameter("opc");

        //try {
        if (opc.equals("Registrar")) {
            String ID_DGP = request.getParameter("ID_DGP");
            /*String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");*/
            String FE_DESDE = "12/10/95";
            String FE_HASTA = "12/10/95";
          
            String CA_SUELDO = request.getParameter("CA_SUELDO");
            String DE_DIAS_TRABAJO = request.getParameter("DE_DIAS_TRABAJO");
            String ID_PUESTO = request.getParameter("IDPUESTO");
            String ID_REQUERIMIENTO = request.getParameter("IDREQUERIMIENTO");
            String ID_TRABAJADOR = request.getParameter("ID_TRABAJADOR");
            String CO_RUC = request.getParameter("RUC");
            String DE_LUGAR_SERVICIO = request.getParameter("LUGAR_SERVICIO");
            String DE_SERVICIO = request.getParameter("DESCRIPCION_SERVICIO");
            String DE_PERIODO_PAGO = request.getParameter("PERIODO_PAGO");
            String DE_DOMICILIO_FISCAL = request.getParameter("DOMICILIO_FISCAL");
            String DE_SUBVENCION = request.getParameter("SUBVENCION");
            String DE_HORARIO_CAPACITACION = request.getParameter("HORARIO_CAPACITACION");
            String DE_HORARIO_REFRIGERIO = request.getParameter("HORARIO_REFRIGERIO");
            String DE_DIAS_CAPACITACION = request.getParameter("DIAS_CAPACITACION");
            String ES_DGP = request.getParameter("ES_DGP");
            String US_CREACION = request.getParameter("USER_CREACION");
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("USER_MODIF");
            String FE_MODIF = request.getParameter("FECHA_MODIF");
            String IP_USUARIO = request.getParameter("USUARIO_IP");
            String CA_BONO_ALIMENTARIO = request.getParameter("BONO_ALIMENTARIO");
            String DE_BEV = request.getParameter("BEV");
            String CA_CENTRO_COSTOS = request.getParameter("CENTRO_COSTOS");
            String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
            String DE_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
            String DE_MONTO_HONORARIO = request.getParameter("MONTO_HONORARIO");
            dgp.INSERT_DGP(ID_DGP, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO, DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION, ES_DGP, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, CA_CENTRO_COSTOS, DE_ANTECEDENTES_POLICIALES, DE_CERTIFICADO_SALUD, DE_MONTO_HONORARIO);
        out.println("asdasdfasdfsdf");

        } if(opc.equals("Reg_form")) {

            getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
            /* TEMPORAL*/
            if (idreq.equals("1")) {
                idreq = "REQ-0001";
            }
            if (idreq.equals("2")) {
                idreq = "REQ-0002";
            }
            if (idreq.equals("3")) {
                idreq = "REQ-0003";
            }

            /*  if (iddepa == null) {
             getServletContext().setAttribute("List_Puesto", pu.List_Puesto());
             } else*/
            //if{
            getServletContext().setAttribute("List_Puesto", pu.List_Puesto_Dep(iddepa));
            //}
            getServletContext().setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
           
            response.sendRedirect("Vista/Dgp/Reg_Dgp.jsp?idreq=" + idreq);
        }


        /* } finally {
         out.close();
         }*/
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
