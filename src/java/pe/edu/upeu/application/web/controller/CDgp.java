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
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao.HorarioDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;

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
        String idpuesto = (String) sesion.getAttribute("PUESTO_ID");
        String iduser = (String) sesion.getAttribute("IDUSER");
        String idtr = request.getParameter("idtr");
        // String iddepa = request.getParameter("iddep");
        String idreq = request.getParameter("idreq");

        InterfacePuestoDAO pu = new PuestoDAO();
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        InterfaceUsuarioDAO us = new UsuarioDAO();
        InterfaceAreaDAO area = new AreaDAO();
        String opc = request.getParameter("opc");
        InterfaceHorarioDAO IHor = new HorarioDAO();
        InterfaceListaDAO Ilis = new ListaDAO();
         InterfaceDocumentoDAO doc = new DocumentoDAO();

        //try {
        if (opc.equals("Registrar")) {
            String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");
            double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
            String DE_DIAS_TRABAJO = request.getParameter("DIAS_TRABAJO");
            String ID_PUESTO = request.getParameter("IDPUESTO");
            String ID_REQUERIMIENTO = request.getParameter("IDREQUERIMIENTO");
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            String CO_RUC = request.getParameter("RUC");
            String DE_LUGAR_SERVICIO = request.getParameter("LUGAR_SERVICIO");
            String DE_SERVICIO = request.getParameter("DESCRIPCION_SERVICIO");
            String DE_PERIODO_PAGO = request.getParameter("PERIODO_PAGO");
            String DE_DOMICILIO_FISCAL = request.getParameter("DOMICILIO_FISCAL");
            String DE_SUBVENCION = request.getParameter("SUBVENCION");
            String DE_HORARIO_CAPACITACION = request.getParameter("HORARIO_CAPACITACION");
            String DE_HORARIO_REFRIGERIO = request.getParameter("HORARIO_REFRIGERIO");
            String DE_DIAS_CAPACITACION = request.getParameter("DIAS_CAPACITACION");
            String ES_DGP = "";
            String FE_CREACION = request.getParameter("FECHA_CREACION");
            String US_MODIF = request.getParameter("USER_MODIF");
            String FE_MODIF = request.getParameter("FECHA_MODIF");
            String IP_USUARIO = request.getParameter("USUARIO_IP");
            double CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("BONO_ALIMENTARIO"));
            double DE_BEV = Double.parseDouble(request.getParameter("BEV"));
            double CA_CENTRO_COSTOS = Double.parseDouble(request.getParameter("CENTRO_COSTOS"));
            String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
            String DE_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
            String DE_MONTO_HONORARIO = request.getParameter("MONTO_HONORARIO");
            String NO_BANCO = request.getParameter("BANCO");
            String NU_CUENTA = request.getParameter("CUENTA");
            String NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
            
            String ES_GEN_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") ==null)?"0":"1";
            

            dgp.INSERT_DGP(null, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO, DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION, ES_DGP, iduser, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, CA_CENTRO_COSTOS, DE_ANTECEDENTES_POLICIALES, DE_CERTIFICADO_SALUD, DE_MONTO_HONORARIO, NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEN_NU_CUENTA);

            String iddgp = dgp.MAX_ID_DGP();
            String idrp = IReq.id_det_req_proc(iddgp);
            List<String> list = a.Det_Autorizacion(idrp);
            a.Insert_Autorizacion("", iddgp, "1", "P1", "12312", iduser, "", "31/07/14", "3213", list.get(1), idrp, list.get(0));
            //HORARIO
            List<String> dia = new ArrayList<String>();
            dia.add("lun");
            dia.add("mar");
            dia.add("mie");
            dia.add("jue");
            dia.add("vie");
            dia.add("dom");

            String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");

            String ES_DETALLE_HORARIO = "1";
            String ES_HORARIO = "1";

            IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, iddgp, ES_DETALLE_HORARIO, iduser, null, null, null);

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

            getServletContext().setAttribute("List_doc_req_pla", doc.List_doc_req_pla(iddgp, ID_TRABAJADOR));
            int i = doc.List_Req_nacionalidad(ID_TRABAJADOR);
            int num_ad = doc.List_Adventista(ID_TRABAJADOR);
            getServletContext().setAttribute("List_Hijos", doc.List_Hijos(ID_TRABAJADOR));
            getServletContext().setAttribute("List_Conyugue", doc.List_Conyugue(ID_TRABAJADOR));

            response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad + "&pro=pr_dgp");
            // response.sendRedirect("Vista/Dgp/Horario/Reg_Horario.jsp?iddgp=" + iddgp + "&idtr=" + ID_TRABAJADOR + "&opc=rd");

        }
        if (opc.equals("Reg_form")) {

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

            getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
            getServletContext().setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
            getServletContext().setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
            response.sendRedirect("Vista/Dgp/Reg_Dgp.jsp?idreq=" + idreq);
        }

        if (opc.equals("rd")) {

            String ID_DGP = request.getParameter("iddgp");
            String ID_TRABAJADOR = request.getParameter("idtr");
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
            int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("LIST_ID_USER", us.List_ID_User(iduser));
            out.print(ID_DGP);

            response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&iddgp=" + ID_DGP + "&opc=reg_doc");
        }
        if (opc.equals("filtrar")) {

            getServletContext().setAttribute("List_Area", area.List_Area_ID(iddep));
            //    int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());

            response.sendRedirect("Vista/Dgp/Busc_Req_Autorizado.jsp");
        }
        if (opc.equals("Detalle")) {

            String ID_DGP = request.getParameter("iddgp");
            String ID_TRABAJADOR = request.getParameter("idtr");
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
            int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("LIST_ID_USER", us.List_ID_User(iduser));

            response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&idgp=" + ID_DGP);
        }
        if (opc.equals("Seguimiento")) {
            String iddgp = request.getParameter("iddgp");
            String idrp = IReq.id_det_req_proc(iddgp);
            getServletContext().setAttribute("Det_Autorizacion", a.List_Detalle_Autorizacion(iddgp, idrp));

            response.sendRedirect("Vista/Dgp/Detalle_Seguimiento_Dgp.jsp");
        }
        if (opc.equals("Proceso")) {
            getServletContext().setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep));
            response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");
        }
        if (opc.equals("User_Aut")) {
            String iddgp = request.getParameter("iddgp");
            getServletContext().setAttribute("USER_DGP", dgp.USER_DGP(iddgp));

            response.sendRedirect("Vista/Dgp/User_Dgp.jsp");
        }
        if (opc.equals("List_Dgp_Tr")) {

            getServletContext().setAttribute("LIST_ID_TRAB_DGP", dgp.LIST_ID_TRAB_DGP(idtr));
            response.sendRedirect("Vista/Trabajador/List_Dgp_Trabajador.jsp");
        }
        if (opc.equals("Terminar")) {
            String iddgp = request.getParameter("iddgp");
            dgp.REG_DGP_FINAL(iddgp);
            getServletContext().setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep));
            response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");
        }

        if (opc.equals("Listar")) {

            getServletContext().setAttribute("List_Det_Dgp", dgp.LIST_DET_DGP(iddep));

            // out.print(Idgp.LIST_DET_DGP(iddep).size());
            response.sendRedirect("Vista/Dgp/List_Dgp.jsp?iddep");

        }
        if (opc.equals("MODIFICAR REQUERIMIENTO")) {
            String iddgp = request.getParameter("iddgp");
            out.println(idtr + " " + iddgp + "" + idreq + "" + iddep + "" + idpuesto);
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(iddgp));
            getServletContext().setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
            getServletContext().setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
            getServletContext().setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
            response.sendRedirect("Vista/Dgp/Mod_DGP.jsp?idreq=" + idreq);
        }
        if (opc.equals("MODIFICAR")) {
            String ID_DGP = request.getParameter("ID_DGP");
            String FE_DESDE = request.getParameter("FEC_DESDE");
            String FE_HASTA = request.getParameter("FEC_HASTA");
            double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
            String ID_PUESTO = request.getParameter("IDPUESTO");
            String ID_REQUERIMIENTO = request.getParameter("IDREQUERIMIENTO");
            double CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("BONO_ALIMENTARIO"));
            double DE_BEV = Double.parseDouble(request.getParameter("BEV"));
            double CA_CENTRO_COSTOS = Double.parseDouble(request.getParameter("CENTRO_COSTOS"));
            String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
            String DE_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
            dgp.MOD_REQUE(ID_DGP, FE_DESDE, FE_HASTA, CA_SUELDO, ID_PUESTO, ID_REQUERIMIENTO, CA_BONO_ALIMENTARIO, DE_BEV, CA_CENTRO_COSTOS, DE_ANTECEDENTES_POLICIALES, DE_CERTIFICADO_SALUD);
            String ID_TRABAJADOR = request.getParameter("IDDATOS_TRABAJADOR");
            getServletContext().setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
            int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
            getServletContext().setAttribute("LIST_ID_USER", us.List_ID_User(iduser));
            response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&iddgp=" + ID_DGP);
        }
        if (opc.equals("Incompleto")) {
            getServletContext().setAttribute("List_Incomplet", dgp.List_Incomplet(iddep));
            response.sendRedirect("Vista/Dgp/List_req_incompl.jsp");
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
