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
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AreaDAO;
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.Centro_CostoDAO;
import pe.edu.upeu.application.dao.ContratoDAO;
import pe.edu.upeu.application.dao.Datos_Hijo_TrabajadorDAO;
import pe.edu.upeu.application.dao.Detalle_Centro_Costo_DAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao.FuncionDAO;
import pe.edu.upeu.application.dao.GrupoOcupacionesDAO;
import pe.edu.upeu.application.dao.HorarioDAO;
import pe.edu.upeu.application.dao.ListaDAO;
import pe.edu.upeu.application.dao.Periodo_PagoDAO;
import pe.edu.upeu.application.dao.Plazo_DgpDAO;
import pe.edu.upeu.application.dao.PresupuestoDAO;
import pe.edu.upeu.application.dao.PuestoDAO;
import pe.edu.upeu.application.dao.RequerimientoDAO;
import pe.edu.upeu.application.dao.TrabajadorDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAreaDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCentro_CostosDAO;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDatos_Hijo_Trabajador;
import pe.edu.upeu.application.dao_imp.InterfaceDetalle_Centro_Costo;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceFuncionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceGrupo_ocupacionesDAO;
import pe.edu.upeu.application.dao_imp.InterfaceHorarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.dao_imp.InterfacePeriodo_PagoDAO;
import pe.edu.upeu.application.dao_imp.InterfacePlazo_DgpDAO;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfacePuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceRequerimientoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceTrabajadorDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;
import pe.edu.upeu.application.properties.UserMachineProperties;
import pe.edu.upeu.application.util.DateFormat;

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
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        /*Declaramos*/
        HttpSession sesion = request.getSession(true);
        String iddir = (String) sesion.getAttribute("IDDIR");
        String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
        String idpuesto = (String) sesion.getAttribute("PUESTO_ID");
        String iduser = (String) sesion.getAttribute("IDUSER");
        String idrol = (String) sesion.getAttribute("IDROL");
        String idtr = request.getParameter("idtr");
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
        InterfaceDocumentoDAO doc = new DocumentoDAO();
        InterfaceDetalle_Centro_Costo dcc = new Detalle_Centro_Costo_DAO();
        Map<String, Object> rpta = new HashMap<String, Object>();
        InterfacePuestoDAO puesto = new PuestoDAO();
        InterfaceContratoDAO con = new ContratoDAO();
        InterfaceCentro_CostosDAO cc = new Centro_CostoDAO();
        InterfaceDatos_Hijo_Trabajador dht = new Datos_Hijo_TrabajadorDAO();
        InterfaceGrupo_ocupacionesDAO gr = new GrupoOcupacionesDAO();
        InterfacePlazo_DgpDAO plazo = new Plazo_DgpDAO();
        InterfaceFuncionDAO fu = new FuncionDAO();
        InterfaceListaDAO l = new ListaDAO();
        InterfaceUsuarioDAO usu = new UsuarioDAO();
        InterfaceDireccionDAO dir = new DireccionDAO();
        InterfacePeriodo_PagoDAO pp = new Periodo_PagoDAO();
        InterfacePresupuestoDAO pd = new PresupuestoDAO();
        /*Permisoss*/
        boolean permisoAdmin = false;
        boolean permissionDireccionFilter = false;
        boolean permissionDepartFilter = false;
        boolean permissionPuestoFilter = false;
        boolean RegDGPAditionalPermissions = false;
        switch (idrol) {
            case "ROL-0001":
                // permissionDireccionFilter = true;
                permissionDepartFilter = true;
                permisoAdmin = true;
                RegDGPAditionalPermissions = true;
                break;
            case "ROL-0008":
                permisoAdmin = false;
                permissionDireccionFilter = true;
                //permissionDepartFilter = true;
                break;
            case "ROL-0010":
                permissionPuestoFilter = true;
                break;
            case "ROL-0003":
                RegDGPAditionalPermissions = true;
                break;
            case "ROL-0019":
                permissionDireccionFilter = true;
                break;
            default:
                permissionDepartFilter = true;
                permisoAdmin = false;
                break;
        }
        
        //PARA QUE EL RECTOR PUEDA VISUALIZAR TODOS LOS ESTADOS DE REQUERIMIENTOS DESCOMENTAR LA LINEA QUE ESTÁ DENTRO DE LA CONDICIONAL IF, 
        //VOLVER A COMENTAR PARA QUE EL RECTOR TENGA SUS PRIVILEGIOS POR DEFECTO//
        if(idpuesto.equals("PUT-000649")/*||idpuesto.equals("PUT-000638")*/){
            permisoAdmin = true;
        }
        try {

            if (opc.equals("Listar_Req")) {
                String id_tr = request.getParameter("idtr");
                List<Map<String, ?>> lista = dgp.list_Req(id_tr);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Listar_Datos")) {
                String id_c = request.getParameter("idc");
                List<Map<String, ?>> lista = dgp.Cargar_Datos_Dgp(id_c);
                rpta.put("rpta", "1");
                rpta.put("lista", lista);
            }
            if (opc.equals("Val_Fe_Inicio")) {
                String fecha = request.getParameter("fecha");
                String newFormat = DateFormat.toFormat3(fecha);
                System.out.println("new format :" + newFormat);
                boolean respuesta = dgp.val_fe_inicio_dgp(newFormat);
                rpta.put("rpta", "1");
                rpta.put("estado", respuesta);
            }
            if (opc.equals("RegDGPAditionalPermissions")) {

                String htmlFilterAnyJobs = "";

                if (RegDGPAditionalPermissions) {
                    htmlFilterAnyJobs += "<div class='row'>";
                    htmlFilterAnyJobs += "<section class='col col-md-6' >";
                    htmlFilterAnyJobs += "<label class='label' id='titu'> Dirección:</label>";
                    htmlFilterAnyJobs += "<label class='select'>";
                    htmlFilterAnyJobs += "<select  class='selectDireccion' required='' >";
                    htmlFilterAnyJobs += "<option value=''>[Seleccione]</option>  ";
                    htmlFilterAnyJobs += "   </select>";
                    htmlFilterAnyJobs += "  </label>";
                    htmlFilterAnyJobs += "   </section>";
                    htmlFilterAnyJobs += "  <section class='col col-md-6' >";
                    htmlFilterAnyJobs += "      <label class='label' id='titu'> Departamento:</label>";
                    htmlFilterAnyJobs += "    <label class='select'>";
                    htmlFilterAnyJobs += "  <select   class='selectDepartamento' required='' >";
                    htmlFilterAnyJobs += "  <option value=''>[Seleccione]</option>  ";
                    htmlFilterAnyJobs += "    </select>";
                    htmlFilterAnyJobs += " </label>";
                    htmlFilterAnyJobs += " </section>";
                    htmlFilterAnyJobs += "</div>";
                }
                rpta.put("filterAnyJobsHTML", htmlFilterAnyJobs);
                rpta.put("filterAnyJobs", RegDGPAditionalPermissions);

            }

            if (opc.equals("Registrar")) {
                String FE_DESDE = request.getParameter("FEC_DESDE");
                String FE_HASTA = request.getParameter("FEC_HASTA");
                double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
                double BONO_PUESTO = 0.0;
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
                String ES_DGP = "0";
                String FE_CREACION = request.getParameter("FECHA_CREACION");
                String US_MODIF = request.getParameter("USER_MODIF");
                String FE_MODIF = request.getParameter("FECHA_MODIF");
                String IP_USUARIO = request.getParameter("USUARIO_IP");
                double CA_BONO_ALIMENTARIO = 0.0;
                double DE_BEV = 0.0;
                double ASIGNACION_FAMILIAR = 0.0;
                //----CA_CENTRO_COSTOS NO EXISTE EN TABLA RHTM_DGP---
                /*Fuera de planilla*/
                if (ID_REQUERIMIENTO.equals("REQ-0007") || ID_REQUERIMIENTO.equals("REQ-0008") || ID_REQUERIMIENTO.equals("REQ-0009") || ID_REQUERIMIENTO.equals("REQ-0010") || ID_REQUERIMIENTO.equals("REQ-0011")) {
                    CA_BONO_ALIMENTARIO = 0.0;
                    DE_BEV = 0.0;
                    BONO_PUESTO = 0.0;
                    ASIGNACION_FAMILIAR = 0.0;
                } else {
                    /*dentro de planilla de planilla*/
                    if (request.getParameter("BONO_PUESTO") == null) {
                        BONO_PUESTO = 0.0;
                    } else {
                        BONO_PUESTO = Double.parseDouble(request.getParameter("BONO_PUESTO"));
                    }

                    if (request.getParameter("BONO_ALIMENTARIO") == null) {
                        CA_BONO_ALIMENTARIO = 0.0;
                    } else {
                        CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("BONO_ALIMENTARIO"));
                    }

                    if (request.getParameter("BEV") == null) {
                        DE_BEV = 0.0;
                    } else {
                        DE_BEV = Double.parseDouble(request.getParameter("BEV"));
                    }
                    if (request.getParameter("ASIGNACION_FAMILIAR") == null) {
                        ASIGNACION_FAMILIAR = 0.0;
                    } else {
                        ASIGNACION_FAMILIAR = Double.parseDouble(request.getParameter("ASIGNACION_FAMILIAR"));
                    }
                }
                String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
                String ES_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
                String DE_MONTO_HONORARIO = request.getParameter("MONTO_HONORARIO");
                //--INSERT TABLA_CUENTA_SUELDO
                String NO_BANCO = request.getParameter("BANCO");
                String NU_CUENTA = (request.getParameter("CUENTA") == null) ? "no tiene" : request.getParameter("CUENTA");
                String NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
                String ES_GEM_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") == null) ? "0" : "1";
                String NO_BANCO_OTROS = request.getParameter("BANCO_OTROS");
                String ES_CUENTA_SUELDO = request.getParameter("ES_CUENTA_SUELDO");
                //--
                int NUMERO = 0;
                int cantidad = 0;
                if (ID_REQUERIMIENTO.equals("REQ-0010") || ID_REQUERIMIENTO.equals("REQ-0011")) {
                    NUMERO = 0;
                    cantidad = Integer.parseInt(request.getParameter("CANT"));
                } else {
                    NUMERO = Integer.parseInt(request.getParameter("numero"));
                    cantidad = 0;
                }
                String LI_MOTIVO = request.getParameter("MOTIVO");
                String ES_MFL = request.getParameter("MFL");
                if (ES_MFL != null) {
                    ES_MFL = "1";
                } else {
                    ES_MFL = "0";
                }
                //campo nuevo - Presupuestado
                String ES_PRESUPUESTADO = request.getParameter("ES_PRESUPUESTADO");
                if (ES_PRESUPUESTADO != null) {
                    ES_PRESUPUESTADO = "1";
                } else {
                    ES_PRESUPUESTADO = "0";
                }
                FE_DESDE = DateFormat.toFormat3(FE_DESDE);
                FE_HASTA = DateFormat.toFormat3(FE_HASTA);
                out.println("Nueva fecha :" + DateFormat.toFormat1(FE_HASTA));

                dgp.INSERT_DGP(null, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO,
                        DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION,
                        ES_DGP, iduser, FE_CREACION, US_MODIF, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, DE_ANTECEDENTES_POLICIALES, ES_CERTIFICADO_SALUD,
                        DE_MONTO_HONORARIO, LI_MOTIVO, ES_MFL, BONO_PUESTO, ASIGNACION_FAMILIAR, ES_PRESUPUESTADO);
                String iddgp = dgp.MAX_ID_DGP();
                String ESTADO = request.getParameter("ESTADO");
                if (ESTADO != null) {
                    if (ESTADO.trim().equals("0")) {
                        tr.MOD_CUENTA_SUELDO(NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEM_NU_CUENTA, NO_BANCO_OTROS, ID_TRABAJADOR, ES_CUENTA_SUELDO);
                    }
                }
                String idrp = IReq.id_det_req_proc(iddgp);
                for (int i = 1; i <= cantidad; i++) {
                    String ID_PERIODO_PAG0 = null;
                    double NU_CUOTA = Double.parseDouble(request.getParameter("CUOTA_" + i));
                    String FE_PAGAR = request.getParameter("FEC_PAGAR_" + i);
                    double CA_MONTO = Double.parseDouble(request.getParameter("MONTO_" + i));
                    String ID_DGP = iddgp;
                    String ES_PER_PAGO = request.getParameter("ES_PERIODO");
                    pp.InsetarPeriodo_Pago(ID_PERIODO_PAG0, NU_CUOTA, FE_PAGAR, CA_MONTO, ID_DGP, ES_PER_PAGO);
                }
                System.out.println("Numero centro costo:" + NUMERO);
                for (int g = 1; g <= NUMERO; g++) {
                    String ID_CENTRO_COSTO = request.getParameter("CENTRO_COSTOS_" + g);
                    double porcentaje = Double.parseDouble(request.getParameter("PORCENTAJE_" + g));
                    if (ID_CENTRO_COSTO != null && porcentaje != 0.0) {
                        dcc.INSERT_DETALLE_CENTRO_COSTO(null, iddgp, porcentaje, "1", iduser, null, null, null, UserMachineProperties.getAll(), null, ID_CENTRO_COSTO);
                    }
                }
                List<String> list = a.Det_Autorizacion(idrp);
                System.out.println("Insertando autorizacion...");
                a.Insert_Autorizacion("", iddgp, "1", "P1", "12312", iduser, "", "", "", list.get(1), idrp, list.get(0));

                //HORARIO
                List<String> dia = new ArrayList<String>();
                dia.add("lun");
                dia.add("mar");
                dia.add("mie");
                dia.add("jue");
                dia.add("vie");
                dia.add("sab");
                dia.add("dom");
                String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");
                String ES_DETALLE_HORARIO = "1";
                String ES_HORARIO = "1";
                String ID_TIPO_HORARIO = request.getParameter("HORARIO");
                String ES_MOD_FORMATO = "1";
                Double horas_totales = Double.parseDouble(request.getParameter("h_total"));
                String id_d_hor = "";
                System.out.println("Insertando Horario...");
                id_d_hor = IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, iddgp, ES_DETALLE_HORARIO, iduser, null, null, null, ID_TIPO_HORARIO, ES_MOD_FORMATO, horas_totales);
                System.out.println("Insertando detalle horario...");
                System.out.println("dias totales:" + dia);
                for (int i = 0; i < dia.size(); i++) {
                    for (int j = 0; j < 10; j++) {

                        String hora_desde = request.getParameter("HORA_DESDE_" + dia.get(i) + j);

                        String hora_hasta = request.getParameter("HORA_HASTA_" + dia.get(i) + j);

                        String d = request.getParameter("DIA_" + dia.get(i) + j);

                        /*  System.out.println("dia:" + d);
                        System.out.println("desde:" + hora_desde);
                        System.out.println("hasta:" + hora_hasta);*/
                        if (hora_desde != null & d != null & hora_hasta != null) {
                            if (!hora_hasta.equals("") & !hora_desde.equals("") & !d.equals("")) {
                                hora_desde = parser24(hora_desde);
                                hora_hasta = parser24(hora_hasta);
                                IHor.Insert_Horario(null, hora_desde, hora_hasta, d, ES_HORARIO, id_d_hor);
                                //ifo.Insert_Formato_Horario(null, "T"+j, d, hora_desde, hora_hasta, "1", ID_TIPO_HORARIO);
                            }
                        }
                    }
                }
                response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?pro=pr_dgp&idtr=" + ID_TRABAJADOR + "&iddgp=" + iddgp);
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
                if (idreq.equals("7")) {
                    idreq = "REQ-0007";
                }
                if (idreq.equals("8")) {
                    idreq = "REQ-0008";
                }
                if (idreq.equals("9")) {
                    idreq = "REQ-0009";
                }
                if (idreq.equals("10")) {
                    idreq = "REQ-0010";
                }
                if (idreq.equals("11")) {
                    idreq = "REQ-0011";
                }

                String ES_CUENTA_SUELDO = tr.CuentaSueldoTra(idtr);

                while (ES_CUENTA_SUELDO == null) {

                    tr.INSERT_CUENTA_SUELDO(null, null, null, null, "0", null, idtr, "0");
                    ES_CUENTA_SUELDO = tr.CuentaSueldoTra(idtr);
                }

                sesion.setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
                sesion.setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
                sesion.setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
                sesion.setAttribute("list_Cuenta_Sueldo", dgp.LIST_CUEN_SUEL(idtr));
                sesion.setAttribute("fecha_maxima_plazo", plazo.fecha_maxima_plazo());

                response.sendRedirect("Vista/Dgp/Reg_Dgp.jsp?idreq=" + idreq + "&es_cs=" + ES_CUENTA_SUELDO + "&as_f=" + dht.ASIGNACION_F(idtr));
            }
            if (opc.equals("Reg_renuncia")) {
                //   String iddeph = request.getParameter("idep");
                /* TEMPORAL*/
                String Tipo_planilla = tr.tipo_planilla(idtr);
                if (Tipo_planilla.equals("TPL-0001")) {
                    idreq = "REQ-0015";
                }
                if (Tipo_planilla.equals("TPL-0002")) {
                    idreq = "REQ-0016";
                }
                if (Tipo_planilla.equals("TPL-0003")) {
                    idreq = "REQ-0017";
                }
            }

            if (opc.equals("rd")) {
                String ID_DGP = request.getParameter("iddgp");
                String ID_TRABAJADOR = request.getParameter("idtr");
                sesion.setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
                sesion.setAttribute("VALIDAR_DGP_CONTR", dgp.VALIDAR_DGP_CONTR(ID_DGP, idtr));
                sesion.setAttribute("Cargar_dcc_dgp", cc.Cargar_dcc_dgp(ID_DGP));
                int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
                sesion.setAttribute("LIST_ID_USER", us.List_ID_User(iduser));
                response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&iddgp=" + ID_DGP + "&opc=reg_doc");
            }
            if (opc.equals("filtrar")) {
                sesion.setAttribute("List_Area", area.List_Area_ID(iddep));
                sesion.setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
                response.sendRedirect("Vista/Dgp/Busc_Req_Autorizado.jsp");
            }
            if (opc.equals("Detalle")) {

                String autorizar = request.getParameter("contrato");
                if (autorizar == null) {
                    autorizar = "";
                }
                String ID_DGP = request.getParameter("iddgp");
                String ID_TRABAJADOR = request.getParameter("idtr");
                sesion.setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(ID_DGP));
                sesion.setAttribute("Cargar_dcc_dgp", cc.Cargar_dcc_dgp(ID_DGP));
                int num = dgp.VALIDAR_DGP_CONTR(ID_DGP, ID_TRABAJADOR);
                sesion.setAttribute("LIST_ID_USER", us.List_ID_User(iduser));

                if (idrol.trim().equals("ROL-0006") & autorizar.equals("true")) {
                    if (num == 0 & idrol.trim().equals("ROL-0006") & dgp.LIST_ID_DGP(ID_DGP).get(0).getEs_dgp().equals("0")) {
                        String iddgp = request.getParameter("iddgp");
                        String id_dir = puesto.List_Puesto_x_iddgp(iddgp);
                        sesion.setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(iddgp));
                        sesion.setAttribute("List_Puesto", puesto.List_Puesto());
                        sesion.setAttribute("Listar_Direccion", dir.Listar_Direccion());
                        sesion.setAttribute("List_modalidad", con.List_modalidad());
                        sesion.setAttribute("list_reg_labo", con.list_reg_labo());
                        sesion.setAttribute("List_grup_ocu", gr.List_grup_ocu());
                        sesion.setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());

                        int asig = dht.ASIGNACION_F(ID_TRABAJADOR);
                        Calendar fecha = new GregorianCalendar();
                        int año = fecha.get(Calendar.YEAR);
                        int mes = fecha.get(Calendar.MONTH);
                        int dia = fecha.get(Calendar.DAY_OF_MONTH);
                        String fe_subs = "";
                        if (mes < 9 && dia < 9) {
                            fe_subs = año + "-" + "0" + (mes + 1) + "-" + "0" + dia;
                        }

                        if (mes < 9 && dia > 9) {
                            fe_subs = año + "-" + "0" + (mes + 1) + "-" + dia;
                        }

                        if (mes >= 9 && dia < 9) {
                            fe_subs = año + "-" + (mes + 1) + "-" + "0" + dia;
                        }
                        if (mes >= 9 && dia > 9) {
                            fe_subs = año + "-" + (mes + 1) + "-" + dia;
                        }
                        response.sendRedirect("Vista/Contrato/Reg_Contrato.jsp?num=" + asig + "&id_direc=" + id_dir + "&fe_subs=" + fe_subs);

                    } else if (num == 0 & idrol.trim().equals("ROL-0006") & dgp.LIST_ID_DGP(ID_DGP).get(0).getEs_dgp().equals("1")) {

                        String id_cto = con.Contrato_max(idtr);
                        String id_pu = puesto.puesto(id_cto);
                        sesion.setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(idtr));
                        sesion.setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_cto));
                        sesion.setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
                        sesion.setAttribute("List_Usuario", usu.List_Usuario());
                        sesion.setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
                        sesion.setAttribute("List_tipo_contrato", l.List_tipo_contrato());
                        sesion.setAttribute("List_x_fun_x_idpu", fu.List_x_fun_x_idpu(id_pu));
                        sesion.setAttribute("list_reg_labo", con.list_reg_labo());
                        response.sendRedirect("Vista/Contrato/Detalle_Info_Contractualq.jsp?idtr=" + idtr + "&id_cto=" + id_cto);
                    } else {
                        String id_cto = con.Contrato_max(idtr);
                        String id_pu = puesto.puesto(id_cto);
                        sesion.setAttribute("Lis_c_c_id_contr", cc.Lis_c_c_id_contr(idtr));
                        sesion.setAttribute("List_contra_x_idcto", con.List_contra_x_idcto(id_cto));
                        sesion.setAttribute("List_Situacion_Actual", l.List_Situacion_Actual());
                        sesion.setAttribute("List_Usuario", usu.List_Usuario());
                        sesion.setAttribute("list_Condicion_contrato", l.list_Condicion_contrato());
                        sesion.setAttribute("List_x_fun_x_idpu", fu.List_x_fun_x_idpu(id_pu));
                        sesion.setAttribute("List_tipo_contrato", l.List_tipo_contrato());
                        sesion.setAttribute("list_reg_labo", con.list_reg_labo());
                        response.sendRedirect("Vista/Contrato/Detalle_Info_Contractualq.jsp?idtr=" + idtr + "&id_cto=" + id_cto);
                    }
                } else {

                    response.sendRedirect("Vista/Dgp/Detalle_Dgp.jsp?idtr=" + ID_TRABAJADOR + "&num=" + num + "&idgp=" + ID_DGP);

                }
            }
            if (opc.equals("Seguimiento")) {
                String iddgp = request.getParameter("iddgp");
                /*corregir*/
                String idrp = IReq.id_det_req_proc(iddgp);
                sesion.setAttribute("Det_Autorizacion", a.List_Detalle_Autorizacion(iddgp, idrp));
                response.sendRedirect("Vista/Dgp/Detalle_Seguimiento_Dgp.jsp");
            }
            if (opc.equals("SeguimientoH")) {
                String iddgp = request.getParameter("iddgp");
                String idrp = IReq.id_det_req_proc(iddgp);
                rpta.put("listar", a.List_Detalle_Autorizacion(iddgp, idrp));
            }
            if (opc.equals("Proceso")) {
                if (permisoAdmin) {
                    sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", "", "", false, true));
                } else {
                    if (idrol.equals("ROL-0019")||idrol.equals("ROL-0008")) {
                        sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", iddir, "", false, false));
                    } else {
                        if (permissionDepartFilter) {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, "", "", false, false));
                        }
                        if (permissionDireccionFilter) {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", iddir, "", false, false));
                        }
                        if (permissionPuestoFilter) {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", "", idpuesto, false, false));
                        } else {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, "", "", false, false));
                        }
                    }
                }

                response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");
            }
            if (opc.equals("User_Aut")) {
                String iddgp = request.getParameter("iddgp");
                sesion.setAttribute("USER_DGP", dgp.USER_DGP(iddgp));

                response.sendRedirect("Vista/Dgp/User_Dgp.jsp");
            }
            if (opc.equals("List_Dgp_Tr")) {

                sesion.setAttribute("LIST_ID_TRAB_DGP", dgp.LIST_ID_TRAB_DGP(idtr));
                response.sendRedirect("Vista/Trabajador/List_Dgp_Trabajador.jsp");
            }
            if (opc.equals("Terminar")) {
                String iddgp = request.getParameter("iddgp");
                out.print(iddgp);
                dgp.REG_DGP_FINAL(iddgp);
                if (permisoAdmin) {
                    sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", "", "", false, true));
                } else {
                    if (permissionDepartFilter) {
                        sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, "", "", false, false));
                    }
                    if (permissionDireccionFilter) {
                        sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", iddir, "", false, false));
                    }
                    if (permissionPuestoFilter) {
                        sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", "", idpuesto, false, false));
                    } else {
                        sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, "", "", false, false));
                    }
                }
                response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp?a=t");
            }

            if (opc.equals("Listar")) {
                sesion.setAttribute("List_Det_Dgp", dgp.LIST_DET_DGP(iddep));
                sesion.setAttribute("List_Trb_Mod_Rel", tr.LIST_TRABAJADOR_MOD_REL());
                response.sendRedirect("Vista/Dgp/List_Dgp.jsp?iddep");

            }
            if (opc.equals("MODIFICAR REQUERIMIENTO")) {
                String iddgp = request.getParameter("iddgp");
                int can_cc = dgp.Can_cc_iddgp(iddgp);
                String id_d_hor = IHor.id_det_horario(iddgp);
                idtr = dgp.obt_idtr_x_dgp(iddgp);
                String ES_CUENTA_SUELDO = tr.CuentaSueldoTra(idtr);
                out.println(idtr + " " + iddgp + "" + idreq + "" + iddep + "" + idpuesto);
                sesion.setAttribute("LIST_ID_DGP", dgp.LIST_ID_DGP(iddgp));
                sesion.setAttribute("Listar_Trabajador_id", tr.ListaridTrabajador(idtr));
                sesion.setAttribute("List_Puesto", pu.List_Puesto_Dep(iddep));
                sesion.setAttribute("list_Cuenta_Sueldo", dgp.LIST_CUEN_SUEL(idtr));
                sesion.setAttribute("Listar_Requerimiento", IReq.Listar_Requerimiento());
                String redirect = request.getParameter("redirect");
                if (redirect != null) {
                    response.sendRedirect("Vista/Dgp/Editar_DGP.jsp?es_cs=" + ES_CUENTA_SUELDO + "&can_cc=" + can_cc + "&id_det_hor=" + id_d_hor.trim() + "&redirect=proceso_dgp");

                } else {
                    response.sendRedirect("Vista/Dgp/Editar_DGP.jsp?es_cs=" + ES_CUENTA_SUELDO + "&can_cc=" + can_cc + "&id_det_hor=" + id_d_hor.trim());
                }
            }
            if (opc.equals("Modificar")) {
                String FE_DESDE = request.getParameter("FEC_DESDE");
                String FE_HASTA = request.getParameter("FEC_HASTA");
                double CA_SUELDO = Double.parseDouble(request.getParameter("SUELDO"));
                double BONO_PUESTO = 0.0;

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
                // String US_MODIF = request.getParameter("USER_MODIF");
                String FE_MODIF = request.getParameter("FECHA_MODIF");
                String IP_USUARIO = request.getParameter("USUARIO_IP");
                double CA_BONO_ALIMENTARIO = 0.0;
                double DE_BEV = 0.0;
                //----CA_CENTRO_COSTOS NO EXISTE EN TABLA RHTM_DGP---

                /*Fuera de planilla*/
                if (ID_REQUERIMIENTO.equals("REQ-0007") || ID_REQUERIMIENTO.equals("REQ-0008") || ID_REQUERIMIENTO.equals("REQ-0009") || ID_REQUERIMIENTO.equals("REQ-0010") || ID_REQUERIMIENTO.equals("REQ-0011")) {
                    CA_BONO_ALIMENTARIO = 0.0;
                    DE_BEV = 0.0;
                    BONO_PUESTO = 0.0;
                } else {
                    /*dentro de planilla de planilla*/
                    BONO_PUESTO = Double.parseDouble(request.getParameter("BONO_PUESTO"));
                    CA_BONO_ALIMENTARIO = Double.parseDouble(request.getParameter("BONO_ALIMENTARIO"));
                    DE_BEV = Double.parseDouble(request.getParameter("BEV"));
                }

                String DE_ANTECEDENTES_POLICIALES = request.getParameter("ANTECEDENTES_POLICIALES");
                String ES_CERTIFICADO_SALUD = request.getParameter("CERTIFICADO_SALUD");
                String DE_MONTO_HONORARIO = request.getParameter("MONTO_HONORARIO");
                //--INSERT TABLA_CUENTA_SUELDO
                String NO_BANCO = request.getParameter("BANCO");
                String NU_CUENTA = (request.getParameter("CUENTA") == null) ? "no tiene" : request.getParameter("CUENTA");
                // String NU_CUENTA = request.getParameter("CUENTA");
                //String NU_CUENTA_BANC = (request.getParameter("CUENTA_BANC") == null) ? "0" : "no tiene";
                String NU_CUENTA_BANC = request.getParameter("CUENTA_BANC");
                String ES_GEM_NU_CUENTA = (request.getParameter("GEN_NU_CUEN") == null) ? "0" : "1";
                String NO_BANCO_OTROS = request.getParameter("BANCO_OTROS");
                String ES_CUENTA_SUELDO = request.getParameter("ES_CUENTA_SUELDO");
                String ID_DGP = request.getParameter("ID_DGP");
                //--

                int NUMERO = 0;
                int cantidad = 0;
                if (ID_REQUERIMIENTO.equals("REQ-0010") || ID_REQUERIMIENTO.equals("REQ-0011")) {
                    NUMERO = 0;
                    cantidad = Integer.parseInt(request.getParameter("CANT"));
                } else {
                    NUMERO = Integer.parseInt(request.getParameter("numero"));
                    cantidad = 0;
                }

                String LI_MOTIVO = request.getParameter("MOTIVO");
                String ES_MFL = "0";

                if (request.getParameter("MFL") == null) {
                    ES_MFL = "0";
                } else {
                    ES_MFL = "1";
                }
                String ES_PRESUPUESTADO = request.getParameter("ES_PRESUPUESTADO");
                if (request.getParameter("ES_PRESUPUESTADO") == null) {
                    ES_PRESUPUESTADO = "0";
                } else {
                    ES_PRESUPUESTADO = "1";
                }
                FE_DESDE = DateFormat.toFormat3(FE_DESDE);
                FE_HASTA = DateFormat.toFormat3(FE_HASTA);
                dgp.MODIFICAR_DGP(ID_DGP, FE_DESDE, FE_HASTA, CA_SUELDO, DE_DIAS_TRABAJO, ID_PUESTO, ID_REQUERIMIENTO, ID_TRABAJADOR, CO_RUC, DE_LUGAR_SERVICIO,
                        DE_SERVICIO, DE_PERIODO_PAGO, DE_DOMICILIO_FISCAL, DE_SUBVENCION, DE_HORARIO_CAPACITACION, DE_HORARIO_REFRIGERIO, DE_DIAS_CAPACITACION,
                        ES_DGP, null, FE_CREACION, iduser, FE_MODIF, IP_USUARIO, CA_BONO_ALIMENTARIO, DE_BEV, DE_ANTECEDENTES_POLICIALES, ES_CERTIFICADO_SALUD,
                        DE_MONTO_HONORARIO, LI_MOTIVO, ES_MFL, BONO_PUESTO, ES_PRESUPUESTADO);
                String iddgp = dgp.MAX_ID_DGP();
                String ESTADO = request.getParameter("ESTADO");
                if (ESTADO != null) {
                    if (ESTADO.trim().equals("0")) {
                        tr.MOD_CUENTA_SUELDO(NO_BANCO, NU_CUENTA, NU_CUENTA_BANC, ES_GEM_NU_CUENTA, NO_BANCO_OTROS, ID_TRABAJADOR, ES_CUENTA_SUELDO);
                    }
                }
                /*Actualizando centro de costo*/
                System.out.println("::Modificando Centro de costos....");
                int cant_inicial = Integer.parseInt(request.getParameter("cant_inicial"));

                System.out.println("::Cantidad Inicial:" + cant_inicial);
                if (cant_inicial != 0) {
                    for (int gg = 0; gg < cant_inicial; gg++) {
                        if (request.getParameter("id_dcc" + (gg + 1)) != null) {
                            Double porcen = Double.parseDouble(request.getParameter("PORCENTAJE_" + (gg + 1)));
                            String id_dt_cen_c = request.getParameter("id_dcc" + (gg + 1));
                            System.out.println("Modificando centro de costo:" + id_dt_cen_c);
                            dcc.Modificar_Centro_Costo_porc(id_dt_cen_c, porcen, iduser);
                        } else {
                            System.out.println(":: No se encontraron los id");
                        }
                    }
                    /*Se adicionaron nuevos centros de costo*/
                    int cantNueva = Integer.parseInt(request.getParameter("cant_ingresada"));
                    System.out.println("::Items de centro de costos adicionados:" + cantNueva);
                    if (cantNueva > 0) {
                        for (int i = 0; i < cantNueva; i++) {
                            double porc_nuevo = Double.parseDouble(request.getParameter("PORCENTAJE_" + (cant_inicial + i)));
                            String centro_c_nuevo = request.getParameter("CENTRO_COSTOS_" + (cant_inicial + i));

                            System.out.println("***Agregando centro de costo:" + centro_c_nuevo);
                            dcc.INSERT_DETALLE_CENTRO_COSTO("", ID_DGP, porc_nuevo, "1", iduser, "", "", "", UserMachineProperties.getAll(),
                                    "", centro_c_nuevo);
                            System.out.println("***Centro de costo agregado**");

                        }
                    } else {
                        System.out.println("::No se adicionaron Centros de Costo");
                    }
                }
                //  List<String> list = a.Det_Autorizacion(idrp);
                // a.Insert_Autorizacion("", iddgp, "1", "P1", "12312", iduser, "", "", "", list.get(1), idrp, list.get(0));
                String es_mod = request.getParameter("estado_de_horario");

                if (es_mod.equals("1")) {
                    String id_de_horario = IHor.id_detalle_horario(ID_DGP);
                    IHor.ELIMINAR_HORARIO(id_de_horario);
                    List<String> dia = new ArrayList<String>();
                    dia.add("lun");
                    dia.add("mar");
                    dia.add("mie");
                    dia.add("jue");
                    dia.add("vie");
                    dia.add("sab");
                    dia.add("dom");

                    String ID_DETALLE_HORARIO = request.getParameter("ID_DETALLE_HORARIO");

                    String ES_DETALLE_HORARIO = "1";
                    String ES_HORARIO = "1";
                    String ID_TIPO_HORARIO = request.getParameter("HORARIO");
                    String ES_MOD_FORMATO = "1";
                    Double horas_totales = Double.parseDouble(request.getParameter("h_total"));
                    String id_d_hor = "";
                    id_d_hor = IHor.Insert_Detalle_Horario(ID_DETALLE_HORARIO, ID_DGP, ES_DETALLE_HORARIO, iduser, null, null, null, ID_TIPO_HORARIO, ES_MOD_FORMATO, horas_totales);
                    for (int i = 0; i < dia.size(); i++) {
                        for (int j = 0; j < 10; j++) {
                            String hora_desde = request.getParameter("HORA_DESDE_" + dia.get(i) + j);
                            String hora_hasta = request.getParameter("HORA_HASTA_" + dia.get(i) + j);
                            String d = request.getParameter("DIA_" + dia.get(i) + j);
                            if (hora_desde != null & d != null & hora_hasta != null) {
                                if (!hora_hasta.equals("") & !hora_desde.equals("") & !d.equals("")) {
                                    IHor.Insert_Horario("", hora_desde, hora_hasta, d, ES_HORARIO, id_d_hor);
                                }
                            }
                        }
                    }
                } else {
                    List<String> dia = new ArrayList<String>();
                    dia.add("lun");
                    dia.add("mar");
                    dia.add("mie");
                    dia.add("jue");
                    dia.add("vie");
                    dia.add("sab");
                    dia.add("dom");
                    for (int y = 0; y < dia.size(); y++) {
                        for (int j = 0; j < 10; j++) {
                            String id_horario = request.getParameter("id_horario" + j + dia.get(y));
                            String ho_desde = request.getParameter("HORA_DESDE_" + dia.get(y) + j);
                            String ho_hasta = request.getParameter("HORA_HASTA_" + dia.get(y) + j);
                            if (id_horario != null) {
                                IHor.modificar_horario(ho_desde, ho_hasta, id_horario);
                            }
                        }
                    }
                }
                sesion.setAttribute("List_doc_req_pla", doc.List_doc_req_pla(iddgp, ID_TRABAJADOR));
                sesion.setAttribute("List_Hijos", doc.List_Hijos(ID_TRABAJADOR));
                sesion.setAttribute("List_Conyugue", doc.List_Conyugue(ID_TRABAJADOR));

                String redireccionar = request.getParameter("redirect");
                if (redireccionar != null) {
                    if (redireccionar.equals("proceso_dgp")) {
                        response.sendRedirect("dgp?iddgp=" + ID_DGP + "&idtr=" + ID_TRABAJADOR + "&opc=rd");
                    } else {
                        response.sendRedirect("dgp?iddgp=" + ID_DGP + "&idtr=" + ID_TRABAJADOR + "&opc=Detalle");
                    }
                } else {
                    response.sendRedirect("dgp?iddgp=" + ID_DGP + "&idtr=" + ID_TRABAJADOR + "&opc=Detalle");
                }
            }
            if (opc.equals("Incompleto")) {

                sesion.setAttribute("List_Incomplet", dgp.List_Incomplet(iddep, permisoAdmin));
                response.sendRedirect("Vista/Dgp/List_req_incompl.jsp");
            }
            if (opc.equals("Imprimir_det_proceso")) {
                String idrp = request.getParameter("idrp");
                String iddgp = request.getParameter("dgp");
                String dep = request.getParameter("iddep");
                rpta.put("html", dgp.Imprimir_det_proceso(iddgp, idrp, dep));
                rpta.put("rpta", "1");
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

    public static String parser24(String fecha) {
        if (fecha != null) {
            String ret = "";
            String[] buffer = fecha.split(":");
            int x = Integer.parseInt(buffer[0]);
            String[] buffer2 = buffer[1].split(" ");
            int y = Integer.parseInt(buffer2[0]);
            String h = buffer2[1];
            if (h.toUpperCase().equals("AM")) {
                if (x < 12) {
                    ret = x + ":" + y;
                } else if (x == 12) {
                    ret = 0 + ":" + y;
                }
            }
            if (h.toUpperCase().equals("PM")) {
                if (x < 12) {
                    ret = (x + 12) + ":" + y;
                } else if (x == 12) {
                    ret = x + ":" + y;
                }

            }
            return ret;
        } else {
            return null;
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
