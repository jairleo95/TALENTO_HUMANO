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
import pe.edu.upeu.application.dao_imp.InterfaceTipo_DocumentoDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Tipo_Documento;

/**
 *
 * @author ALFA 3
 */
public class Tipo_DocumentoDAO implements InterfaceTipo_DocumentoDAO {

    ConexionBD conn;

    @Override
    public List<Tipo_Documento> Listar_tipo_doc() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_tipo_doc_ident order by ID_TIPO_DOC_IDENT";
        List<Tipo_Documento> list = new ArrayList<Tipo_Documento>();
        try {
            ResultSet rs = this.conn.query(sql);
            while (rs.next()) {
                Tipo_Documento r = new Tipo_Documento();
                r.setId_tipo_doc_ident(rs.getString("ID_TIPO_DOC_IDENT"));
                r.setDe_tip_doc(rs.getString("DE_TIP_DOC"));
                r.setDe_tdoc_abreviada(rs.getString("DE_TDOC_ABREVIADA"));
                r.setCo_tdoc(rs.getString("CO_TDOC"));
                list.add(r);
            }

        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }

        return list;

    }

}
