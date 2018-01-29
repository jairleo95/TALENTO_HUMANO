/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.web.controller.recruitment;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import pe.edu.upeu.application.dao.DireccionDAO;
import pe.edu.upeu.application.dao.PresupuestoDAO;
import pe.edu.upeu.application.dao_imp.InterfaceDireccionDAO;
import pe.edu.upeu.application.dao_imp.InterfacePresupuestoDAO;

/**
 *
 * @author Leandro Burgos
 */
public class CPresupuesto extends HttpServlet {

    InterfaceDireccionDAO dO = new DireccionDAO();
    InterfacePresupuestoDAO pD = new PresupuestoDAO();
    Map<String, Object> rpta = new HashMap<>();

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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(true);
        //int opc = Integer.parseInt(request.getParameter("opc"));
        String opc = request.getParameter("opc");
        String idDestino, id, ccosto, temp, idPresupuesto, idDetalle, idPuesto;
        double sueldo_min, sueldo_max, bono_min, bono_max, boal_min, boal_max;
        int tipo, ntra, con, tiem;
        String tip = request.getParameter("tip");
        Map<String, Object> c = new HashMap<>();
        List<Map<String, Object>> detpres;
        String idpres;
        switch (opc) {
            case "gest":
                //response.sendRedirect("Vista/Presupuesto/Gpresupuesto.jsp");
                response.sendRedirect("Vista/Presupuesto/Gestionar_Presupuesto.jsp");
                break;
            case "list":
                rpta.put("rpta", dO.List_Direccion());
                break;
            case "regPres":
                idDestino = request.getParameter("id");
                temp = request.getParameter("temp");
                ccosto = request.getParameter("cc");
                ntra = Integer.parseInt(request.getParameter("ntra"));
                con = Integer.parseInt(request.getParameter("con"));
                tiem = Integer.parseInt(request.getParameter("tiem"));
                tip = request.getParameter("tip");
                c.put("id", idDestino);
                c.put("idUSER", session.getAttribute("IDUSER"));
                c.put("ntra", ntra);
                c.put("cc", ccosto);
                c.put("con", con);
                c.put("tiem", tiem);
                c.put("destino", tip);
                c.put("temp", temp);
                rpta.put("obj", pD.Reg_Presupuesto(c));
                break;
            case "reg":
                idDestino = request.getParameter("id");
                temp = request.getParameter("temp");
                ccosto = request.getParameter("cc");
                tip = request.getParameter("tip");
                c.put("id", idDestino);
                c.put("idUSER", session.getAttribute("IDUSER"));
                c.put("cc", ccosto);
                c.put("destino", tip);
                c.put("temp", temp);
                rpta.put("obj", pD.Reg_Presupuesto(c));
                break;
            case "comp":
                String dest = request.getParameter("dest");
                String idReq = request.getParameter("idreq");
                if (dest.equals("2")) {
                    idDestino = request.getParameter("idDes");
                    rpta.put("ntrac", pD.comprobarContratadosByDept(idDestino, idReq));
                    rpta.put("ntrad", pD.calcTrabPresByDept(idDestino, idReq));
                } else if (dest.equals("1")) {
                    idDestino = request.getParameter("idDes");
                    idpres = pD.getIdPresupuestoActual(idDestino);
                    rpta.put("ntrac", pD.comprobarContratadosByArea(idDestino, idReq));
                    rpta.put("ntrad", pD.calcTrabPresByArea(idpres, idReq));
                    rpta.put("idpres", idpres);
                    rpta.put("iddetpres", pD.getIdDetallePresupuestoActual(idpres, idReq));
                } else if (dest.equals(dest)) {
                    String iddetp = request.getParameter("iddetp");
                    String idpuesto = request.getParameter("idpuesto");
                    rpta.put("ntrac", pD.comprobarContratadosByPuesto(idpuesto, idReq));
                    rpta.put("detpuesto", pD.getDetPrePuesto(iddetp, idpuesto));
                }
                break;
            case "hist_con":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.historial_cont(idDestino));
                break;
            case "actual":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.getPresupuestoActual(idDestino));
                break;
            case "listActual":
                idDestino = request.getParameter("idDes");
                rpta.put("datos", pD.getDetallePresupuestoActual(idDestino));
                break;
            case "status":
                idDestino = request.getParameter("idDes");
                String idp = pD.statusPresupuesto(idDestino);
                rpta.put("rpta", idp);
                detpres = pD.listDetPres(idp);
                for (int i = 0; i < detpres.size(); i++) {
                    String iddetpres = (String) detpres.get(i).get("ID_DETALLE_PRESUPUESTO");
                    detpres.get(i).put("detalleprespuesto", pD.listDetPrePuesto(iddetpres));
                }
                rpta.put("detallepres", detpres);
                break;
            case "ccosto":
                id = request.getParameter("id");
                tipo = Integer.parseInt(request.getParameter("tipo"));
                rpta.put("cco", pD.CCostos(id, tipo));
                break;
            case "n_temp":
                String nombre = request.getParameter("temporada");
                String f_inicio = request.getParameter("f_i");
                String f_fin = request.getParameter("f_fin");
                idDestino = request.getParameter("idDes");
                tip = request.getParameter("tip");
                rpta.put("rp", pD.Reg_Temporada(nombre, f_inicio, f_fin, idDestino, tip));
                break;
            case "list_temp":
                idDestino = request.getParameter("idDes");
                rpta.put("temporadas", pD.listTemporadas(idDestino));
                break;
            case "regDetPre":
                idPresupuesto = request.getParameter("idPre");
                ntra = Integer.parseInt(request.getParameter("ntra"));
                con = Integer.parseInt(request.getParameter("con"));
                tiem = Integer.parseInt(request.getParameter("tiem"));
                c.put("idP", idPresupuesto);
                c.put("ntra", ntra);
                c.put("con", con);
                c.put("time", tiem);
                rpta.put("res", pD.Reg_Det_Presupuesto(c));
                break;
            case "listDetPre":
                idPresupuesto = request.getParameter("idPre");
                con = Integer.parseInt(request.getParameter("con"));
                tiem = Integer.parseInt(request.getParameter("tiem"));
                c.put("idP", idPresupuesto);
                c.put("con", con);
                c.put("time", tiem);
                rpta.put("detalle", pD.compDet(idPresupuesto, con, tiem));
                break;
            case "listNtra":
                idDetalle = request.getParameter("id");
                rpta.put("listaDet", pD.listDetalleTra(idDetalle));
                break;
            case "comPues":
                idPuesto = request.getParameter("puesto");
                idDetalle = request.getParameter("idDet");
                rpta.put("detTPuesto", pD.listDetalleTraPuesto(idPuesto, idDetalle));
                break;
            case "regPuesTra":
                idPuesto = request.getParameter("puesto");
                idDetalle = request.getParameter("idDet");
                ntra = Integer.parseInt(request.getParameter("nt"));
                int disp = pD.checkNumTraDispByDetPres(idDetalle);
                System.out.println("Disponible: " + disp + ", nuevos: " + ntra);
                if (ntra != 0 && ntra <= disp) {
                    rpta.put("ta", pD.Reg_DetTraPuesto(idPuesto, idDetalle, ntra));
                } else {
                    rpta.put("ta", 2);
                }
                break;
            case "infoPP":
                idPuesto = request.getParameter("idpues");
                idDetalle = request.getParameter("idDet");
                rpta.put("in", pD.infoPrePuesto(idPuesto, idDetalle));
                break;
            case "updateSueldo":
                c.put("idPrePuesto", request.getParameter("idprepuesto"));
                c.put("sueldo_min", Double.parseDouble(request.getParameter("sueldo_min")));
                c.put("sueldo_max", Double.parseDouble(request.getParameter("sueldo_max")));
                c.put("bono_min", Double.parseDouble(request.getParameter("bono_min")));
                c.put("bono_max", Double.parseDouble(request.getParameter("bono_max")));
                c.put("boal_min", Double.parseDouble(request.getParameter("boal_min")));
                c.put("boal_max", Double.parseDouble(request.getParameter("boal_max")));
                rpta.put("rpta", pD.UpdateDetSueldo(c));
                break;
            case "regPP":
                c.put("idDet", request.getParameter("idDet"));
                c.put("sueldo_min", Double.parseDouble(request.getParameter("sueldo_min")));
                c.put("sueldo_max", Double.parseDouble(request.getParameter("sueldo_max")));
                c.put("bono_min", Double.parseDouble(request.getParameter("bono_min")));
                c.put("bono_max", Double.parseDouble(request.getParameter("bono_max")));
                c.put("boal_min", Double.parseDouble(request.getParameter("boal_min")));
                c.put("boal_max", Double.parseDouble(request.getParameter("boal_max")));
                rpta.put("ac", pD.Reg_DetSueldo(c));
                break;
            case "infTra":
                idDetalle = request.getParameter("idDet");
                idpres = pD.getIdPresupuestoActual(idDetalle);
                System.out.println(idpres);
                Map<String, Object> mp = new HashMap<>();
                mp.put("idp", idpres);
                detpres = pD.listDetPres(idpres);
                for (int i = 0; i < detpres.size(); i++) {
                    String iddetpres = (String) detpres.get(i).get("ID_DETALLE_PRESUPUESTO");
                    detpres.get(i).put("detalleprespuesto", pD.listDetPrePuesto(iddetpres));
                }
                mp.put("detallepres", detpres);
                rpta.put("info", mp);
                break;
            case "presupuestoDetails":
                idp = request.getParameter("id");
                detpres = pD.listDetPres(idp);
                for (int i = 0; i < detpres.size(); i++) {
                    String iddetpres = (String) detpres.get(i).get("ID_DETALLE_PRESUPUESTO");
                    detpres.get(i).put("detalleprespuesto", pD.listDetPrePuesto(iddetpres));
                }
                rpta.put("detallepres", detpres);
                break;
        }

        Gson gson = new Gson();
        out.println(gson.toJson(rpta));
        out.flush();
        out.close();

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
