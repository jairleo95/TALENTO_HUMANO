/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceDocumentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
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
public class DocumentoDAO implements InterfaceDocumentoDAO {

    ConexionBD conn;
    String Url_Archivo = FactoryConnectionDB.url_archivos;

    @Override
    public List<V_Documento_Trabajador> List_Id_Doc_Trab(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from RHVD_DOCUMENTO_TRABAJADOR WHERE id_trabajador='" + id_trabajador.trim() + "'";
        List<V_Documento_Trabajador> list = new ArrayList<V_Documento_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Documento_Trabajador d = new V_Documento_Trabajador();
                d.setId_documento_adjunto(rs.getString("id_documento_adjunto"));
                d.setId_dgp(rs.getString("id_dgp"));
                d.setId_trabajador(rs.getString("id_trabajador"));
                d.setNo_documento(rs.getString("no_documento"));
                d.setNo_req(rs.getString("no_req"));
                d.setDe_documento_adjunto(rs.getString("de_documento_adjunto"));
                d.setAr_dato_archivo(rs.getString("ar_dato_archivo"));

                list.add(d);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;
    }

    @Override
    public String List_files(String id) {
        String texto_html = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select a.NO_FILE,a.NO_ORIGINAL  from RHTV_ARCHIVO_DOCUMENTO a ,  RHTV_DOCUMENTO_ADJUNTO d where d.ID_DOCUMENTO_ADJUNTO = a.ID_DOCUMENTO_ADJUNTO  and  a.id_documento_adjunto='" + id + "' and a.ES_FILE='1'";
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                String tipo = rs.getString("NO_FILE").substring(rs.getString("NO_FILE").length() - 3, rs.getString("NO_FILE").length());
                if (tipo.equals("PDF") || tipo.equals("OCX")) {
                    if (tipo.equals("OCX") || tipo.equals("DOC")) {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href=\"" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "'><img src='Archivo/word.png' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ORIGINAL") + "</a>";
                    } else {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href=\"" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "\"><img src='Archivo/pdf.png' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ORIGINAL") + "</a>";
                    }
                } else {
                    texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href=\"" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "\"><img src=\"" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "\" style='width:100px;height:100px' class='borde' /></a>";
                }

            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return texto_html;
    }

    @Override
    public String List_files_tra(String id) {
        String texto_html = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select a.NO_FILE,a.NO_ORIGINAL  from RHTV_ARCHIVO_DOCUMENTO a ,  RHTV_DOCUMENTO_ADJUNTO d where d.ID_DOCUMENTO_ADJUNTO = a.ID_DOCUMENTO_ADJUNTO  and  a.id_documento_adjunto='" + id + "' and a.ES_FILE='1'";
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                texto_html = texto_html + "<img src=\"" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "\" />";
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {

                throw new RuntimeException(e.getMessage());
            }
        }
        return texto_html;
    }

    @Override
    public String List_file_url(String id) {
        String texto_html = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select a.NO_FILE,a.NO_ORIGINAL  from RHTV_ARCHIVO_DOCUMENTO a ,  RHTV_DOCUMENTO_ADJUNTO d where d.ID_DOCUMENTO_ADJUNTO = a.ID_DOCUMENTO_ADJUNTO  and  a.id_documento_adjunto='" + id + "' and a.ES_FILE='1'";
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                String tipo = rs.getString("NO_FILE").substring(rs.getString("NO_FILE").length() - 3, rs.getString("NO_FILE").length());
                if (tipo.trim().equals("PDF") || tipo.equals("OCX") || tipo.equals("DOC")) {
                    if (tipo.equals("OCX") || tipo.equals("DOC")) {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href='" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "'><img src='../../Dgp/Documento/Archivo/word.png' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ORIGINAL") + "</a>";
                    } else {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href='" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "'><img src='../../Dgp/Documento/Archivo/pdf.png' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ORIGINAL") + "</a>";
                    }
                } else {

                    texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href='" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "'><img src='" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "' style='width:100px;height:100px;' class='borde'></a>";
                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {

                throw new RuntimeException(e.getMessage());
            }
        }
        return texto_html;
    }

    @Override
    public String List_file_url2(String id) {
        String texto_html = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "select a.NO_FILE,a.NO_ORIGINAL  from RHTV_ARCHIVO_DOCUMENTO a ,  RHTV_DOCUMENTO_ADJUNTO d where d.ID_DOCUMENTO_ADJUNTO = a.ID_DOCUMENTO_ADJUNTO  and  a.id_documento_adjunto='" + id + "' and a.ES_FILE='1'";
            String sql2 = "select  count(*)  from RHTV_ARCHIVO_DOCUMENTO a ,  RHTV_DOCUMENTO_ADJUNTO d where d.ID_DOCUMENTO_ADJUNTO = a.ID_DOCUMENTO_ADJUNTO  and  a.id_documento_adjunto='" + id + "' and a.ES_FILE='1'";
            ResultSet rs = this.conn.query(sql);
            ResultSet rs2 = this.conn.query(sql2);
            //rs.moveToCurrentRow();
            int num = 0;
            while (rs2.next()) {
                num = rs2.getInt(1);
            }
            //  rs.first();
            int num2 = 0;
            while (rs.next()) {
                num2 = num2 + 1;
                //String tipo = rs.getString("NO_FILE").substring(rs.getString("NO_FILE").length() - 3, rs.getString("NO_FILE").length());
                texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ORIGINAL") + "' href='" + Url_Archivo + "Archivo/" + rs.getString("NO_FILE") + "'>" + rs.getString("NO_ORIGINAL") + "</a>";
                if (num2 != num) {
                    texto_html = texto_html + ",";
                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {

                throw new RuntimeException(e.getMessage());
            }
        }
        return texto_html;
    }

    @Override
    public String List_file_url3(String id) {
        String texto_html = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            String sql = "SELECT NO_ARCHIVO,NO_ARCHIVO_ORIGINAL FROM RHTV_CONTRATO_ADJUNTO where  ID_CONTRATO='" + id.trim() + "'";
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                String tipo = rs.getString("NO_ARCHIVO").substring(rs.getString("NO_ARCHIVO").length() - 3, rs.getString("NO_ARCHIVO").length());
                if (tipo.trim().equals("PDF") || tipo.equals("OCX") || tipo.equals("DOC")) {
                    if (tipo.equals("OCX") || tipo.equals("DOC")) {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ARCHIVO_ORIGINAL") + "' href='" + Url_Archivo + "Contratos_Adjuntos/" + rs.getString("NO_ARCHIVO") + "'><img src='" + Url_Archivo + "Contratos_Adjuntos/' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ARCHIVO_ORIGINAL") + "</a>";
                    } else {
                        texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ARCHIVO_ORIGINAL") + "' href='" + Url_Archivo + "Contratos_Adjuntos/" + rs.getString("NO_ARCHIVO") + "'><img src='" + Url_Archivo + "Contratos_Adjuntos/' style='width:100px;height:100px;' class='borde'><br>" + rs.getString("NO_ARCHIVO_ORIGINAL") + "</a>";
                    }
                } else {

                    texto_html = texto_html + "<a class='mustang-gallery' title='" + rs.getString("NO_ARCHIVO_ORIGINAL") + "' href='" + Url_Archivo + "Contratos_Adjuntos/" + rs.getString("NO_ARCHIVO") + "'><img src='" + Url_Archivo + "Contratos_Adjuntos/" + rs.getString("NO_ARCHIVO") + "' style='width:100px;height:100px;' class='borde'></a>";
                }
            }
            rs.close();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR : " + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {

                throw new RuntimeException(e.getMessage());
            }
        }
        return texto_html;
    }

    @Override
    public List<Documentos> List_Documentos() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "Select * from RHTR_DOCUMENTOS";
        List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            Documentos d = new Documentos();
            while (rs.next()) {
                d.setEs_documento(rs.getString("es_documento"));
                d.setId_documentos(rs.getString("id_documentos"));
                d.setId_tipo_planilla(rs.getString("id_tipo_planilla"));
                d.setNo_documento(rs.getString("es_no_documento"));
                d.setTi_documento(rs.getString("ti_documento"));
                list.add(d);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public List<Datos_Hijo_Trabajador> List_Hijos(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select RHTD_DATOS_HIJO_TRABAJADOR.*, rhfu_val_doc_hijo(ID_DATOS_HIJOS_TRABAJADOR) as val_doc from RHTD_DATOS_HIJO_TRABAJADOR where id_trabajador='" + id_trabajador.trim() + "' and (sysdate-fe_nacimiento)/360<18 and ES_DATOS_HIJO_TRABAJADOR='1'";
        List<Datos_Hijo_Trabajador> list = new ArrayList<Datos_Hijo_Trabajador>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Datos_Hijo_Trabajador dht = new Datos_Hijo_Trabajador();
                dht.setAp_materno(rs.getString("ap_materno"));
                dht.setAp_paterno(rs.getString("ap_paterno"));
                dht.setEs_datos_hijo_trabajador(rs.getString("es_datos_hijo_trabajador"));
                dht.setEs_estudio_niv_superior(rs.getString("es_estudio_niv_superior"));
                dht.setEs_inscripcion_vig_essalud(rs.getString("es_inscripcion_vig_essalud"));
                dht.setEs_presenta_documento(rs.getString("es_presenta_documento"));
                dht.setEs_sexo(rs.getString("es_sexo"));
                dht.setEs_tipo_doc(rs.getString("es_tipo_doc"));
                dht.setFe_creacion(rs.getString("fe_creacion"));
                dht.setFe_modif(rs.getString("fe_modif"));
                dht.setFe_nacimiento(rs.getString("fe_nacimiento"));
                dht.setId_datos_hijos_trabajador(rs.getString("id_datos_hijos_trabajador"));
                dht.setId_trabajador(rs.getString("id_trabajador"));
                dht.setIp_usuario(rs.getString("ip_usuario"));
                dht.setNo_hijo_trabajador(rs.getString("no_hijo_trabajador"));
                dht.setNu_doc(rs.getString("nu_doc"));
                dht.setUs_creacion(rs.getString("us_creacion"));
                dht.setUs_modif(rs.getString("us_modif"));
                dht.setVal_doc(rs.getInt("val_doc"));
                list.add(dht);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return list;

    }

    @Override
    public List<Padre_Madre_Conyugue> List_Conyugue(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM rhtm_trabajador where AP_NOMBRES_C is not null and id_trabajador='" + id_trabajador.trim() + "'";
        List<Padre_Madre_Conyugue> list = new ArrayList<Padre_Madre_Conyugue>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Padre_Madre_Conyugue pmc = new Padre_Madre_Conyugue();
                pmc.setAp_nombres_conyugue(rs.getString("AP_NOMBRES_C"));

                list.add(pmc);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public int List_Adventista(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(li_religion) as  num from RHTM_TRABAJADOR where li_religion = 1 and id_trabajador='" + id_trabajador + "'";
        int religion = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            religion = rs.getInt("num");
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return religion;
    }

    @Override
    public int List_Req_nacionalidad(String id_trabajador) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select count(id_nacionalidad) as num from rhtm_trabajador where id_trabajador not in ( select id_trabajador from rhtm_trabajador where id_nacionalidad = 'NAC-0193') and id_trabajador='" + id_trabajador.trim() + "'";
        int nacionalidad = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            nacionalidad = rs.getInt("num");
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return nacionalidad;
    }

    @Override
    public List<Lis_Doc_tra> List_doc_req_pla(String iddgp, String idtra) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT *  FROM RHVD_LIST_DOC_TRA  where  ID_TRABAJADOR='" + idtra + "'  ";

        if (iddgp != null) {
       ///     sql += (!iddgp.equals("")) ? " and ID_DGP='" + iddgp + "' " : "";
        }
        sql += " ORDER BY nu_orden";
        List<Lis_Doc_tra> x = new ArrayList<Lis_Doc_tra>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Lis_Doc_tra v = new Lis_Doc_tra();
                v.setTi_documento(rs.getString("TI_DOCUMENTO"));
                v.setNo_documento(rs.getString("NO_DOCUMENTO"));
                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setId_documentos(rs.getString("ID_DOCUMENTOS"));
                v.setId_documento_adjunto(rs.getString("ID_DOCUMENTO_ADJUNTO"));
                v.setId_dgp_doc_adj(rs.getString("ID_DGP_DOC_ADJ"));
                v.setId_dgp(rs.getString("ID_DGP"));
                v.setEs_obligatorio(rs.getString("ES_OBLIGATORIO"));
                v.setEs_documento_adjunto(rs.getString("ES_DOCUMENTO_ADJUNTO"));
                v.setEs_documento(rs.getString("ES_DOCUMENTO"));
                v.setEs_dgp_doc_adj(rs.getString("ES_DGP_DOC_ADJ"));
                v.setDe_documento_adjunto(rs.getString("DE_DOCUMENTO_ADJUNTO"));
                v.setId_datos_hijo(rs.getString("ID_DATOS_HIJO"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setEs_rec_fisico(rs.getString("es_rec_fisico"));
                x.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public void INSERT_DGP_DOC_ADJ(String ID_DGP_DOC_ADJ, String ID_DGP, String ID_DOCUMENTO_ADJUNTO, String ES_DGP_DOC_ADJ, String idtr, String idh) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DGP_DOC_ADJ( ?, ?, ?, ? ,?,?)} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, ID_DOCUMENTO_ADJUNTO.trim());
            cst.setString(4, ES_DGP_DOC_ADJ);
            cst.setString(5, idtr);
            cst.setString(6, idh);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public String INSERT_DOCUMENTO_ADJUNTO(String ID_DOCUMENTO_ADJUNTO, String ID_DOCUMENTOS, String ES_DOCUMENTO_ADJUNTO, String US_CREACION, String FE_CREACION, String US_MODIF, String FE_MODIF, String IP_USUARIO, String DE_DOCUMENTO_ADJUNTO, String NO_USUARIO, String ES_REC_FISICO, String ID_CONTRATO) {

        String id = "";
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DOCUMENTO_ADJUNTO( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)}");
            cst.setString(1, null);
            cst.setString(2, ID_DOCUMENTOS);
            cst.setString(3, ES_DOCUMENTO_ADJUNTO);
            cst.setString(4, US_CREACION);
            cst.setString(5, FE_CREACION);
            cst.setString(6, US_MODIF);
            cst.setString(7, FE_MODIF);
            cst.setString(8, IP_USUARIO);
            cst.setString(9, DE_DOCUMENTO_ADJUNTO);
            cst.setString(10, NO_USUARIO);
            cst.setString(11, ES_REC_FISICO);
            cst.registerOutParameter(12, Types.CHAR);
            cst.execute();
            id = cst.getString(12);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return id;
    }

    @Override
    public void INSERT_ARCHIVO_DOCUMENTO(String ID_ARCHIVO_DOCUMENTO, String ID_DOCUMENTO_ADJUNTO, String NO_FILE, String NO_ORIGINAL, String ES_FILE) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_ARCHIVO_DOCUMENTO( ?, ?, ?, ?, ? )} ");
            cst.setString(1, null);
            cst.setString(2, ID_DOCUMENTO_ADJUNTO.trim());
            cst.setString(3, NO_FILE);
            cst.setString(4, NO_ORIGINAL);
            cst.setString(5, "1");
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Reg_Dgp_Tra> List_Doc_CE() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = " SELECT f.ti_documento,   f.documento, f.es_obligatorio,   da.de_documento_adjunto,   da.es_documento_adjunto,  f.id_document, da.id_documento_adjunto,  da.id_contrato, da.es_rec_fisico ,da.id_dgp FROM  (SELECT dr.id_documentos AS id_document ,  dr.id_tipo_planilla    AS id_tipo_plani , dr.id_requerimiento    AS id_requerimient ,  dr.documento,   dr.ti_planilla, dr.planilla AS planilla , dr.id_requerimiento, dr.TI_DOCUMENTO, dr.es_obligatorio FROM rhvd_doc_plant_req dr, RHTR_REQUERIMIENTO r WHERE dr.id_requerimiento = r.id_requerimiento AND dr.ID_REQUERIMIENTO   = 'REQ-0019' )f LEFT OUTER JOIN (SELECT g.*, dd.id_dgp,  dd.id_contrato FROM rhtv_documento_adjunto g, RHTV_DGP_DOC_ADJ dd WHERE dd.id_documento_adjunto =g.id_documento_adjunto) da ON (f.id_document = da.id_documentos )";
        List<V_Reg_Dgp_Tra> list = new ArrayList<V_Reg_Dgp_Tra>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                V_Reg_Dgp_Tra d = new V_Reg_Dgp_Tra();
                d.setTi_documento(rs.getString("ti_documento"));
                d.setDocumento(rs.getString("documento"));
