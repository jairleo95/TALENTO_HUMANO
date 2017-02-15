package pe.edu.upeu.application.dao;

import java.util.concurrent.Executors;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ScheduledFuture;
import java.util.concurrent.TimeUnit;
import pe.edu.upeu.application.dao_imp.InterfaceCarga_AcademicaDAO;
import pe.edu.upeu.application.properties.globalProperties;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author JAIR
 */
public class ScheduledTest {

    private final ScheduledExecutorService scheduler = Executors.newScheduledThreadPool(1);
    //  Object obj[] = null;

    public ScheduledFuture<?> runForAnHour() {
        final Runnable beeper = new Runnable() {
            public void run() {
                System.out.println("::::Actualizando Carga Academica... :::");
                /*  InterfaceCarga_AcademicaDAO a = new Carga_AcademicaDAO();
                a.syncupCargaAcademica("2017-1", globalProperties.DOCENTESXCURSO_METHOD);*/
                System.out.println("::::Carga academica actualizada.::::");

            }
        };
       final ScheduledFuture<?> beeperHandle = scheduler.scheduleAtFixedRate(beeper, 10, 2, TimeUnit.SECONDS);
        // obj[0] = scheduler;
        scheduler.schedule(new Runnable() {
            public void run() {
                System.out.println("::::Update finished.");
                beeperHandle.cancel(true);
            }
        }, 30, TimeUnit.SECONDS);

        return beeperHandle;
    }
}
