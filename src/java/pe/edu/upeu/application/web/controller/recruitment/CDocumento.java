/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import com.google.gson.Gson;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
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
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.apache.commons.io.FilenameUtils;
import pe.edu.upeu.application.dao.DocumentoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Lis_Doc_tra;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;

/**
 *
 * @author Jair
 */
public class CDocumento extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    InterfaceDocumentoDAO d = new DocumentoDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, FileUploadException, Exception {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String dgp = request.getParameter("iddgp");
        String idtr = request.getParameter("idtr");
        String opc = request.getParameter("opc");
        HttpSession sesion = request.getSession(true);
        String user = (String) sesion.getAttribute("IDUSER");
        String rol = (String) sesion.getAttribute("IDROL");
        Map<String, Object> rpta = new HashMap<String, Object>();
        boolean permissionEditDocument = false;
        if (rol.trim().equals("ROL-0002") | rol.trim().equals("ROL-0003") | rol.trim().equals("ROL-0005") | rol.trim().equals("ROL-0007") | rol.trim().equals("ROL-0001")) {
            permissionEditDocument = true;
        }
        try {
            if (opc != null) {
                if (opc.equals("Eliminar")) {
                    String id_doc_adj = request.getParameter("id_doc");
                    d.Desactivar_doc(id_doc_adj);
                    int s = d.List_Req_nacionalidad(idtr);
                    int num_ad = d.List_Adventista(idtr);

                    sesion.setAttribute("List_Hijos", d.List_Hijos(idtr));
                    sesion.setAttribute("List_doc_req_pla", d.List_doc_req_pla(dgp, idtr));
                    sesion.setAttribute("List_Conyugue", d.List_Conyugue(idtr));
                    response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + s + "&num_ad=" + num_ad + "&idtr=" + idtr + "&iddgp=" + dgp + "&pro=pr_dgp&a=e");

                }
                if (opc.equals("Ver_Documento")) {
                    int i = d.List_Req_nacionalidad(idtr);
                    int num_ad = d.List_Adventista(idtr);
                    sesion.setAttribute("List_Hijos", d.List_Hijos(idtr));
                    sesion.setAttribute("List_Conyugue", d.List_Conyugue(idtr));

                    response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?n_nac=" + i + "&num_ad=" + num_ad + "&idtr=" + idtr + "&iddgp=" + dgp);
                }
                if (opc.equals("ReqIncompletoNextStep")) {
                    response.sendRedirect("Vista/Dgp/Documento/Reg_Documento.jsp?" + "idtr=" + idtr + "&iddgp=" + dgp + "&pro=pr_dgp");
                }
                if (opc.equals("listDocument")) {
                    System.out.println("enter to listDocument");
                    System.out.println("permissionEditDocument:" + permissionEditDocument);
                    //    Boolean enterToProcessDGP = false;
                    int n_nac = d.List_Req_nacionalidad(idtr);
                    int num_ad = d.List_Adventista(idtr);
                    // int documentsComplete = d.countDocumentsByIdTrabajador(idtr);
                    Boolean enterToDGPProcess = false;
                    List<Lis_Doc_tra> listDocumentsByIdtr = null;
                    if (request.getParameter("enterToDGPProcess") != null) {
                        enterToDGPProcess = Boolean.parseBoolean(request.getParameter("enterToDGPProcess"));
                        listDocumentsByIdtr = d.List_doc_req_pla(dgp, idtr);
                    } else {
                        //  List_doc_req_pla = d.Lis_doc_trabajador(idtr);
                        listDocumentsByIdtr = d.List_doc_req_pla(null, idtr);
                    }
                    Boolean enterToRegTrabajador = false;
                    if (request.getParameter("enterToRegTrabajador") != null) {
                        enterToRegTrabajador = Boolean.parseBoolean(request.getParameter("enterToRegTrabajador"));
                    }
                    /*casos especiales*/
                    Boolean enterToCasosEspecialesProcess = false;
                    if (request.getParameter("enterToCasosEspecialesProcess") != null) {
                        enterToCasosEspecialesProcess = Boolean.parseBoolean(request.getParameter("enterToCasosEspecialesProcess"));
                    }

                    List<Datos_Hijo_Trabajador> listHijosMenoresDeEdad = d.List_Hijos(idtr);
                    List<Padre_Madre_Conyugue> List_Conyugue = d.List_Conyugue(idtr);

                    String id_hijo_faltante = "";

                    List<String> listDocumentItem = new ArrayList<String>();
                    InterfaceDocumentoDAO doc_ = new DocumentoDAO();
                    // String id_dgp = "";
                    String html = "";
                    html += " <form action='../../../documento' method='post' enctype='multipart/form-data'  class='form_dgp_doc' >";

                    int i = 0;
                    for (int z = 0; z < listDocumentsByIdtr.size(); z++) {
                        Lis_Doc_tra d = new Lis_Doc_tra();
                        d = (Lis_Doc_tra) listDocumentsByIdtr.get(z);

                        String htmlDoca = "";
                        if (d.getTi_documento().trim().equals("DOCA")) {
                            if (n_nac != 0) {

                                htmlDoca += "<div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                htmlDoca += " <div class='well well-sm'>";

                                htmlDoca += "<div class=''>";
                                htmlDoca += "<label >" + d.getNo_documento() + "</label>";
                                htmlDoca += "  </div>";

                                htmlDoca += " <div class=' caji" + (i + 1) + "'  >";
                                if (d.getId_documento_adjunto() == null & (permissionEditDocument)) {

                                    htmlDoca += " <input  class='fileDocument' type='file' multiple='true'   ";
                                    if (d.getEs_obligatorio().equals("1") & !enterToRegTrabajador) {
                                        html += (" required='required' ");
                                    }
                                    htmlDoca += "name='archivos" + (i + 1) + "' >";

                                } else if (d.getId_documento_adjunto() == null) {
                                    htmlDoca += " <label class='null'>No Registrado</label>";
                                } else {
                                    htmlDoca += (doc_.List_files(d.getId_documento_adjunto().trim()));
                                }

                                htmlDoca += "</div>";

                                htmlDoca += " <div class=''>";
                                if (d.getDe_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlDoca += "<input type='text' placeholder='Escribe una descripción' class='form-control' name='lob_description" + (i + 1) + "'>";

                                } else if (d.getDe_documento_adjunto() == null) {
                                    htmlDoca += " <label class='null' >No Registrado</label>";
                                } else {
                                    htmlDoca += "<label >Descripción:</label>";
                                    htmlDoca += "<label style='font-weight: normal;'>" + d.getDe_documento_adjunto() + "</label>";

                                }
                                htmlDoca += "</div>";

                                htmlDoca += " <div  class=''  >";
                                if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlDoca += "  <label>¿Recibido en fisico?:</label> <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'  >";
                                    htmlDoca += " <i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                } else if (d.getEs_documento_adjunto() == null) {
                                    htmlDoca += "<label class='null'>¿Recibido en fisico?:No Registrado</label>";
                                } else {
                                    htmlDoca += " <label>";
                                    if (d.getEs_documento_adjunto().trim().equals("1")) {

                                        htmlDoca += "¿Recibido en fisico?: Si";

                                    } else {

                                        htmlDoca += "¿Recibido en fisico?: No";

                                    }
                                    htmlDoca += "  </label>";
                                }

                                htmlDoca += "</div>";

                                htmlDoca += "<div class=''>";
                                if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {
                                    htmlDoca += "<a type='button'  class='btn btn-danger btn-sm  elimi'"
                                            + " href='../../../documento?opc=Eliminar&id_doc=" + d.getId_documento_adjunto()
                                            + "&iddgp=" + d.getId_dgp()
                                            + "&idtr=" + d.getId_trabajador()
                                            + "'><i class='fa fa-trash-o'></i></a>";
                                }
                                htmlDoca += " </div>  ";

                                htmlDoca += "</div>";
                                htmlDoca += "  <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                htmlDoca += "  </div>  ";
                            }
                            listDocumentItem.add(htmlDoca);
                        }
                        String htmlCOFE = "";
                        /*ok*/
                        if (d.getTi_documento().trim().equals("COFE")) {
                            /*constancia de feligresia*/
                            if (num_ad != 0) {
                                htmlCOFE += "  <div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                htmlCOFE += "<div  class='well wel-sm'>";

                                htmlCOFE += " <div class=''>";
                                htmlCOFE += " <label>" + d.getNo_documento() + "</label>";
                                htmlCOFE += " </div>";

                                htmlCOFE += " <div  class='caji" + (i + 1) + "'  >";
                                if (d.getId_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlCOFE += "   <input class='fileDocument' type='file' multiple=true   ";
                                    if (d.getEs_obligatorio().equals("1") & !enterToRegTrabajador) {
                                        htmlCOFE += " required='required' ";
                                    }
                                    htmlCOFE += "name='archivos" + (i + 1) + "' >";
                                } else if (d.getId_documento_adjunto() == null) {
                                    htmlCOFE += " <label class='null'>No Registrado</label>";
                                } else {

                                    htmlCOFE += doc_.List_files(d.getId_documento_adjunto().trim());

                                }
                                htmlCOFE += "  </div>";

                                htmlCOFE += " <div class=''>";

                                if (d.getDe_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlCOFE += " <input type='text'  placeholder='Escribe una descripción' class='form-control' name='lob_description" + (i + 1) + "'>";
                                } else if (d.getDe_documento_adjunto() == null) {
                                    htmlCOFE += " <label class='null' >No Registrado</label>";
                                } else {
                                    htmlCOFE += " <label>Descripción:</label> ";
                                    htmlCOFE += "   <label >" + d.getDe_documento_adjunto() + " </label>";

                                }
                                htmlCOFE += " </div>";
                                htmlCOFE += "<div  class=''>";
                                if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {

                                    htmlCOFE += "    <label>¿Recibido en fisico?:</label>";
                                    htmlCOFE += " <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'   >";
                                    htmlCOFE += "<i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                } else if (d.getEs_documento_adjunto() == null) {

                                    htmlCOFE += "    <label class='null'>¿Recibido en fisico?:No Registrado</label>";

                                } else {

                                    htmlCOFE += "<label >";
                                    if (d.getEs_documento_adjunto().trim().equals("1")) {

                                        htmlCOFE += "¿Recibido en fisico?:Si";

                                    } else {

                                        htmlCOFE += " ¿Recibido en fisico?:No";
                                        htmlCOFE += " </label>";
                                    }
                                }
                                htmlCOFE += " </div>";

                                htmlCOFE += " <div class='' >";
                                if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {
                                    htmlCOFE += " <a type='button'  class='btn btn-danger btn-sm  elimi' href='../../../documento?opc=Eliminar&id_doc="
                                            + d.getId_documento_adjunto() + "&iddgp=" + d.getId_dgp()
                                            + "&idtr=" + d.getId_trabajador() + "'><i class='fa fa-trash-o'></i></a>";
                                }

                                htmlCOFE += " </div>";
                                htmlCOFE += "  </div>";
                                htmlCOFE += " <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                htmlCOFE += "   </div>  ";
                            }
                            listDocumentItem.add(htmlCOFE);
                        }
                        String htmlConyugue = "";
                        if (d.getTi_documento().trim().equals("DNIC") | d.getTi_documento().trim().equals("ACMA")) {

                            for (int kj = 0; kj < List_Conyugue.size(); kj++) {
                                Padre_Madre_Conyugue co = new Padre_Madre_Conyugue();
                                co = (Padre_Madre_Conyugue) List_Conyugue.get(kj);

                                htmlConyugue += "   <div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                htmlConyugue += "  <div class='wel well-sm'>";

                                htmlConyugue += "  <div class=''> ";
                                htmlConyugue += "   <label>";

                                if (d.getTi_documento().trim().equals("ACMA")) {
                                    htmlConyugue += ("Acta de matrimonio con: <p class='txt-color-red' >' " + co.getAp_nombres_conyugue() + " '</p>");
                                }
                                if (d.getTi_documento().trim().equals("DNIC")) {
                                    htmlConyugue += " Copia DNI cónyugue : <p class='txt-color-red' >' " + co.getAp_nombres_conyugue() + " '</p>";
                                }

                                htmlConyugue += "    </label>";
                                htmlConyugue += "   </div>";

                                htmlConyugue += " <div class=' caji" + (i + 1) + "' >";
                                if (d.getId_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlConyugue += " <input  class='fileDocument' type='file' multiple=true ";
                                    if (d.getEs_obligatorio().equals("1") & !enterToRegTrabajador) {
                                        htmlConyugue += (" required='required' ");
                                    }
                                    htmlConyugue += " name='archivos" + (i + 1) + "' >";
                                } else if (d.getId_documento_adjunto() == null) {
                                    htmlConyugue += " <label class='null'>No Registrado</label>";
                                } else {
                                    htmlConyugue += (doc_.List_files(d.getId_documento_adjunto().trim()));
                                }

                                htmlConyugue += " </div>";

                                htmlConyugue += " <div class=''>";

                                if (d.getDe_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlConyugue += "  <input type='text'  placeholder='Escribe una descripción'  class='form-control' name='lob_description" + (i + 1) + "'>";
                                } else if (d.getDe_documento_adjunto() == null) {
                                    htmlConyugue += "   <label class='null' >No Registrado</label>";
                                } else {
                                    htmlConyugue += "   <label>Descripción:</label>";
                                    htmlConyugue += "   <label> " + d.getDe_documento_adjunto() + "</label>";

                                }
                                htmlConyugue += "     </div>";

                                htmlConyugue += " <div class='' >";
                                if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {
                                    htmlConyugue += "  <label>¿Recibido en fisico?:</label>";
                                    htmlConyugue += "  <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'  >";
                                    htmlConyugue += "  <i  data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                } else if (d.getEs_documento_adjunto() == null) {

                                    htmlConyugue += "    <label class='null'>¿Recibido en fisico?:No Registrado</label>";

                                } else {
                                    htmlConyugue += "    <label >";
                                    if (d.getEs_documento_adjunto().trim().equals("1")) {

                                        htmlConyugue += " ¿Recibido en fisico?:Si";

                                    } else {

                                        htmlConyugue += "  ¿Recibido en fisico?:No";
                                        htmlConyugue += "     </label>";
                                    }
                                }
                                htmlConyugue += "   </div>";

                                htmlConyugue += " <div class=''>";
                                if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {

                                    htmlConyugue += " <a type='button'  class='btn btn-danger btn-sm  elimi' href='../../../documento?opc=Eliminar&id_doc="
                                            + d.getId_documento_adjunto() + "&iddgp=" + d.getId_dgp()
                                            + "&idtr=" + d.getId_trabajador() + "'><i class='fa fa-trash-o'></i></a>";
                                }
                                htmlConyugue += " </div>";

                                htmlConyugue += " </div>";

                                htmlConyugue += "  <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                htmlConyugue += " </div>  ";

                                listDocumentItem.add(htmlConyugue);
                            }
                        }
                        String htmlDNIH = "";
                        if (d.getTi_documento().trim().equals("DNIH")) {
                            if (listHijosMenoresDeEdad.size() > 0) {
                                for (int kk = 0; kk < listHijosMenoresDeEdad.size(); kk++) {
                                    Datos_Hijo_Trabajador h = new Datos_Hijo_Trabajador();
                                    h = (Datos_Hijo_Trabajador) listHijosMenoresDeEdad.get(kk);
                                    if (d.getId_datos_hijo() == null) {

                                        htmlDNIH += "   <div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                        htmlDNIH += "   <div  class='well well-sm' >";

                                        htmlDNIH += " <div class=''>";
                                        htmlDNIH += "<label>Copia DNI hijo :   </label> <p class='txt-color-red'> " + h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador() + "</p>";

                                        htmlDNIH += "</div>";
                                        htmlDNIH += "<div  class=' caji" + (i + 1) + "' >";
                                        if (d.getId_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {

                                            htmlDNIH += " <input   class='fileDocument' type='file' multiple=true   name='archivos" + (i + 1) + "' >";
                                            htmlDNIH += "<input type='hidden' name='idh" + (i + 1) + "' value='" + h.getId_datos_hijos_trabajador().trim() + "' >";

                                        } else if (d.getId_documento_adjunto() == null) {
                                            htmlDNIH += "   <label class='null'>No Registrado</label>";
                                        } else {

                                            htmlDNIH += (doc_.List_file_url(d.getId_documento_adjunto().trim()));

                                        }
                                        htmlDNIH += " </div>";

                                        htmlDNIH += "<div class=''>";

                                        if (d.getDe_documento_adjunto() == null & d.getEs_documento_adjunto() == null & (permissionEditDocument)) {
                                            htmlDNIH += "  <input type='text'  placeholder='Escribe una descripción'  class='form-control' name='lob_description" + (i + 1) + "'>";
                                        } else if (d.getDe_documento_adjunto() == null) {
                                            htmlDNIH += "  <label class='null' >No Registrado</label>";
                                        } else {
                                            htmlDNIH += "  <label>Descripción:</label>";
                                            htmlDNIH += "  <label>" + d.getDe_documento_adjunto() + "</label>";

                                        }
                                        htmlDNIH += "  </div>";
                                        htmlDNIH += "   <div class=''>";
                                        if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {
                                            htmlDNIH += " <label class='toggle'>";
                                            htmlDNIH += "    <label>¿Recibido en fisico?:</label>";
                                            htmlDNIH += " <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'   >";
                                            htmlDNIH += "<i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                        } else if (d.getEs_documento_adjunto() == null) {

                                            htmlDNIH += "    <label class='null'>¿Recibido en fisico?:No Registrado</label>";

                                        } else {
                                            htmlDNIH += "<label>";
                                            if (d.getEs_documento_adjunto().trim().equals("1")) {

                                                htmlDNIH += "¿Recibido en fisico?:Si";
                                            } else {

                                                htmlDNIH += "¿Recibido en fisico?:No";
                                                htmlDNIH += "  </label>";
                                            }
                                        }

                                        htmlDNIH += "  </div>";

                                        htmlDNIH += " <div class=''>";
                                        if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {

                                            htmlDNIH += " <a type='button'  class='btn btn-danger btn-sm  elimi' href='../../../documento?opc=Eliminar&id_doc="
                                                    + d.getId_documento_adjunto() + "&iddgp=" + d.getId_dgp()
                                                    + "&idtr=" + d.getId_trabajador() + "'><i class='fa fa-trash-o'></i></a>";
                                        }
                                        htmlDNIH += " </div>";

                                        htmlDNIH += "  </div>";
                                        htmlDNIH += " <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                        htmlDNIH += "   </div>  ";
                                        //out.println(html);
                                        listDocumentItem.add(htmlDNIH);
                                    } else if (h.getVal_doc() > 0 & d.getId_datos_hijo().equals(h.getId_datos_hijos_trabajador().trim())) {
                                        String htmlSecondDNIH = "";

                                        htmlSecondDNIH += "<div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                        htmlSecondDNIH += "<div  class='well well-sm'>";

                                        htmlSecondDNIH += " <div class=''>";
                                        htmlSecondDNIH += "<label>Copia DNI hijo:   </label> <p class='txt-color-red'> " + h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador() + "</p>";

                                        htmlSecondDNIH += " </div>";

                                        htmlSecondDNIH += " <div  class='caji" + (i + 1) + "'  >";
                                        if (d.getId_documento_adjunto() == null & (permissionEditDocument)) {
                                            htmlSecondDNIH += " <input   class='fileDocument' type='file' multiple=true   name='archivos" + (i + 1) + "' >";
                                            htmlSecondDNIH += "<input type='hidden' name='idh" + (i + 1) + "' value='" + h.getId_datos_hijos_trabajador().trim() + "' >";
                                        } else if (d.getId_documento_adjunto() == null) {
                                            htmlSecondDNIH += " <label class='null'>No Registrado</label>";
                                        } else {

                                            htmlSecondDNIH += doc_.List_files(d.getId_documento_adjunto().trim());

                                        }
                                        htmlSecondDNIH += "  </div>";

                                        htmlSecondDNIH += " <div class=''>";

                                        if (d.getDe_documento_adjunto() == null & (permissionEditDocument)) {
                                            htmlSecondDNIH += " <input type='text'  placeholder='Escribe una descripción' class='form-control' name='lob_description" + (i + 1) + "'>";
                                        } else if (d.getDe_documento_adjunto() == null) {
                                            htmlSecondDNIH += " <label class='null' >No Registrado</label>";
                                        } else {
                                            htmlSecondDNIH += " <label>Descripción:</label> ";
                                            htmlSecondDNIH += "   <label >" + d.getDe_documento_adjunto() + " </label>";

                                        }
                                        htmlSecondDNIH += " </div>";

                                        htmlSecondDNIH += "<div  class=''>";
                                        if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {

                                            htmlSecondDNIH += "    <label>¿Recibido en fisico?:</label>";
                                            htmlSecondDNIH += " <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'   >";
                                            htmlSecondDNIH += "<i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                        } else if (d.getEs_documento_adjunto() == null) {

                                            htmlSecondDNIH += "    <label class='null'>¿Recibido en fisico?:No Registrado</label>";

                                        } else {

                                            htmlSecondDNIH += "<label >";
                                            if (d.getEs_documento_adjunto().trim().equals("1")) {

                                                htmlSecondDNIH += "¿Recibido en fisico?:Si";

                                            } else {

                                                htmlSecondDNIH += " ¿Recibido en fisico?:No";
                                                htmlSecondDNIH += " </label>";
                                            }
                                        }
                                        htmlSecondDNIH += " </div>";

                                        htmlSecondDNIH += " <div class='' >";
                                        if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {
                                            htmlSecondDNIH += " <a type='button'  class='btn btn-danger btn-sm  elimi' href='../../../documento?opc=Eliminar&id_doc="
                                                    + d.getId_documento_adjunto() + "&iddgp=" + d.getId_dgp()
                                                    + "&idtr=" + d.getId_trabajador() + "'><i class='fa fa-trash-o'></i></a>";
                                        }

                                        htmlSecondDNIH += " </div>";
                                        htmlSecondDNIH += "  </div>";
                                        htmlSecondDNIH += " <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                        htmlSecondDNIH += "   </div>  ";
                                        listDocumentItem.add(htmlSecondDNIH);

                                    } else if (h.getVal_doc() == 0 & !id_hijo_faltante.equals(h.getId_datos_hijos_trabajador())) {

                                        String htmlHijoFaltante = "";
                                        htmlHijoFaltante += "<div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                                        htmlHijoFaltante += "<div  class='well well-sm'>";

                                        htmlHijoFaltante += " <div class=''>";
                                        htmlHijoFaltante += "<label>Copia DNI hijo:   </label> <p class='txt-color-red'> " + h.getAp_paterno() + " " + h.getAp_materno() + " " + h.getNo_hijo_trabajador() + "</p>";

                                        htmlHijoFaltante += " </div>";
                                        htmlHijoFaltante += " <div  class='caji" + (i + 1) + "'  >";
                                        if ((permissionEditDocument)) {
                                            htmlHijoFaltante += " <input   class='fileDocument' type='file' multiple=true   name='archivos" + (i + 1) + "' >";
                                            htmlHijoFaltante += "<input type='hidden' name='idh" + (i + 1) + "' value='" + h.getId_datos_hijos_trabajador().trim() + "' >";
                                        } else {
                                            htmlHijoFaltante += " <label class='null'>No Registrado</label>";
                                        }
                                        /*else {

                                            htmlHijoFaltante += doc_.List_files(d.getId_documento_adjunto().trim());

                                        }*/
                                        htmlHijoFaltante += "  </div>";

                                        htmlHijoFaltante += " <div class=''>";

                                        if ((permissionEditDocument)) {
                                            htmlHijoFaltante += " <input type='text'  placeholder='Escribe una descripción' class='form-control' name='lob_description" + (i + 1) + "'>";
                                        } else {
                                            htmlHijoFaltante += " <label class='null' >No Registrado</label>";
                                        }
                                        /*else {
                                            htmlHijoFaltante += " <label>Descripción:</label> ";
                                            htmlHijoFaltante += "   <label >" + d.getDe_documento_adjunto() + " </label>";

                                        }*/
                                        htmlHijoFaltante += " </div>";

                                        htmlHijoFaltante += "<div  class=''>";
                                        if ((permissionEditDocument)) {

                                            htmlHijoFaltante += "    <label>¿Recibido en fisico?:</label>";
                                            htmlHijoFaltante += " <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'   >";
                                            htmlHijoFaltante += "<i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                                        } else {

                                            htmlHijoFaltante += "    <label class='null'>¿Recibido en fisico?:No Registrado</label>";

                                        }
                                        /* else {

                                            htmlHijoFaltante += "<label >";
                                            if (d.getEs_documento_adjunto().trim().equals("1")) {

                                                htmlHijoFaltante += "¿Recibido en fisico?:Si";

                                            } else {

                                                htmlHijoFaltante += " ¿Recibido en fisico?:No";
                                                htmlHijoFaltante += " </label>";
                                            }
                                        }*/
                                        htmlHijoFaltante += " </div>";

                                        htmlHijoFaltante += " <div class='' >";
                                        if ((permissionEditDocument)) {
                                            /* htmlHijoFaltante += " <a type='button'  class='btn btn-danger btn-sm  elimi' href='../../../documento?opc=Eliminar&id_doc="
                                                    + d.getId_documento_adjunto() + "&iddgp=" + d.getId_dgp()
                                                    + "&idtr=" + d.getId_trabajador() + "'><i class='fa fa-trash-o'></i></a>";*/
                                        }

                                        htmlHijoFaltante += " </div>";

                                        htmlHijoFaltante += "  </div>";
                                        htmlHijoFaltante += " <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                                        htmlHijoFaltante += "   </div>  ";
                                        listDocumentItem.add(htmlHijoFaltante);
                                        id_hijo_faltante = h.getId_datos_hijos_trabajador();
                                    }

                                    i++;
                                }
                            }
                        } else if (!d.getTi_documento().trim().equals("DNIH") & !d.getTi_documento().trim().equals("DNIC")
                                & !d.getTi_documento().trim().equals("ACMA") & !d.getTi_documento().trim().equals("COFE") & !d.getTi_documento().trim().equals("DOCA")) {
                            String htmlOtherItem = "";
                            htmlOtherItem += "<div class='col-lg-4 col-md-6 col-sm-12 col-xs-12 documentItem'>";
                            htmlOtherItem += " <div class='well well-sm'>";

                            htmlOtherItem += "<div class=''>";
                            htmlOtherItem += "<label >" + d.getNo_documento() + "</label>";
                            htmlOtherItem += "  </div>";

                            htmlOtherItem += " <div class=' caji" + (i + 1) + "'  >";
                            if (d.getId_documento_adjunto() == null & (permissionEditDocument)) {

                                htmlOtherItem += " <input  class='fileDocument' type='file' multiple='true'   ";
                                if (d.getEs_obligatorio().equals("1") & !enterToRegTrabajador) {
                                    htmlOtherItem += (" required='required' ");
                                }
                                htmlOtherItem += "name='archivos" + (i + 1) + "' >";

                            } else if (d.getId_documento_adjunto() == null) {
                                htmlOtherItem += " <label class='null'>No Registrado</label>";
                            } else {
                                htmlOtherItem += (doc_.List_files(d.getId_documento_adjunto().trim()));
                            }

                            htmlOtherItem += "</div>";

                            htmlOtherItem += " <div class=''>";
                            if (d.getDe_documento_adjunto() == null & (permissionEditDocument)) {
                                htmlOtherItem += "<input type='text' placeholder='Escribe una descripción' class='form-control' name='lob_description" + (i + 1) + "'>";

                            } else if (d.getDe_documento_adjunto() == null) {
                                htmlOtherItem += " <label class='null' >No Registrado</label>";
                            } else {
                                htmlOtherItem += "<label >Descripción:</label>";
                                htmlOtherItem += "<label style='font-weight: normal;'>" + d.getDe_documento_adjunto() + "</label>";

                            }
                            htmlOtherItem += "</div>";

                            htmlOtherItem += " <div  class=''  >";
                            if (d.getEs_documento_adjunto() == null & (permissionEditDocument)) {
                                htmlOtherItem += "  <label>¿Recibido en fisico?:</label> <label class='toggle'><input type='checkbox' value='1'   name='estado" + (i + 1) + "'  >";
                                htmlOtherItem += " <i data-swchon-text='SI' data-swchoff-text='NO'></i></label>";
                            } else if (d.getEs_documento_adjunto() == null) {

                                htmlOtherItem += "<label class='null'>¿Recibido en fisico?:No Registrado</label>";
                            } else {
                                htmlOtherItem += " <label>";
                                if (d.getEs_documento_adjunto().trim().equals("1")) {

                                    htmlOtherItem += "¿Recibido en fisico?: Si";

                                } else {

                                    htmlOtherItem += "¿Recibido en fisico?: No";

                                }
                                htmlOtherItem += "  </label>";
                            }

                            htmlOtherItem += "</div>";

                            htmlOtherItem += "<div class=''>";
                            if (d.getEs_documento_adjunto() != null & (permissionEditDocument)) {
                                htmlOtherItem += "<a type='button'  class='btn btn-danger btn-sm  elimi'"
                                        + " href='../../../documento?opc=Eliminar&id_doc=" + d.getId_documento_adjunto()
                                        + "&iddgp=" + d.getId_dgp()
                                        + "&idtr=" + d.getId_trabajador()
                                        + "'><i class='fa fa-trash-o'></i></a>";
                            }
                            htmlOtherItem += " </div>  ";

                            htmlOtherItem += "</div>";
                            html += "  <input type='hidden' name='iddoc" + (i + 1) + "' value='" + d.getId_documentos() + "'>";
                            htmlOtherItem += "  <input type='hidden' name='iddgp' value='" + d.getId_dgp() + "'>";
                            htmlOtherItem += "  <input type='hidden' name='idctr' value='" + request.getParameter("idctr") + "'>";
                            htmlOtherItem += "   <input type='hidden' name='idtr' value='" + request.getParameter("idtr") + "'>";
                            htmlOtherItem += "  </div>  ";
                            listDocumentItem.add(htmlOtherItem);
                        }

                        i++;
                        // id_dgp = d.getId_dgp();

                    }
                    int countItem = 0;
                    System.out.println("tamaño de lista:" + listDocumentItem.size());
                    for (int s = 0; s < listDocumentItem.size(); s++) {
                        if (!listDocumentItem.get(s).equals("")) {
                            if (countItem == 0) {
                                html += "<div class='row'>";
                            }
                            if (countItem == 1) {
                                //  html += listDocumentItem.get(s);
                            }
                            html += listDocumentItem.get(s);
                            System.out.println("item (" + s + ") :" + listDocumentItem.get(s));
                            if (countItem == 2) {
                                html += "</div>";
                                countItem = -1;
                            }
                            countItem++;
                        }
                    }
                    html += "<input type='hidden' name='num' value='" + (i + 1) + "'>";

                    if (permissionEditDocument) {
                        html += "<input type='hidden' value='Registrar' name='opc'> ";
                    }

                    html += "</div>";
                    html += "<div class='row'>";
                    html += "<div class='col-md-12'>";

                    html += (enterToDGPProcess) ? "<a class='btn btn-success pull-right btn_continuar_det' href='../../../dgp?iddgp=" + dgp + "&idtr=" + idtr + "&opc=rd'>Continuar<i class='fa fa-arrow-circle-right'></i></a>"
                            : "";
                    html += (enterToRegTrabajador) ? "<a class='btn btn-success pull-right btn_continuar_det' href='../../../trabajador?idtr=" + idtr + "&opc=list_reg_tra'>Continuar<i class='fa fa-arrow-circle-right'></i></a>" : "";
                    html += (enterToCasosEspecialesProcess) ? "<a class='btn btn-success pull-right btn_continuar_det' href='../../../contrato?idtr=" + idtr + "&opc=Detalle_Contractual'>Continuar<i class='fa fa-arrow-circle-right'></i></a>" : "";

                    html += "  <button type='button' class='btn btn-primary btn_reg_doc pull-right' style='display:none'> <i class='fa fa-plus-square'></i>Registrar</button>";

                    html += "</div>";
                    html += "</div>";
                    html += " </form>";
                    rpta.put("htmlListDocument", html);

                    rpta.put("status", true);
                }
            } else {
                //  String ubicacion = getServletConfig().getServletContext().getRealPath("/") + "Vista/Dgp/Documento/Archivo/";
                String ubicacion = FactoryConnectionDB.url + "Archivo/";
                DiskFileItemFactory f = new DiskFileItemFactory();
                f.setSizeThreshold(1024);
                f.setRepository(new File(ubicacion));
                ServletFileUpload upload = new ServletFileUpload(f);
                ServletRequestContext src = new ServletRequestContext(request);

                List<FileItem> p = upload.parseRequest(src);
                int num_filas = 0;
                String iddgp = null;
                String pr = null;
                String id_ctr = null;
                String id_h = null;
                List<String> list_files = new ArrayList<String>();
                for (FileItem i_n_f : p) {
                    if (i_n_f.isFormField()) {

                        String nombre = i_n_f.getFieldName();
                        String valor = i_n_f.getString();

                        num_filas = (nombre.equals("num")) ? Integer.parseInt(valor) : num_filas;
                        if (nombre.equals("iddgp") & iddgp == null) {
                            iddgp = valor;
                        }
                        if (nombre.equals("idtr") & idtr == null) {
                            idtr = valor;
                        }
                        if (nombre.equals("P2") & pr == null) {
                            pr = valor;
                        }

                        if (nombre.equals("idctr") & id_ctr == null) {
                            id_ctr = valor;
                        }

                    }
                }

                String iddoc = null;
                String nombre_archivo = null;
                String desc = null;
                String estado = null;
                String archivo = null;
                int num = 0;
                String no_original = null;

                //  String validar_nombre = "";
                // Random rnd = new Random();
                for (int i = 0; i < num_filas; i++) {
                    for (FileItem item : p) {
                        if (item.isFormField()) {
                            String nombre = item.getFieldName();
                            String valor = item.getString();
                            iddoc = (nombre.equals("iddoc" + i)) ? valor : iddoc;
                            desc = (nombre.equals("lob_description" + i)) ? valor : desc;
                            estado = (nombre.equals("estado" + i)) ? valor : estado;
                            id_h = (nombre.equals("idh" + i)) ? valor : id_h;
                        } else {
                            String fieldName = item.getFieldName();

                            num++;
                            Calendar fecha = new GregorianCalendar();
                            int day = fecha.get(Calendar.DAY_OF_MONTH);
                            int month = fecha.get(Calendar.MONTH);
                            int year = fecha.get(Calendar.YEAR);
                            int hora = fecha.get(Calendar.HOUR_OF_DAY);
                            int min = fecha.get(Calendar.MINUTE);
                            int sec = fecha.get(Calendar.SECOND);

                            if (fieldName.equals("archivos" + i) & item.getName() != null) {
                                if (!item.getName().equals("")) {
                                    no_original = item.getName();
                                    String extension = FilenameUtils.getExtension(no_original);
                                    nombre_archivo = String.valueOf(year) + String.valueOf(month) + String.valueOf(day) + String.valueOf(hora) + String.valueOf(min) + String.valueOf(sec) + "_sysgth." + extension;
                                    //Thread thread = new Thread(new Renombrar(item, ubicacion, nombre_archivo));
                                    //  thread.start();
                                    System.out.println("nombre: " + nombre_archivo);
                                    File files = new File(ubicacion, nombre_archivo);
                                    item.write(files);

                                    archivo = no_original + ":" + nombre_archivo;
                                    list_files.add(archivo);
                                }

                            } else {
                                no_original = no_original;
                                nombre_archivo = nombre_archivo;
                            }
                        }
                    }
                    //  Thread.sleep(100);
                    if (nombre_archivo != null) {
                        if (!nombre_archivo.equals("")) {
                            estado = ((estado == null) ? "0" : estado);
                            //out.println(iddoc);
                            String id = d.INSERT_DOCUMENTO_ADJUNTO(null, iddoc, "1", user, null, null, null, null, desc, null, estado, id_ctr);

                            if (iddgp == null) {
                                iddgp = "";
                            }

                            System.out.println("::::iddgp:" + iddgp);
                            d.INSERT_DGP_DOC_ADJ(null, iddgp, id, null, idtr, id_h);
                            for (int t = 0; t < list_files.size(); t++) {
                                String g[] = list_files.get(t).split(":");
                                d.INSERT_ARCHIVO_DOCUMENTO(null, id, g[1], g[0], null);
                            }
                            list_files.clear();
                        }
                    }
                    no_original = null;
                    iddoc = null;
                    nombre_archivo = null;
                    desc = null;
                    estado = null;
                    no_original = null;
                }
                rpta.put("status", true);
            }
        } catch (Exception e) {
            //  out.println("Error : " + e.getMessage());
            rpta.put("status", false);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CDocumento.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(CDocumento.class.getName()).log(Level.SEVERE, null, ex);
        }
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
