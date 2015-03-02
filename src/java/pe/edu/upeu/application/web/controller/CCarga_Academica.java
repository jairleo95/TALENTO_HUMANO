/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.Carga_AcademicaDAO;
import pe.edu.upeu.application.dao.Carrera_UniversidadDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.Tipo_DocumentoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarrera_UniversidadDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;

/**
 *
 * @author ALFA 3
 */
public class CCarga_Academica extends HttpServlet {

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
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        InterfaceCarga_AcademicaDAO carga = new Carga_AcademicaDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceListaDAO li = new ListaDAO();
        InterfaceUbigeoDAO ub = new UbigeoDAO();
        InterfaceDireccionDAO dir = new DireccionDAO();
        InterfaceCarrera_UniversidadDAO cu = new Carrera_UniversidadDAO();
        InterfaceTipo_DocumentoDAO tdoc = new Tipo_DocumentoDAO();
        String opc = request.getParameter("opc");
        CCriptografiar cripto = new CCriptografiar();
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        if (opc.equals("Completar_Datos")) {

            String dni = request.getParameter("nro_doc");
            String idtr = carga.DNI_ID_TRABAJADOR(dni);
            if (idtr.equals("")) {

                getServletContext().setAttribute("List_Carrera", li.List_Carrera());
                getServletContext().setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                getServletContext().setAttribute("List_Universidad", li.List_Universidad());
                getServletContext().setAttribute("List_Departamento", ub.List_Departamento());
                getServletContext().setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                getServletContext().setAttribute("Listar_via", dir.Listar_via());
                getServletContext().setAttribute("Listar_zona", dir.Listar_zona());
                getServletContext().setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                getServletContext().setAttribute("list_año", li.lista_años());

                String no_trabajador = request.getParameter("no_tr");
                String ap_p = request.getParameter("ap_p");
                String ap_m = request.getParameter("ap_m");
                String ti_doc = request.getParameter("ti_doc");

                response.sendRedirect("Vista/Trabajador/Reg_Trabajador.jsp?nro_doc=" + dni + "&ap_p=" + ap_p + "&ap_m=" + ap_m + "&ti_doc=" + ti_doc + "&no_tr=" + no_trabajador);

            } else {
                String hl = request.getParameter("hl");
                getServletContext().setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                //response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?" + "id=" + cripto.Encriptar("idtr:" + idtr));
                response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?" + "idtr=" + idtr + "&academico=true" + "&hl=" + hl);
            }
        }
        if (opc.equals("Registrar_CA")) {
            /*Registrar proceso de carga academica*/
            double CA_TIPO_HORA_PAGO = Double.parseDouble(request.getParameter("CA_TIPO_HORA_PAGO"));
            double CA_TOTAL_HL = Double.parseDouble(request.getParameter("CA_TOTAL_HL"));
            String FE_DESDE = request.getParameter("FE_DESDE");
            String FE_HASTA = request.getParameter("FE_HASTA");
            String ES_PROCESADO = request.getParameter("ES_PROCESADO");
            String FE_CREACION = request.getParameter("FE_CREACION");
            String US_MODIF = request.getParameter("US_MODIF");
            String FE_MODIF = request.getParameter("FE_MODIF");
            String IP_USUARIO = request.getParameter("IP_USUARIO");
            String NO_USUARIO = request.getParameter("NO_USUARIO");
            String ID_PROCESO_CARGA_AC = carga.INSERT_PROCESO_CARGA_ACADEMICA(null, null, CA_TIPO_HORA_PAGO, CA_TOTAL_HL, FE_DESDE, FE_HASTA, ES_PROCESADO, iduser, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, NO_USUARIO);
            int numero = Integer.parseInt(request.getParameter("num_itera"));
            for (int i = 1; i < numero; i++) {
                /*pago docente (iterar)*/
                String NU_CUOTA = request.getParameter("CUOTA" + i);
                Double CA_CUOTA = Double.parseDouble(request.getParameter("CANTIDAD" + i));
                String FE_PAGO = request.getParameter("FECHA" + i);
                /*FALTA US_CREACION*/
                carga.INSERT_PAGO_DOCENTE(null, NU_CUOTA, CA_CUOTA, FE_PAGO, null, ID_PROCESO_CARGA_AC, null, US_MODIF, FE_MODIF, IP_USUARIO, NO_USUARIO);
            }

            /* REGISTRAR REQUERIMIENTO*/
            double CA_SUELDO = Double.parseDouble(request.getParameter("CA_SUELDO"));
            String DE_DIAS_TRABAJO = request.getParameter("DE_DIAS_TRABAJO");
            String ID_PUESTO = request.getParameter("ID_PUESTO");
            String ID_REQUERIMIENTO = request.getParameter("ID_REQUERIMIENTO");
            String ID_TRABAJADOR = request.getParameter("ID_TRABAJADOR");
            String CO_RUC = request.getParameter("CO_RUC");
            String DE_LUGAR_SERVICIO = request.getParameter("DE_LUGAR_SERVICIO");
            String DE_SERVICIO = request.getParameter("DE_SERVICIO");
            String DE_PERIODO_PAGO = request.getParameter("DE_PERIODO_PAGO");
            String DE_DOMICILIO_FISCAL = request.getParameter("DE_DOMICILIO_FISCAL");
            String DE_SUBVENCION = request.getParameter("DE_SUBVENCION");
            String DE_HORARIO_CAPACITACION = request.getParameter("DE_HORARIO_CAPACITACION");
            String DE_HORARIO_REFRIGERIO = request.getParameter("DE_HORARIO_REFRIGERIO");
            String DE_DIAS_CAPACITACION = request.getParameter("DE_DIAS_CAPACITACION");
            String ES_DGP = request.getParameter("ES_DGP");
            String US_CREACION = request.getParameter("US_CREACION");
            double CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("CA_BONO_ALIMENTARIO"));
            double DE_BEV = Double.parseDouble(request.getParameter("DE_BEV"));
            String DE_ANTECEDENTES_POLICIALES = request.getParameter("DE_ANTECEDENTES_POLICIALES");
            String ES_CERTIFICADO_SALUD = request.getParameter("ES_CERTIFICADO_SALUD");
            String DE_MONTO_HONORARIO = request.getParameter("DE_MONTO_HONORARIO");
            String FE_CESE = request.getParameter("FE_CESE");
            String FE_RECEPCION = request.getParameter("FE_RECEPCION");
            String MO_RENUNCIA = request.getParameter("MO_RENUNCIA");
            double DI_ADQUIRIDOS = Double.parseDouble(request.getParameter("DI_ADQUIRIDOS"));
            double DI_CONSUMIDOS = Double.parseDouble(request.getParameter("DI_CONSUMIDOS"));
            double DI_POR_CONSUMIR = Double.parseDouble(request.getParameter("DI_POR_CONSUMIR"));
            String ES_VACACIONES = request.getParameter("ES_VACACIONES");
            String LI_MOTIVO = request.getParameter("LI_MOTIVO");
            String ES_MFL = request.getParameter("ES_MFL");
            double CA_BONIFICACION_P = Double.parseDouble(request.getParameter("CA_BONIFICACION_P"));
            String iddgp = carga.INSERT_DGP(null, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO, DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION, ES_DGP, US_CREACION, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, DE_ANTECEDENTES_POLICIALES, ES_CERTIFICADO_SALUD, DE_MONTO_HONORARIO, FE_CESE, FE_RECEPCION, MO_RENUNCIA, DI_ADQUIRIDOS, DI_CONSUMIDOS, DI_POR_CONSUMIR, ES_VACACIONES, LI_MOTIVO, ES_MFL, CA_BONIFICACION_P, ID_PROCESO_CARGA_AC);
            String idrp = IReq.id_det_req_proc(iddgp);
            /* REGISTRAR PRIMERA AUTORIZACION*/
            List<String> list = a.Det_Autorizacion(idrp);
            a.Insert_Autorizacion(null, iddgp, "1", "P1", "", iduser, "", "", "", list.get(1), idrp, list.get(0));

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
