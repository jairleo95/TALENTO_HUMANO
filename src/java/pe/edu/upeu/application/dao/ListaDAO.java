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
import pe.edu.upeu.application.dao_imp.InterfaceListaDAO;
import pe.edu.upeu.application.factory.ConexionBD;
import pe.edu.upeu.application.factory.FactoryConnectionDB;
import pe.edu.upeu.application.model.Auto_Mostrar;
import pe.edu.upeu.application.model.Carrera;
import pe.edu.upeu.application.model.Nacionalidad;
import pe.edu.upeu.application.model.Proceso;
import pe.edu.upeu.application.model.Universidad;

/**
 *
 * @author Admin
 */
public class ListaDAO implements InterfaceListaDAO {

    ConexionBD conn;

    @Override
    public List<Nacionalidad> List_Nacionalidad() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_nacionalidad order by no_nacionalidad ";
        List<Nacionalidad> list = new ArrayList<Nacionalidad>();
        try {
            ResultSet rs = this.conn.query(sql);
          
            while (rs.next()) {
                  Nacionalidad n = new Nacionalidad();
                n.setId_nacionalidad(rs.getString("id_nacionalidad"));
                n.setNo_nacionalidad(rs.getString("no_nacionalidad"));
                list.add(n);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Proceso> List_Proceso() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtv_proceso order by no_proceso";
        List<Proceso> list = new ArrayList<Proceso>();
        try {
            ResultSet rs = this.conn.query(sql);
          
            while (rs.next()) {
                  Proceso p = new Proceso();
                p.setDe_proceso(rs.getString("de_proceso"));
                p.setId_proceso(rs.getString("id_proceso"));
                p.setNo_proceso(rs.getString("no_proceso"));
                list.add(p);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Carrera> List_Carrera() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_carrera";
        List<Carrera> list = new ArrayList<Carrera>();
        try {
            ResultSet rs = this.conn.query(sql);
           
            while (rs.next()) {
                 Carrera c = new Carrera();
               c.setId_carrera(rs.getString("id_carrera"));
               c.setNo_carrera(rs.getString("no_carrera"));               
                list.add(c);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Universidad> List_Universidad() {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select * from rhtx_universidad order by no_universidad";
        List<Universidad> list = new ArrayList<Universidad>();
        try {
            ResultSet rs = this.conn.query(sql);
            
            while (rs.next()) {
                Universidad u = new Universidad();
                u.setId_universidad(rs.getString("id_universidad"));
                u.setNo_universidad(rs.getString("no_universidad"));
                list.add(u);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<Auto_Mostrar> List_Auto_mostrar(String id_rol) {
        this.conn = FactoryConnectionDB.open(FactoryConnectionDB.ORACLE);
        String sql = "select di_url from RHTX_AUTO_MOSTRAR where ID_ROL='"+id_rol+"'";
        List<Auto_Mostrar> list = new ArrayList<Auto_Mostrar>();
        try {
            ResultSet rs = this.conn.query(sql);
           
            while (rs.next()) {
                 Auto_Mostrar am = new Auto_Mostrar();
                am.setDi_url(rs.getString("di_url"));
               // am.setId_auto_mostrar(rs.getString("id_auto_mostrar"));
            //    am.setId_rol(rs.getString("id_rol"));
                list.add(am);
            }
        } catch (SQLException e) {
        } finally {
            this.conn.close();
        }
        return list;
    }

    @Override
    public List<String> List_Estado_Civil() {
        List<String> list = new ArrayList<String>();
        list.add("Soltero(a)");
        list.add("Casado(a)");
        list.add("Divorcio(a)");
        list.add("Viudo(a)");
        list.add("Separado(a)");
        list.add("Conviviente(a)");  
        return list;
    }

    @Override
    public List<String> List_Doc() {
        List<String> list = new ArrayList<String>();
        list.add("DNI");
        list.add("Carne de Extrangeria");
        list.add("Pasaporte");
        return list;
    }

    @Override
    public List<String> List_Gs() {
 List<String> list = new ArrayList<String>();
        list.add("A");
        list.add("B");
        list.add("AB");
        list.add("O");
        return list;
    }

    @Override
    public List<String> List_Sp() {
         List<String> list = new ArrayList<String>();
        list.add("AFP");
        list.add("ONP");
        list.add("Ninguno");
        list.add("Sin Régimen Privisional(juvilado,cesante).");
        return list;
    }

    @Override
    public List<String> List_Nom_AFP() {
         List<String> list = new ArrayList<String>();
        list.add("Integra");
        list.add("Prima");
        list.add("Profuturo");
        list.add("Horizonte");
        return list;
    }

    @Override
    public List<String> List_Nivel_Educativo() {
         List<String> list = new ArrayList<String>();
        list.add("Ninguno");
        list.add("Primaria Incompleta");
        list.add("Primaria Completa");
        list.add("Superior No Universitario Incompleto");
        list.add("Superior No Universitario Completo");
        list.add("Superior Universitario Incompleto");
        list.add("Superior Universitario Completo");
        list.add("Superior Post Grado Incompleto");
        list.add("Superior Post Grado Completo");
        return list;
    }

    @Override
    public List<String> List_Grado_Academico() {
         List<String> list = new ArrayList<String>();
        list.add("Ninguno");
        list.add("Bachiller");
        list.add("Magister");
        list.add("Doctor");
        return list;
    }

    @Override
    public List<String> List_Dom_D1_Id() {
         List<String> list = new ArrayList<String>();
        list.add("Avenida");
        list.add("Jiron");
        list.add("Manzana");
        list.add("Calle");
        list.add("Pasaje");
        list.add("Alameda");
        list.add("Malecon");
        list.add("Ovalo");
        list.add("Plaza");
        list.add("Carretera");
        list.add("Block");
        return list;
    }

    @Override
    public List<String> List_Dom_D5_Id() {
         List<String> list = new ArrayList<String>();
        list.add("Urbanizacion");
        list.add("Pueblo Joven");
        list.add("Unidad Vecinal");
        list.add("Conjunto Habitacional");
        list.add("Asentamiento Humano");
        list.add("Cooperativa");
        list.add("Residencial");
        list.add("Zona Industrial");
        list.add("Grupo");
        list.add("Caserio");
        list.add("Fundo");
        list.add("Ninguno");
        return list;
    }

    @Override
    public List<String> List_Jefe() {
         List<String> list = new ArrayList<String>();
        list.add("No es Jefe");
        list.add("Jefe de Sección");
        list.add("Jefe de Area");
        list.add("Jefe de Departamento");
        list.add("Jefe de Dirección");
        return list;
    }

    @Override
    public List<String> list_Condicion_contrato() {
         List<String> list = new ArrayList<String>();
        list.add("Contrato");
        list.add("Contrato Independiente");
        list.add("Empleado");
        list.add("Misionero");
        list.add("MFL-Práctica Pre-Profesional");
        list.add("MFL-Práctica Profesional");
        list.add("MFL-CLJ");
        list.add("MFL-Contrato");
        return list;
    }

    @Override
    public List<String> List_tipo_contrato() {
         List<String> list = new ArrayList<String>();
        list.add("Necesidad de Mercado");
        list.add("Incremento de Actividad");
        list.add("Servicio Específico");
        list.add("Inicio de Actividad");
        list.add("Tiempo Parcial");
        list.add("Independiente");
        list.add("Extranjero");
        list.add("Suplencia");
        list.add("Contrato Civil");
        list.add("De Temporada");
        list.add("Locaion de Servicios");
        list.add("No Domiciliados");
        return list;
    }

    @Override
    public List<String> List_Situacion_Actual() {
         List<String> list = new ArrayList<String>();
        list.add("Activo");
        list.add("Término de Contrato");
        list.add("Renuncia Voluntaria");
        list.add("Traslado a otra Filial/Institución");
        list.add("No Inicio Relacion Laboral");
        list.add("Cambio de Modalidad Contractual");
        list.add("Abandono de Trabajo");
        return list;
    }
    
    public  String [][]List_H  (){
        String [][] l= new String[7][2];
        l[0][0]="lun";
        l[0][1]="Lunes";
        
        l[1][0]="mar";
        l[1][1]="Martes";
        
        l[2][0]="mie";
        l[2][1]="Miercoles";
        
        l[3][0]="jue";
        l[3][1]="Jueves";
        
        l[4][0]="vie";
        l[4][1]="Viernes";
        
        l[5][0]="sab";
        l[5][1]="Sabado";
        
        l[6][0]="dom";
        l[6][1]="Domingo";
        
    return l;
    }

}
