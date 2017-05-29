/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package pe.edu.upeu.application.dao_imp;

/**
 *
 * @author Alex
 */
public interface InterfacePeriodo_PagoDAO {
    public void InsetarPeriodo_Pago (String ID_PERIODO_PAGO, Double NU_CUOTA, String FE_PAGAR, Double CA_MONTO, String ID_DGP , String ES_PER_PAGO );
    
}
