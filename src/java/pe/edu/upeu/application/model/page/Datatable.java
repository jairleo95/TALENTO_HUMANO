/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package pe.edu.upeu.application.model.page;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author santjair
 */
public class Datatable {

    private Integer pageNumber;
    private Integer pageSize;
    private Integer draw;
    private Integer recordsTotal;
    private Integer recordsFiltered;

    private List<Object> data;

    public Datatable() {
        this.pageNumber = 0;
        this.pageSize = 0;
        this.draw = 0;
        this.recordsTotal = 0;
        this.recordsFiltered = 0;
        this.data = new ArrayList<Object>();
    }

    public Integer getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(Integer recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public Integer getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(Integer recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<Object> getData() {
        return data;
    }

    public void setData(List<Object> data) {
        this.data = data;
    }

    public Integer getDraw() {
        return draw;
    }

    public void setDraw(Integer draw) {
        this.draw = draw;
    }

    public Integer getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(Integer pageNumber) {
        this.pageNumber = pageNumber;
    }

    public Integer getPageSize() {
        return pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }

}
