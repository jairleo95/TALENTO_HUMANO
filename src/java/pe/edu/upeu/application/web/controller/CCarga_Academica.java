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
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.Carga_AcademicaDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.Tipo_DocumentoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UbigeoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUbigeoDAO;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.factory.WSClienteAcademico;
import pe.edu.upeu.application.model.DGP;
import pe.edu.upeu.application.model.V_Detalle_Carga_Academica;

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Map<String, Object> rpta = new HashMap<String, Object>();

        InterfaceCarga_AcademicaDAO carga = new Carga_AcademicaDAO();
        InterfaceTrabajadorDAO tr = new TrabajadorDAO();
        InterfaceListaDAO li = new ListaDAO();
        InterfaceUbigeoDAO ub = new UbigeoDAO();
        InterfaceDireccionDAO dir = new DireccionDAO();
        InterfaceTipo_DocumentoDAO tdoc = new Tipo_DocumentoDAO();
        String opc = request.getParameter("opc");
        InterfaceRequerimientoDAO IReq = new RequerimientoDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        HttpSession sesion = request.getSession(true);
        String iduser = (String) sesion.getAttribute("IDUSER");
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String semestre = request.getParameter("semestre");
        try {
            if (opc.equals("validateTrabajador")) {
                String dni = request.getParameter("nro_doc");
                String idtr = carga.DNI_ID_TRABAJADOR(dni);
                rpta.put("validateData", (!idtr.equals("")));
                rpta.put("status", true);
            }
            if (opc.equals("Completar_Datos")) {
                String eap = request.getParameter("eap");
                String facu = request.getParameter("facultad");
                String dni = request.getParameter("nro_doc");
                String idtr = carga.DNI_ID_TRABAJADOR(dni);
                if (idtr.equals("")) {
                    sesion.setAttribute("List_Carrera", li.List_Carrera());
                    sesion.setAttribute("List_Nacionalidad", li.List_Nacionalidad());
                    sesion.setAttribute("List_Universidad", li.List_Universidad());
                    sesion.setAttribute("List_Departamento", ub.List_Departamento());
                    sesion.setAttribute("List_Situacion_Educativa", li.List_Situacion_Educativa());
                    sesion.setAttribute("Listar_via", dir.Listar_via());
                    sesion.setAttribute("Listar_zona", dir.Listar_zona());
                    sesion.setAttribute("Listar_tipo_doc", tdoc.Listar_tipo_doc());
                    sesion.setAttribute("list_año", li.lista_años());

                    String no_trabajador = request.getParameter("no_tr");
                    String ap_p = request.getParameter("ap_p");
                    String ap_m = request.getParameter("ap_m");
                    String ti_doc = request.getParameter("ti_doc");
                    response.sendRedirect("Vista/Trabajador/Reg_Trabajador.jsp?nro_doc=" + dni + "&ap_p=" + ap_p + "&ap_m=" + ap_m + "&ti_doc=" + ti_doc + "&no_tr=" + no_trabajador);
                } else {
                    String hl = request.getParameter("hl");
                    sesion.setAttribute("ListaridTrabajador", tr.ListaridTrabajador(idtr));
                    sesion.setAttribute("Lista_detalle_academico", carga.Lista_detalle_academico(idtr, facu, eap, "", ""));
                    //response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?" + "id=" + cripto.Encriptar("idtr:" + idtr));
                    response.sendRedirect("Vista/Trabajador/Detalle_Trabajador.jsp?" + "idtr=" + idtr + "&academico=true" + "&hl=" + hl + "&eap=" + eap + "&facultad=" + facu);
                }
            }
            if (opc.equals("Procesar")) {
                String iddgp = request.getParameter("dgp");
                String idpro = request.getParameter("proceso");
                carga.PROCESAR_CARGA_ACADEMICA(idpro, iddgp);
                rpta.put("rpta", true);
            }
            if (opc.equals("Reporte_Carga_Academica")) {
                sesion.setAttribute("ListCarAca", carga.ListCarAca());
                response.sendRedirect("Vista/Academico/Carga_Academica/Rep_Carga_Academica.jsp");
            }

            if (opc.equals("Registrar_CA")) {
                /*Registrar proceso de carga academica*/
                double CA_TIPO_HORA_PAGO = Double.parseDouble(request.getParameter("TI_HORA_PAGO"));
                double CA_TOTAL_HL = Double.parseDouble(request.getParameter("HL"));
                String FE_DESDE = FactoryConnectionDB.convertFecha3(request.getParameter("DESDE"));
                String FE_HASTA = FactoryConnectionDB.convertFecha3(request.getParameter("HASTA"));
                int numero = Integer.parseInt(request.getParameter("num_itera"));
                String ID_TRABAJADOR = request.getParameter("IDTR");
                String eap = request.getParameter("eap");
                String facultad = request.getParameter("facultad");
                /* REGISTRAR REQUERIMIENTO*/
                DGP d = new DGP();
                d.setFe_desde(FE_DESDE);
                d.setFe_hasta(FE_HASTA);
                d.setId_puesto("PUT-000482");
                d.setId_requerimiento("REQ-0018");
                d.setId_trabajador(ID_TRABAJADOR);
                d.setIp_usuario(FactoryConnectionDB.detalle_ip());
                d.setUs_creacion(iduser);
                String iddgp = carga.insertDGP(d);
                /*PROCESO CARGA ACADEMICA*/
                String ID_PROCESO_CARGA_AC = carga.INSERT_PROCESO_CARGA_ACADEMICA(null, null, CA_TIPO_HORA_PAGO, CA_TOTAL_HL, FE_DESDE, FE_HASTA, "0", iduser, null, null, null,
                        FactoryConnectionDB.detalle_ip(), iduser, iddgp.trim());

                /*CUOTAS PAGO DOCENTE*/
                for (int i = 1; i <= numero; i++) {
                    /*pago docente (iterar)*/
                    String NU_CUOTA = "" + i;
                    double CA_CUOTA = Double.parseDouble(request.getParameter("MES" + i));
                    /*CORREGIR FECHAS*/
                    String FE_PAGO = request.getParameter("FECHA" + i);
                    carga.INSERT_PAGO_DOCENTE(null, NU_CUOTA, CA_CUOTA, FE_PAGO, null, ID_PROCESO_CARGA_AC.trim(), null, null, null, FactoryConnectionDB.detalle_ip(), iduser);
                }
                /*DETALLE CARGA ACADEMICA*/
                List<V_Detalle_Carga_Academica> lCargaAcad = carga.Lista_detalle_academico(ID_TRABAJADOR, facultad, eap, "", "");
                for (int i = 0; i < lCargaAcad.size(); i++) {
                    carga.INSERT_DETALLE_CARGA_ACADEMICA(null, ID_PROCESO_CARGA_AC.trim(), lCargaAcad.get(i).getId_carga_academica(), "1");
                }
                String idrp = IReq.id_det_req_proc(iddgp.trim());
                /* REGISTRAR PRIMERA AUTORIZACION*/
                List<String> list = a.Det_Autorizacion(idrp);
                a.Insert_Autorizacion("", iddgp.trim(), "1", "P1", "", iduser, "", "", "", list.get(1).trim(), idrp.trim(), list.get(0));

                rpta.put("dgp", iddgp);
                rpta.put("proceso", idrp);
                rpta.put("rpta", true);
            }
            if (opc.equals("getDetCargaAcademica")) {
                String eap = request.getParameter("eap");
                String facu = request.getParameter("facultad");
                String dni = request.getParameter("nro_doc");
                String ciclo = request.getParameter("ciclo");
                String idtr = request.getParameter("idtr");
                rpta.put("list", carga.Lista_detalle_academico(idtr, facu, eap, ciclo, dni));
            }
            if (opc.equals("List_ws")) {
                rpta.put("List_ws", carga.List_Carga_Academica_WS(semestre));
            }
            if (opc.equals("listEsCargaAcademica")) {
                rpta.put("list", dgp.LIST_DGP_PROCESO(iddep, "", true));
            }
            if (opc.equals("actualizar_ws")) {
                //WSClienteAcademico ws = new WSClienteAcademico();
                try {
                    //ws.start_ws_academico(semestre);
                    rpta.put("lista", carga.actualizar_Carga_Academica(semestre));
                    rpta.put("rpta", true);
                } catch (Exception e) {
                    rpta.put("rpta", false);
                    rpta.put("mensaje", e.getMessage());
                }

            }

        } catch (Exception e) {
            rpta.put("rpta", false);
            rpta.put("mensaje", e.getMessage());
        } finally {
            Gson gson = new Gson();
            out.print(gson.toJson(rpta));
            out.flush();
            out.close();
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
