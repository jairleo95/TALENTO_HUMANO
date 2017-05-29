/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.Datos_Hijo_Trabajador;
import pe.edu.upeu.application.model.Documentos;
import pe.edu.upeu.application.model.Lis_Doc_tra;
import pe.edu.upeu.application.model.Padre_Madre_Conyugue;
import pe.edu.upeu.application.model.V_Documento_Trabajador;
import pe.edu.upeu.application.model.V_Reg_Dgp_Tra;

/**
 *
 * @author Admin
 */
public interface InterfaceDocumentoDAO {

    public List<V_Documento_Trabajador> List_Id_Doc_Trab(String id_trabajador);

    public String List_files(String id);

    public String List_files_tra(String id);

    public String List_file_url(String id);

    public String List_file_url2(String id);

    public String List_file_url3(String id);

    public List<Documentos> List_Documentos();

    //public List<Documentos> List_Doc_Req_Pla(String id_dgp,String id_trabajador);
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador);

    public List<Padre_Madre_Conyugue> List_Conyugue(String id_Trabajador);

    public int List_Adventista(String id_trabajador);

    public int List_Req_nacionalidad(String id_trabajador);

    public int countDocumentsByIdTrabajador(String id);

    public int count_documentos_x_tra(String id_tra);

    public List<Lis_Doc_tra> List_doc_req_pla(String iddg, String idtra);

    public String INSERT_DOCUMENTO_ADJUNTO(String ID_DOCUMENTO_ADJUNTO, String ID_DOCUMENTOS, String ES_DOCUMENTO_ADJUNTO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String DE_DOCUMENTO_ADJUNTO, String NO_USUARIO, String ES_REC_FISICO, String ID_CONTRATO);

    public List<V_Reg_Dgp_Tra> List_Doc_CE();

    public void INSERT_ARCHIVO_DOCUMENTO(String ID_ARCHIVO_DOCUMENTO, String ID_DOCUMENTO_ADJUNTO, String NO_FILE, String NO_ORIGINAL, String ES_FILE);

    public void INSERT_DGP_DOC_ADJ(String ID_DGP_DOC_ADJ, String ID_DGP, String ID_DOCUMENTO_ADJUNTO, String ES_DGP_DOC_ADJ, String idtr, String idh);

    public void Desactivar_doc(String id_doc_adj);

    public List<V_Reg_Dgp_Tra> List_doc_tra(String idtra);

    public List<Documentos> Documentos();

    public List<Lis_Doc_tra> Lis_doc_trabajador(String idtr);

    public void INSERT_DGP_DOC_tra(String ID_DGP_DOC_ADJ, String ID_DGP, String ID_DOCUMENTO_ADJUNTO, String ES_DGP_DOC_ADJ, String idtr, String idh);

    public List<Lis_Doc_tra> Lis_doc_trabajador_hab(String idtr);
}
