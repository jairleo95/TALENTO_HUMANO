/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.dao_imp;

import java.util.List;
import pe.edu.upeu.application.model.DetalleReqProceso;

/**
 *
 * @author ALPHA
 */
public interface InterfaceDetalleReqProcesoDAO {

    public String insertDetalleReqProceso(DetalleReqProceso detalleReqProceso);

    public Boolean deleteDetalleReqProceso(String id);

    public Boolean updateDetalleReqProceso(DetalleReqProceso detalleReqProceso);

    public List<DetalleReqProceso> listDetalleReqProceso();
}