//                d.setNo_archivo(rs.getString("no_archivo"));
                d.setEs_obligatorio(rs.getString("es_obligatorio"));
                //              d.setAr_dato_archivo(rs.getString("ar_dato_archivo"));
                d.setDe_documento_adjunto(rs.getString("de_documento_adjunto"));
                d.setEs_documento_adjunto(rs.getString("es_rec_fisico"));
                d.setId_document(rs.getString("id_document"));
                d.setId_contrato(rs.getString("id_contrato"));
                d.setId_dgp(rs.getString("id_dgp"));
                list.add(d);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public int countDocumentsByIdTrabajador(String id) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT count(*) FROM RHVD_REQ_DGP_TRA where ID_TRABAJADOR='" + id + "' AND ID_DOCUMENTO_ADJUNTO IS NULL";
        int num = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return num;
    }

    @Override
    public void Desactivar_doc(String id_doc_adj) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_DESAC_DOC_ADJ(?)} ");
            cst.setString(1, id_doc_adj.trim());
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR :" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<V_Reg_Dgp_Tra> List_doc_tra(String idtra) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_REQ_DGP_TRA  where ID_TRABAJADOR='" + idtra + "'";
        List<V_Reg_Dgp_Tra> x = new ArrayList<V_Reg_Dgp_Tra>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                V_Reg_Dgp_Tra v = new V_Reg_Dgp_Tra();

                v.setId_document(rs.getString("id_document"));
                v.setId_tipo_plani(rs.getString("id_tipo_plani"));
                v.setId_requerimient(rs.getString("id_requerimient"));
                v.setDocumento(rs.getString("documento"));
                v.setTi_planilla(rs.getString("ti_planilla"));
                v.setPlanilla(rs.getString("planilla"));
                v.setIddgp(rs.getString("iddgp"));
                v.setFe_desde(rs.getString("fe_desde"));
                v.setFe_hasta(rs.getString("fe_hasta"));
                v.setCa_sueldo(rs.getDouble("ca_sueldo"));
                v.setDe_dias_trabajo(rs.getString("de_dias_trabajo"));
                v.setId_puesto(rs.getString("id_puesto"));
                v.setId_requerimiento(rs.getString("id_requerimiento"));
                v.setId_trabajador(rs.getString("id_trabajador"));
                v.setCo_ruc(rs.getString("co_ruc"));
                v.setDe_lugar_servicio(rs.getString("de_lugar_servicio"));
                v.setDe_servicio(rs.getString("de_servicio"));
                v.setDe_periodo_pago(rs.getString("de_periodo_pago"));
                v.setDe_domicilio_fiscal(rs.getString("de_domicilio_fiscal"));
                v.setDe_subvencion(rs.getString("de_subvencion"));
                v.setDe_horario_capacitacion(rs.getString("de_horario_capacitacion"));
                v.setDe_horario_refrigerio(rs.getString("de_horario_refrigerio"));
                v.setDe_dias_capacitacion(rs.getString("de_dias_capacitacion"));
                v.setEs_dgp(rs.getString("es_dgp"));
                v.setTi_documento(rs.getString("ti_documento"));
                v.setEs_obligatorio(rs.getString("es_obligatorio"));
                v.setId_documento_adjunto(rs.getString("id_documento_adjunto"));
                v.setId_documentos(rs.getString("id_documentos"));
                v.setEs_documento_adjunto(rs.getString("es_documento_adjunto"));
                v.setUs_creacion(rs.getString("us_creacion"));
                v.setFe_creacion(rs.getString("fe_creacion"));
                v.setUs_modif(rs.getString("us_modif"));
                v.setFe_modif(rs.getString("fe_modif"));
                v.setIp_usuario(rs.getString("ip_usuario"));
                v.setDe_documento_adjunto(rs.getString("de_documento_adjunto"));
                v.setId_contrato(rs.getString("id_contrato"));
                v.setEs_rec_fisico(rs.getString("es_rec_fisico"));
                v.setId_dgp(rs.getString("id_dgp"));
                x.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public int count_documentos_x_tra(String id_tra) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT count(*) FROM RHTV_DGP_DOC_ADJ where ID_TRABAJADOR='" + id_tra.trim() + "' and ES_DGP_DOC_ADJ='1'";
        int num = 0;
        try {
            ResultSet rs = this.conn.query(sql);
            rs.next();
            num = rs.getInt(1);
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }

        return num;
    }

    @Override
    public List<Documentos> Documentos() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT ID_DOCUMENTOS,NO_DOCUMENTO, ES_DOCUMENTO, TI_DOCUMENTO,ES_OBLIGATORIO FROM RHTR_DOCUMENTOS where ES_DOCUMENTO='1'";
        List<Documentos> list = new ArrayList<Documentos>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Documentos d = new Documentos();
                d.setEs_documento(rs.getString("ES_DOCUMENTO"));
                d.setId_documentos(rs.getString("ID_DOCUMENTOS"));
                d.setNo_documento(rs.getString("NO_DOCUMENTO"));
                d.setTi_documento(rs.getString("TI_DOCUMENTO"));
                list.add(d);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return list;
    }

    @Override
    public List<Lis_Doc_tra> Lis_doc_trabajador(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_DOC_TRA  where ID_TRABAJADOR='" + idtr.trim() + "' ORDER BY NU_ORDEN";
        List<Lis_Doc_tra> x = new ArrayList<Lis_Doc_tra>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Lis_Doc_tra v = new Lis_Doc_tra();
                v.setTi_documento(rs.getString("TI_DOCUMENTO"));
                v.setNo_documento(rs.getString("NO_DOCUMENTO"));
                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setId_documentos(rs.getString("ID_DOCUMENTOS"));
                v.setId_documento_adjunto(rs.getString("ID_DOCUMENTO_ADJUNTO"));
                v.setId_dgp_doc_adj(rs.getString("ID_DGP_DOC_ADJ"));
                v.setId_dgp(rs.getString("ID_DGP"));
                v.setEs_obligatorio(rs.getString("ES_OBLIGATORIO"));
                v.setEs_documento_adjunto(rs.getString("ES_DOCUMENTO_ADJUNTO"));
                v.setEs_documento(rs.getString("ES_DOCUMENTO"));
                v.setEs_dgp_doc_adj(rs.getString("ES_DGP_DOC_ADJ"));
                v.setDe_documento_adjunto(rs.getString("DE_DOCUMENTO_ADJUNTO"));
                v.setId_datos_hijo(rs.getString("ID_DATOS_HIJO"));
                x.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR");
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    @Override
    public void INSERT_DGP_DOC_tra(String ID_DGP_DOC_ADJ, String ID_DGP, String ID_DOCUMENTO_ADJUNTO, String ES_DGP_DOC_ADJ, String idtr, String idh) {
        try {
            this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
            CallableStatement cst = this.conn.conex.prepareCall("{CALL RHSP_INSERT_DGP_DOC_ADJ( ?, ?, ?, ? ,?,?)} ");
            cst.setString(1, null);
            cst.setString(2, null);
            cst.setString(3, ID_DOCUMENTO_ADJUNTO.trim());
            cst.setString(4, ES_DGP_DOC_ADJ);
            cst.setString(5, idtr.trim());
            cst.setString(6, idh);
            cst.execute();
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR"+ e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

    @Override
    public List<Lis_Doc_tra> Lis_doc_trabajador_hab(String idtr) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "SELECT * FROM RHVD_LIST_DOC_TRA WHERE ID_DOCUMENTO_ADJUNTO IS NOT NULL AND ID_TRABAJADOR='" + idtr.trim() + "'";
        List<Lis_Doc_tra> x = new ArrayList<Lis_Doc_tra>();
        try {
            ResultSet rs = this.conn.query(sql);

            while (rs.next()) {
                Lis_Doc_tra v = new Lis_Doc_tra();
                v.setTi_documento(rs.getString("TI_DOCUMENTO"));
                v.setNo_documento(rs.getString("NO_DOCUMENTO"));
                v.setId_trabajador(rs.getString("ID_TRABAJADOR"));
                v.setId_documentos(rs.getString("ID_DOCUMENTOS"));
                v.setId_documento_adjunto(rs.getString("ID_DOCUMENTO_ADJUNTO"));
                v.setId_dgp_doc_adj(rs.getString("ID_DGP_DOC_ADJ"));
                v.setId_dgp(rs.getString("ID_DGP"));
                v.setEs_obligatorio(rs.getString("ES_OBLIGATORIO"));
                v.setEs_documento_adjunto(rs.getString("ES_DOCUMENTO_ADJUNTO"));
                v.setEs_documento(rs.getString("ES_DOCUMENTO"));
                v.setEs_dgp_doc_adj(rs.getString("ES_DGP_DOC_ADJ"));
                v.setDe_documento_adjunto(rs.getString("DE_DOCUMENTO_ADJUNTO"));
                x.add(v);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e.getMessage());
        } catch (Exception e) {
            throw new RuntimeException("ERROR" + e.getMessage());
        } finally {
            try {
                this.conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

}
