/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.edu.upeu.application.dao_imp.InterfaceContratoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.X_List_Id_Contrato_DGP;

/**
 *
 * @author Admin
 */
public class ContratoDAO implements InterfaceContratoDAO {

    ConexionBD conn;

    @Override
    public boolean Insert_Contrato() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<X_List_Id_Contrato_DGP> List_id_Contrato_DGP(String id_trabajador, String id_anno) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select c.idcontrato, c.iddetalle_dgp,c.fec_desde, c.fec_hasta, c.fe_cese, c.id_func,pd.no_area,c.li_condicion , c.ca_sueldo,c.ca_reintegro,c.ca_asig_familiar\n"
                + ", c.ho_semana,c.nu_horas_lab,c.dia_contrato,c.ti_trabajador,c.li_regimen_laboral,c.es_discapacidad,c.ti_contrato,c.li_regimen_pensionario, c.es_contrato_trabajador,c.us_creacion,c.fe_creacion,c.us_modif,c.fe_modif,c.us_ip,c.fe_vacacio_ini,c.fe_vacacio_fin,\n"
                + "c.es_contrato,c.id_filial,pd.id_direccion,pd.id_departamento,pd.id_area,pd.id_seccion,pd.id_puesto,c.ca_bono_alimento,c.es_jefe,c.pares,c.li_tipo_convenio,c.es_firmo_contrato,c.nu_contrato,c.de_observacion,c.es_apoyo,c.ti_hora_pago\n"
                + ",c.nu_documento,c.id_anno,c.es_entregar_doc_reglamentos,c.es_registro_huella,c.de_registro_sistem_remu,c.id_trabajador, pd.id_puesto,pd.id_seccion,pd.id_area, pd.id_departamento,pd.id_direccion\n"
                + "from rhtm_contrato c, thvd_puesto_direccion pd   where c.id_puesto = pd.id_puesto and c.es_contrato='1' and c.id_trabajador='" + id_trabajador + "' and c.AÑO_ID='" + id_anno + "'";
        List<X_List_Id_Contrato_DGP> list = new ArrayList<X_List_Id_Contrato_DGP>();
        try {
            ResultSet rs = this.conn.query(sql);
            X_List_Id_Contrato_DGP icd = new X_List_Id_Contrato_DGP();
            while (rs.next()) {

                icd.setId_contrato(rs.getString("id_contrato"));
                icd.setId_dgp(rs.getString("id_dgp"));
                icd.setFe_desde(rs.getString("fe_desde"));
                icd.setFe_hasta(rs.getString("fe_hasta"));
                icd.setFe_cese(rs.getString("fe_cese"));
                icd.setId_func(rs.getString("id_func"));
                icd.setLi_condicion(rs.getString("li_condicion"));
                icd.setCa_sueldo(rs.getDouble("ca_sueldo"));
                icd.setCa_reintegro(rs.getDouble("ca_reintegro"));
                icd.setCa_asig_familiar(rs.getDouble("ca_asig_familiar"));
                icd.setHo_semana(rs.getDouble("ho_semana"));
                icd.setNu_horas_lab(rs.getDouble("nu_horas_lab"));
                icd.setDia_contrato(rs.getDouble("dia_contrato"));
                icd.setTi_trabajador(rs.getString("ti_trabajador"));
                icd.setLi_regimen_laboral(rs.getString("li_regimen_laboral"));
                icd.setEs_discapacidad(rs.getString("es_discapacidad"));
                icd.setTi_contrato(rs.getString("ti_contrato"));
                icd.setLi_regimen_pensionario(rs.getString("li_regimen_pensionario"));
                icd.setEs_contrato_trabajador(rs.getString("es_contrato_trabajador"));
                icd.setUs_creacion(rs.getString("us_creacion"));
                icd.setFe_creacion(rs.getString("fe_creacion"));
                icd.setUs_modif(rs.getString("us_modif"));
                icd.setFe_modif(rs.getString("fe_modif"));
                icd.setUs_ip(rs.getString("us_ip"));
                icd.setFe_vacacio_ini(rs.getString("fe_vacacio_ini"));
                icd.setFe_vacacio_fin(rs.getString("fe_vacacio_fin"));
                icd.setEs_contrato(rs.getString("es_contrato"));
                icd.setId_filial(rs.getString("id_filial"));
                icd.setId_direccion(rs.getString("id_direccion"));
                icd.setId_departamento(rs.getString("id_departamento"));
                icd.setId_area(rs.getString("id_area"));
                icd.setId_seccion(rs.getString("id_seccion"));
                icd.setId_puesto(rs.getString("id_puesto"));
                icd.setCa_bono_alimento(rs.getDouble("ca_bono_alimento"));
                icd.setEs_jefe(rs.getString("es_jefe"));
                icd.setLi_tipo_convenio(rs.getString("li_tipo_convenio"));
                icd.setEs_firmo_contrato(rs.getString("es_firmo_contrato"));
                icd.setNu_contrato(rs.getDouble("nu_contrato"));
                icd.setDe_observacion(rs.getString("de_observacion"));
                icd.setEs_apoyo(rs.getString("es_apoyo"));
                icd.setTi_hora_pago(rs.getString("ti_hora_pago"));
                icd.setNu_documento(rs.getString("nu_documento"));
                icd.setId_anno(rs.getString("id_anno"));
                icd.setEs_entregar_doc_reglamentos(rs.getString("es_entregar_doc_reglamentos"));
                icd.setEs_registro_huella(rs.getString("es_registro_huella"));
                icd.setDe_registro_sistem_remu(rs.getString("de_registro_sistem_remu"));
                icd.setId_trabajador(rs.getString("id_trabajador"));

                list.add(icd);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }
}
