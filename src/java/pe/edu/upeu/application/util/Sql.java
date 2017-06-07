/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.util;

/**
 *
 * @author santjair
 */
public class Sql {

    public static String queryWithPagination(String query, int pageNumber, int pageSize,String orderby) {
        /*add %s scape for java into selec, on last column and other after where clause*/
        return String.format(" SELECT * FROM(  " + query + "  ) WHERE row_number >= (((" + pageNumber + "-1) * " + pageSize + ") + 1)", " rownum row_number ", " AND  rownum < ((" + pageNumber + " * " + pageSize + ") + 1 ) ");

    }
}
