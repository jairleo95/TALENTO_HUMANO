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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.AutorizacionDAO;
import pe.edu.upeu.application.dao.CorreoDAO;
import pe.edu.upeu.application.dao.DgpDAO;
import pe.edu.upeu.application.dao.EmpleadoDAO;
import pe.edu.upeu.application.dao.NotificationDAO;
import pe.edu.upeu.application.dao.UsuarioDAO;
import pe.edu.upeu.application.dao_imp.InterfaceAutorizacionDAO;
import pe.edu.upeu.application.dao_imp.InterfaceCorreoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDgpDAO;
import pe.edu.upeu.application.dao_imp.InterfaceEmpleadoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceNotificationDAO;
import pe.edu.upeu.application.dao_imp.InterfaceUsuarioDAO;
import pe.edu.upeu.application.model.Notification;

/**
 *
 * @author Alfa.sistemas
 */
public class CAutorizacion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        InterfaceEmpleadoDAO e = new EmpleadoDAO();
        InterfaceAutorizacionDAO a = new AutorizacionDAO();
        InterfaceDgpDAO dgp = new DgpDAO();
        HttpSession sesion = request.getSession(true);
        InterfaceCorreoDAO correo = new CorreoDAO();
        String iduser = (String) sesion.getAttribute("IDUSER");
        CCriptografiar cr = new CCriptografiar();
        if (iduser != null) {

            String ide = (String) sesion.getAttribute("IDPER");
            String idp = (String) sesion.getAttribute("PUESTO_ID");
            String iddep = (String) sesion.getAttribute("DEPARTAMENTO_ID");
            String iddir = (String) sesion.getAttribute("IDDIR");
            String idrol = (String) sesion.getAttribute("IDROL");
            Map<String, Object> rpta = new HashMap<String, Object>();
            String opc = request.getParameter("opc");
            /*permisos*/
            boolean permisoAsigFam = false;
            boolean permisoEsSistema = false;
            boolean permissionDireccionFilter = false;
            boolean permissionDepartFilter = false;
            switch (idrol) {
                case "ROL-0009":
                    permisoAsigFam = true;
                    permisoEsSistema = true;
                    break;
                case "ROL-0017":
                    permisoAsigFam = true;
                    break;
                case "ROL-0018":
                    permisoEsSistema = true;
                    break;
                case "ROL-0001":
                    permisoEsSistema = true;
                    permisoAsigFam = true;
                    permissionDepartFilter = true;
                    break;
                case "ROL-0008":
                    permissionDireccionFilter = true;
                    break;

                default:
                    permissionDepartFilter = true;
            }

            try {
                if (opc != null) {
                    if (opc.equals("Aceptar")) {
                        String iddgp = request.getParameter("IDDETALLE_DGP");
                        String estado = "1";
                        String nropaso = request.getParameter("NROPASO");
                        //String usuario_ip = "";
                        String cod = request.getParameter("COD");
                        String iddrp = request.getParameter("IDDETALLE_REQ_PROCESO");
                        String idpasos = request.getParameter("IDPASOS");
                        String nombres = request.getParameter("NOMBRES");
                        String idtrab = request.getParameter("IDTRAB");
                        /*Cambiar con un trigger al momento de insertar*/
                        dgp.VAL_DGP_PASOS();

                        a.Insert_Autorizacion("", iddgp, estado, nropaso, "", iduser, "", "", cod.trim(), idp, iddrp, idpasos);
                        String idpu = e.Id_Puesto_Personal(ide);
                        InterfaceNotificationDAO notdao=new NotificationDAO();
                        Notification not=new Notification();
                        InterfaceUsuarioDAO udao=new UsuarioDAO();
                        String username=udao.List_ID_User(iduser).get(0).getNo_usuario();
                        not.setId_rol("ROL-0001");
                        not.setEs_visualizado("0");
                        not.setEs_leido("0");
                        not.setTipo_notification("1");
                        not.setDe_notification("Empleado autorizado por "+username);
                        not.setDi_notification("trabajador?idtr="+idtrab+"&opc=list");
                        not.setTitulo(nombres);
                        /*
                        SELECT  * FROM RHTV_AUTORIZACION WHERE ID_DGP='DGP-000146';
                        HACER UNA LISTA CON LA CONSULTA DE LOS AUTORIZACIONES
                        RECORRER LA LISTA (FOR)
                        AGREGAR UN CAMPO MAS ID_USUARIO
                        
                        LUEGO INSERTAR EL METODO notdaoregistrar(not);
                        */
                        
                        notdao.Registrar(not);
                        sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                        sesion.setAttribute("List_id_Autorizados", a.List_Autorizados(idpu));
                       /* response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?r=ok");*/
                        rpta.put("rpta", true);
                    }
                    if (opc.equals("AceptarMasivo")) {
                        String iddgp = request.getParameter("IDDETALLE_DGP");
                        String estado = "1";
                        String nropaso = request.getParameter("NROPASO");
                        //String usuario_ip = "";
                        String cod = request.getParameter("COD");
                        String iddrp = request.getParameter("IDDETALLE_REQ_PROCESO");
                        String idpasos = request.getParameter("IDPASOS");
                        /*Cambiar con un trigger al momento de insertar*/
                        dgp.VAL_DGP_PASOS();
                        a.Insert_Autorizacion("", iddgp, estado, nropaso, "", iduser, "", "", cod.trim(), idp, iddrp, idpasos);
                        rpta.put("rpta", true);
                    }
                    if (opc.equals("HDGP")) {

                        String iddgp = request.getParameter("iddgp");
                        out.print(iddgp);
                        dgp.HABILITAR_DGP(iddgp);
                        if (permissionDepartFilter) {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, ""));
                        }
                        if (permissionDireccionFilter) {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO("", iddir));
                        } else {
                            sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep, ""));
                        }
                        // sesion.setAttribute("LIST_DGP_PROCESO", dgp.LIST_DGP_PROCESO(iddep));
                        response.sendRedirect("Vista/Dgp/Proceso_Dgp.jsp");

                    }
                    if (opc.equals("Rechazar")) {
                        String iddgp = request.getParameter("IDDETALLE_DGP");
                        String comentario = request.getParameter("comentario");
                        String estado = "2";
                        String nropaso = request.getParameter("NROPASO");
                        //String usuario_ip = "";
                        String cod = request.getParameter("COD");
                        String iddrp = request.getParameter("IDDETALLE_REQ_PROCESO");
                        String idpasos = request.getParameter("IDPASOS");
                        String nombres = request.getParameter("NOMBRES");
                        String idtrab = request.getParameter("IDTRAB");
                        /*Cambiar con un trigger al momento de insertar*/
                        dgp.VAL_DGP_PASOS();
                        dgp.RECHAZAR_DGP(iddgp);
                        String id_autorizacion = a.Insert_Autorizacion_dev("", iddgp, estado, nropaso, "", iduser, "", "", cod.trim(), idp, iddrp, idpasos);
                        a.Insert_comentario_Aut("", id_autorizacion, iddgp, iduser, "1", id_autorizacion, comentario);
                        String idpu = e.Id_Puesto_Personal(ide);
                        InterfaceNotificationDAO notdao=new NotificationDAO();
                        Notification not=new Notification();
                        InterfaceUsuarioDAO udao=new UsuarioDAO();
                        String username=udao.List_ID_User(iduser).get(0).getNo_usuario();
                        not.setId_rol(idrol);
                        not.setEs_visualizado("0");
                        not.setEs_leido("0");
                        not.setTipo_notification("0");
                        not.setDe_notification("Empleado rechazado por "+username);
                        not.setDi_notification("trabajador?idtr="+idtrab+"&opc=list");
                        not.setTitulo(nombres);
                        notdao.Registrar(not);
                        sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                        sesion.setAttribute("List_id_Autorizados", a.List_Autorizados(idpu));
                        response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?r=ok");
                        sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                        sesion.setAttribute("List_id_Autorizados", a.List_Autorizados(idpu));
                        //out.print(id_autorizacion);
                        response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?r=ok");
                        out.print("correcto ");
                    }

                    //AUTORIZACION CARGA ACADEMICA POR DOCENTE
                    if (opc.equals("Autorizacion_CD")) {
                        String idpu = e.Id_Puesto_Personal(ide);
                        sesion.setAttribute("List_Autorizacion_Academico", a.List_Autorizacion_Academico(idpu, iduser));
                        response.sendRedirect("Vista/Academico/Autorizar_Carga_Academica.jsp");
                    }
                    if (opc.equals("mens_cod_aps")) {
                        String idpu = e.Id_Puesto_Personal(ide);
                        sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                        sesion.setAttribute("List_id_Autorizados", a.List_Autorizados(idpu));
                        response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?m=si");
                    }
                    if (opc.equals("mens_cod_huella")) {
                        String idpu = e.Id_Puesto_Personal(ide);
                        sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                        sesion.setAttribute("List_id_Autorizados", a.List_Autorizados(idpu));
                        response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp?h=si");
                    }
                    if (opc.equals("Enviar_Correo")) {
                        String to = request.getParameter("to");
                        //  String from = request.getParameter("from");
                        String asunto = request.getParameter("asunto");
                        String cuerpo = request.getParameter("cuerpo");

                        String correo_inst = request.getParameter("co_inst");
                        String correo_personal = request.getParameter("co_pers");
                        //correo.Enviar(to, from, asunto, cuerpo);
                        System.out.print("Ejecutando envio de correos");
                        correo.Enviar("jairleo95@gmail.com", "jairleo95@gmail.com", "CARPETA LABORAL - UPEU", "Estimado(a) Colaborador(a),\n"
                                + "Compartimos la siguiente información\n \n"
                                + "- Bienestar para el trabajador\n"
                                + "- Reglamento de Control de Asistencia\n"
                                + "- Reglamento de trabajo\n"
                                + "- Boletín Informativo - sistema pensionario\n \n"
                                + "Saludos Cordiales");
                        correo.Enviar("jairleo95@gmail.com", "jairleo95@gmail.com", "CARPETA LABORAL - UPEU", "Estimado(a) Colaborador(a),\n"
                                + "Compartimos la siguiente información\n \n"
                                + "- Bienestar para el trabajador\n"
                                + "- Reglamento de Control de Asistencia\n"
                                + "- Reglamento de trabajo\n"
                                + "- Boletín Informativo - sistema pensionario\n \n"
                                + "Saludos Cordiales");
                        rpta.put("sendto", correo_inst + ", " + correo_personal);
                        rpta.put("rpta", true);

                    }
                    if (opc.equals("List_Dgp_Aut")) {
                        String año = request.getParameter("año");
                        int mes = 0;
                        if (request.getParameter("mes") != null) {
                            if (!request.getParameter("mes").equals("")) {
                                mes = Integer.parseInt(request.getParameter("mes"));
                            }
                        }
                        List<Map<String, ?>> lista = a.List_Dgp_Autorizados(iduser, mes, año);
                        rpta.put("rpta", "1");
                        rpta.put("lista", lista);
                    }
                    if (opc.equals("ValBtnAutorizacion")) {
                        String html = "";
                        String idtr = request.getParameter("trabajador");
                        if (idrol.trim().equals("ROL-0009")) {
                            int val_aps = val_aps = e.val_cod_aps_empleado(idtr);
                            if (val_aps > 0) {
                                html = "<button class='btn btn-labeled btn-success btn-autor' type='button'>"
                                        + "                            <span class='btn-label'><i class='glyphicon glyphicon-ok'></i></span>PROCESAR REQUERIMIENTO "
                                        + "                        </button>";
                            } else {
                                html = "<div class='alert alert-warning fade in'><i class='fa-fw fa fa-warning'></i><strong>Atención!</strong> Usted no puede <strong>AUTORIZAR</strong> el requerimiento, debe primero registrar el <strong>Código APS</strong>.</div>";
                            }
                        } else if (idrol.trim().equals("ROL-0007") | idrol.trim().equals("ROL-0001")) {
                            int val_huella = e.val_cod_huella(idtr);
                            if (val_huella > 0) {
                                html = "<button class='btn btn-labeled btn-success btn-autor' type='button'>"
                                        + "                            <span class='btn-label'><i class='glyphicon glyphicon-ok'></i></span>AUTORIZAR REQUERIMIENTO "
                                        + "                        </button>";

                            } else {
                                html = "<div class='alert alert-warning fade in'><i class='fa-fw fa fa-warning'></i><strong>Atención!</strong> Usted no puede <strong>AUTORIZAR</strong> el requerimiento, debe primero registrar el <strong>Código de Huella Digital</strong>.</div>";
                            }
                        } else {
                            html = "<button class='btn btn-labeled btn-success btn-autor' type='button'>"
                                    + "                            <span class='btn-label'><i class='glyphicon glyphicon-ok'></i></span>AUTORIZAR REQUERIMIENTO "
                                    + "                        </button>";
                        }
                        rpta.put("rpta", "1");
                        rpta.put("data", html);
                    }
                    if (opc.equals("ShowListProcesarReq")) {
                        boolean tipo_lista = Boolean.parseBoolean((request.getParameter("tipo_lista")));
                        String html_table = "";
                        if (tipo_lista) {
                            html_table += "<table id='table_procesar' class='table table-striped table-bordered table-hover' width='100%'>";
                            html_table += "<thead><tr>";
                            html_table += (permisoAsigFam & permisoEsSistema) ? " <th class='hasinput' colspan='7' style='width:95%' ></th>" : "<th class='hasinput' colspan='7' style='width:95%' ></th>";
                            html_table += (permisoAsigFam) ? "<th class='hasinput'  ><center><button  class='btn btn-primary btn-circle btn-lg btnAsigFam'><i class='glyphicon glyphicon-ok'></i></button></center></th>" : "";
                            html_table += (permisoEsSistema) ? " <th class='hasinput' ><center><button  class='btn bg-color-blueDark txt-color-white  btn-circle btn-lg btnActSisEs'><i class='glyphicon glyphicon-ok'></i></button></center></th>" : "";
                            html_table += "</tr>"
                                    + "  <tr data-hide='phone,tablet'> <th><strong>Nro</strong></th>"
                                    + "  <th><strong>Mes - Año </strong></th>"
                                    + " <th data-class='expand' ><strong>Apellidos Y Nombres</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Puesto</strong></th>"
                                    + " <th data-hide='phone,tablet'><strong>Area</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Departamento</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Requerimiento</strong></th>";
                            html_table += (permisoAsigFam) ? " <th  data-hide='phone,tablet'>Asig. Fam.</th> " : "";
                            html_table += (permisoEsSistema) ? "<th  data-hide='phone,tablet'>T-REGISTRO</th>" : "";
                            html_table += "</tr></thead>";
                        } else {

                            html_table += "<table id='table_autorizados' class='table table-striped table-bordered table-hover' width='100%'>";
                            html_table += "<thead>"
                                    + "  <tr data-hide='phone,tablet'> <th><strong>Nro</strong></th>"
                                    + "   <th><strong>Mes - Año </strong></th>"
                                    + " <th data-class='expand' ><strong>Apellidos Y Nombres</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Puesto</strong></th>"
                                    + " <th data-hide='phone,tablet'><strong>Area</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Departamento</strong></th>"
                                    + "  <th data-hide='phone,tablet'><strong>Requerimiento</strong></th>";
                            html_table += (permisoAsigFam) ? " <th  data-hide='phone,tablet'>Asig. Fam.</th> " : "";
                            html_table += (permisoEsSistema) ? "<th  data-hide='phone,tablet'>T-REGISTRO</th>" : "";
                            html_table += "</tr></thead>";
                        }

                        if (tipo_lista) {
                            html_table += "<tbody class='tbody_procesar_req'> </tbody> ";
                        } else {
                            html_table += "<tbody class='tbody_procesar_req_aut'> </tbody> ";
                        }
                        html_table += "</table>";
                        List<Map<String, ?>> lista = a.List_procesar_req(tipo_lista, permisoAsigFam, permisoEsSistema);
                        String text_html = "";
                        for (int i = 0; i < lista.size(); i++) {
                            Map<String, ?> x = lista.get(i);
                            //x.get("idtr")  String idtr = cr.Encriptar(x.get("idtr") + "");
                            text_html += "<tr>";
                            text_html += "<td>" + (i + 1) + "</td>";
                            text_html += "<td>" + x.get("mes") + " - " + x.get("anno") + "</td>";
                            text_html += "<td><a href='../../trabajador?idtr=" + x.get("idtr") + "&opc=list&dgp=" + x.get("iddgp") + "'>" + x.get("ap_p") + " " + x.get("ap_m") + " " + x.get("nombre") + "</a></td>";
                            text_html += "<td>" + x.get("puesto") + "</td>";
                            text_html += "<td>" + x.get("area") + "</td>";
                            text_html += "<td>" + x.get("dep") + "</td>";
                            text_html += "<td>" + x.get("req") + "</td>";
                            if (x.get("es_asignacion_f").equals("0")) {
                                text_html += (permisoAsigFam) ? "<td class='smart-form'><center><label class='toggle'><input type='checkbox' name='checkbox-toggle' class='chkAsigFam" + (i) + "' value='" + x.get("iddgp") + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></center></td>" : "";
                            } else {
                                text_html += (permisoAsigFam) ? "<td>Si</td>" : "";
                            }
                            if (x.get("es_activ_sis").equals("0")) {
                                text_html += (permisoEsSistema) ? "<td class='smart-form' ><center><label class='toggle'><input type='checkbox' name='checkbox-toggle' class='chkActSistEs" + (i) + "' value='" + x.get("iddgp") + "' ><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></center></td>" : "";
                            } else {
                                text_html += (permisoEsSistema) ? "<td>Si</td>" : "";
                            }
                            text_html += "</tr>";
                        }
                        rpta.put("rpta", "1");
                        rpta.put("lista", lista.size());
                        rpta.put("text_html", text_html);
                        rpta.put("html_table", html_table);
                    }
                    if (opc.equals("ListProcesarReq")) {
                        response.sendRedirect("Vista/Dgp/Procesar_Req.jsp");
                    }
                    if (opc.equals("UpdateStatusDgp_Procesar")) {
                        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));
                        int tipo = Integer.parseInt(request.getParameter("tipo"));
                        String[] array = request.getParameterValues("json[]");
                        a.UpdateDgp_EstadoProcesar(array, tipo, estado);
                        rpta.put("rpta", "1");
                        rpta.put("aaas", array);
                    }
                    if (opc.equals("ShowCkbEstado_procesarIndiviual")) {
                        String iddgp = request.getParameter("iddgp");

                        List<Map<String, ?>> lista = a.ShowCkbEstado_procesarIndiviual(iddgp);
                        if (lista.size() > 0) {

                            Map<String, ?> x = lista.get(0);
                            int es_sis = Integer.parseInt(x.get("es_sis_estado") + "");
                            int es_asiFam = Integer.parseInt(x.get("es_asig_fam") + "");
                            String html_ckbAsigFam = "";
                            String html_ckbEs_Sis = "";
                            if (es_asiFam == 0) {
                                html_ckbAsigFam += (permisoAsigFam) ? "  <div class='col-md-8'><strong>¿Asignación Familiar?</strong></div><div class='col-md-4'><label class='toggle'>"
                                        + "<input type='checkbox' name='checkbox-toggle' class='ckbAsigFam' value='" + iddgp + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label>"
                                        + "</div>"
                                        : "<div class='col-md-8'><strong>¿Asignación Familiar?</strong></div><div class='col-md-4'><label class='toggle'>No</div>";
                            } else if (es_asiFam == 1) {
                                html_ckbAsigFam += (permisoAsigFam) ? "<div class='col-md-8'><strong>¿Asignación Familiar?</strong></div><div class='col-md-4'>"
                                        + "<label class='toggle'><input type='checkbox' checked='' name='checkbox-toggle' class='ckbAsigFam' value='" + iddgp + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></div>"
                                        : "<div class='col-md-8'><strong>¿Asignación Familiar?</strong></div><div class='col-md-4'><label class='toggle'>Si</div>";
                            }
                            if (es_sis == 0) {
                                html_ckbEs_Sis += (permisoEsSistema) ? " <div class='col-md-8'><strong>¿T-REGISTRO?</strong></div><div class='col-md-4'><label class='toggle'>"
                                        + "<input type='checkbox'  name='checkbox-toggle' class='ckbEstSistema' value='" + iddgp + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></div>"
                                        : "<div class='col-md-8'><strong>¿T-REGISTRO?</strong></div><div class='col-md-4'><label class='toggle'>No</div>";
                            } else if (es_sis == 1) {
                                html_ckbEs_Sis += (permisoEsSistema) ? " <div class='col-md-8'><strong>¿T-REGISTRO?</strong></div><div class='col-md-4'><label class='toggle'>"
                                        + "<input type='checkbox' checked='' name='checkbox-toggle' class='ckbEstSistema' value='" + iddgp + "'><i data-swchon-text='SI' data-swchoff-text='NO'></i></label></div>"
                                        : "<div class='col-md-8'><strong>¿T-REGISTRO?</strong></div><div class='col-md-4'><label class='toggle'>Si</div>";
                            }
                            rpta.put("ckbAsigFam", html_ckbAsigFam);
                            rpta.put("ckbEs_Sis", html_ckbEs_Sis);
                            rpta.put("rpta", "1");
                        }
                    }
                } else {
                    Logger.getLogger(getClass().getName()).log(Level.INFO, ide);
                    String idpu = e.Id_Puesto_Personal(ide);
                    sesion.setAttribute("List_id_Autorizacion", a.List_id_Autorizacion(idpu, iduser));
                    out.print(a.List_Autorizados(idpu).size());
                    response.sendRedirect("Vista/Dgp/Autorizar_Requerimiento.jsp");
                }

            } catch (Exception ex) {
                rpta.put("rpta", "-1");
                rpta.put("mensaje", ex.getMessage());
            } finally {
                Gson gson = new Gson();
                out.print(gson.toJson(rpta));
                out.flush();
                out.close();
            }
        } else {
            response.sendRedirect("/");
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
