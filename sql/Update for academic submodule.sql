/*modificaciones carga academica*/
ALTER TABLE RHTR_SECCION 
ADD (CO_EAP CHAR(4) );
ALTER TABLE RHTM_CARGA_ACADEMICA 
ADD (CO_EAP CHAR(4) );

ALTER TABLE RHTM_CARGA_ACADEMICA 
ADD (CO_CURSO CHAR(4) );

ALTER TABLE RHTM_CARGA_ACADEMICA 
ADD (ID_EAP CHAR(8) );

ALTER TABLE RHTM_CARGA_ACADEMICA 
ADD (ID_CURSO CHAR );

ALTER TABLE RHTM_CARGA_ACADEMICA
ADD CONSTRAINT RHTM_CARGA_ACADEMICA_FK1 FOREIGN KEY
(
  ID_CURSO 
)
REFERENCES RHTX_CURSO
(
  ID_CURSO 
)
ENABLE;


  CREATE OR REPLACE FORCE VIEW "PROCESOSRH"."RHVD_CARGA_ACADEMICA" ("NU_DOC", "ES_TIPO_DOC", "NO_TRABAJADOR", "AP_PATERNO", "AP_MATERNO", "NO_EAP", "NO_FACULTAD", "DE_CONDICION", "DE_CARGA", "FE_DESDE", "FE_HASTA", "ID_PROCESO_CARGA_AC", "ES_PROCESADO", "FE_CREACION", "ID_TRABAJADOR", "ID_SITUACION_EDUCATIVA", "NO_S_EDUCATIVA", "PROFESION_DOCENTE", "COUNTCURSOS", "VALIDATEEXISTTRABAJADOR") AS 
  SELECT ca."NU_DOC",
    ca."ES_TIPO_DOC",
    ca."NO_TRABAJADOR",
    ca."AP_PATERNO",
    ca."AP_MATERNO",
    ca."NO_EAP",
    ca."NO_FACULTAD",
    ca."DE_CONDICION",
    ca."DE_CARGA",
    ca."FE_DESDE",
    ca."FE_HASTA",
    ca."ID_PROCESO_CARGA_AC",
    ca."ES_PROCESADO",
    ca."FE_CREACION",
    t.ID_TRABAJADOR ,
    t.ID_SITUACION_EDUCATIVA,
    t.NO_S_EDUCATIVA ,
   TRIM( t.profesion_docente) AS profesion_docente,
    rhfu_countCursosEAPCiclo(ca.NO_EAP,t.NU_DOC,ca.DE_CARGA) as countCursos, rhfu_validateExistTrabajador(ca.NU_DOC) as  validateExistTrabajador
  FROM
    (SELECT c.NU_DOC,
      c.ES_TIPO_DOC,
      c.NO_TRABAJADOR,
      c.AP_PATERNO,
      c.AP_MATERNO,
      c.NO_EAP,
      c.NO_FACULTAD ,
      c.DE_CONDICION,
      c. DE_CARGA,
      d.fe_desde,
      d.fe_hasta,
      d.ID_PROCESO_CARGA_AC,
      d.es_procesado,
      d.fe_creacion
    FROM RHTM_CARGA_ACADEMICA c
    LEFT OUTER JOIN
      (SELECT ca.*,
        dc.ID_DETALLE_CARGA_ACADEMICA,
        dc.ID_CARGA_ACADEMICA
      FROM RHTM_PROCESO_CARGA_ACADEMICA ca,
        RHTD_DETALLE_CARGA_ACADEMICA dc
      WHERE dc.ID_PROCESO_CARGA_AC = ca.ID_PROCESO_CARGA_AC
      AND dc.ES_DETALLE_CARGA      ='1'
      AND dc.ES_DETALLE_CARGA      ='1'
      ) d
    ON (c.id_carga_academica=d.id_carga_academica)
    GROUP BY nu_doc,
      c.ES_TIPO_DOC,
      c.NO_TRABAJADOR ,
      c.AP_PATERNO,
      c.AP_MATERNO,
      c.NO_EAP,
      c.NO_FACULTAD,
      c.DE_CONDICION,
      c.DE_CARGA,
      d.fe_desde,
      d.fe_hasta,
      d.ID_PROCESO_CARGA_AC,
      d.es_procesado,
      d.fe_creacion
    )ca
  LEFT OUTER JOIN
    (SELECT tr.ID_TRABAJADOR,
      tr.NU_DOC,
      s.ID_SITUACION_EDUCATIVA,
      s.NO_S_EDUCATIVA ,
      tr.NO_CARRERA AS profesion_docente
    FROM rhvd_trabajador tr
    LEFT OUTER JOIN RHTX_SITUACION_EDUCATIVA s
    ON (tr.ID_SITUACION_EDUCATIVA = s.ID_SITUACION_EDUCATIVA)
    ) t ON(trim( t.NU_DOC)        = trim(ca.NU_DOC));
    
    create or replace PROCEDURE              "RHSP_INSERT_DETALLE_CARGA_ACA" (
    ID_DETALLE_CARGA_ACADEMICA_SP RHTD_DETALLE_CARGA_ACADEMICA.ID_DETALLE_CARGA_ACADEMICA%TYPE,
    ID_PROCESO_CARGA_AC_SP RHTD_DETALLE_CARGA_ACADEMICA.ID_PROCESO_CARGA_AC%TYPE,
    ID_CARGA_ACADEMICA_SP RHTD_DETALLE_CARGA_ACADEMICA.ID_CARGA_ACADEMICA%TYPE,
    ES_DETALLE_CARGA_SP RHTD_DETALLE_CARGA_ACADEMICA.ES_DETALLE_CARGA%TYPE,
    ID_TABLE OUT RHTD_DETALLE_CARGA_ACADEMICA.ID_DETALLE_CARGA_ACADEMICA%TYPE )
IS
BEGIN
  INSERT
  INTO RHTD_DETALLE_CARGA_ACADEMICA
    (
      ID_DETALLE_CARGA_ACADEMICA,
      ID_PROCESO_CARGA_AC,
      ID_CARGA_ACADEMICA,
      ES_DETALLE_CARGA
    )
    VALUES
    (
      NULL ,
      ID_PROCESO_CARGA_AC_SP ,
      ID_CARGA_ACADEMICA_SP ,
      '1'
    )
  RETURNING ID_DETALLE_CARGA_ACADEMICA
  INTO ID_TABLE ;
  COMMIT;
  UPDATE RHTM_CARGA_ACADEMICA SET ES_PROCESADO='1' WHERE ID_CARGA_ACADEMICA= ID_CARGA_ACADEMICA_SP;
  COMMIT;
END ;
/
 

CREATE OR REPLACE FUNCTION "RHFU_CUOTAS_DOCENTE"(
    fe_desde        DATE,
    fe_hasta        DATE,
    ca_pago_mensual NUMBER)
  RETURN tabla_pd
IS
/* declaracion de la tabla */
  tabla_retorno tabla_pd;
  /*indice de la tabla de retorno por fila*/
  indice  NUMBER;

  i       NUMBER;
  
  j       INT;
  num_mes INT;
  anno    CHAR(4);
  mes     CHAR(2);
  fe_pago date;
BEGIN
/*instanciacion de la tabla a retornar*/
  tabla_retorno := tabla_pd();
  /* resta de meses en valor numerico, retorna el numero de meses en total*/
  SELECT to_number(TO_CHAR(fe_hasta,'mm'))- to_number(TO_CHAR(fe_desde,'mm'))+1
  INTO num_mes
  FROM dual;
  /*año de la fecha de inicio*/
  anno   :=TO_CHAR(fe_desde,'yyyy');
    /*mes de la fecha de inicio*/
  mes    :=TO_CHAR(fe_desde,'mm');
  
  /*iterador del primer while*/
  j      :=1;
  /*se itera los meses en total 4, 5, 6... meses*/
  WHILE j<=num_mes LOOP
   
/*la variable i contiene las semanas en decimales exactas*/
    i:=0.0;
    
    /*Inicio 1ra CONDICION*/
    /*para el primer mes se procesa la siguiente condicion*/
    IF j   =1 THEN
    /*se obtiene el numero de dias restantes para que termine el primer mes en la variable i y luego se divide en semanas (el valor es en decimales)*/
    
      i   :=( LAST_DAY(fe_desde)-fe_desde+1)/7;
      
      fe_pago:=LAST_DAY(fe_desde);
      /*condicion para cuando se alcanza el ultimo mes*/
    elsif j=num_mes THEN
    /*se resta el primer dia del ultiumo mes con el dia de la fecha que se ha elejido de la fecha de cese, se obtiene las semanas exactas del mes*/
      i   :=( (fe_hasta-add_months(to_date('01/'||mes||'/'||anno,'dd/mm/yyyy'),(j-1)) )+1)/7;
      fe_pago:=(fe_hasta);
    ELSE
    /*en caso contrario si mla iteracion se encuentra en los meses intermedios se obtiene de igual manera las semanas exactas en decimales*/
      i:=(LAST_DAY(add_months(to_date('01/'||mes||'/'||anno,'dd/mm/yyyy'),(j-1)))-add_months(to_date('01/'||mes||'/'||anno,'dd/mm/yyyy'),(j-1))+1)/7;
  fe_pago:=(LAST_DAY(add_months(to_date('01/'||mes||'/'||anno,'dd/mm/yyyy'),(j-1))));
    END IF;
    /*FIN DE LA 1ERA CONDICION*/
    
    /*3.14  para las fechas (en el caso de fecha de inicio y fin) meses que completan mas de las 3 semanas*/
    IF i                     >=3.14 THEN
      IF i                   <=4 OR i< 5 then 
      /*si se completan las 4 semanas*/
      tabla_retorno.extend;
        indice               := tabla_retorno.count;
        tabla_retorno(indice):= tabla_pago_docente('<div class="row"><div class="form-group has-success">'
        ||'<div class="col-md-3"><label>'||j||' </label><label> (4 Semanas)</label></div>'
                
            ||'<div class="col-md-5"><div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>'
        ||'<input type="date" class="form-control" value="'||TO_CHAR(fe_pago,'yyyy-mm-dd')||'" name="fe_pago' ||j||'" readonly />'
      -- ||'<span class="input-group-addon"><i class="fa fa-check"></i></span>'
      ||'</div></div>'
         ||'<div class="col-md-4"><div class="input-group"><span class="input-group-addon">S/.</span>'
        ||'<input type="text" class="form-control" name="MES'||j||'" readonly="" value="'
        ||(4*ca_pago_mensual)||'"  required />'
        ||'<span class="input-group-addon"><i class="fa fa-check"></i></span></div></div>'
       ||'</div>' );
      END IF;
      /*en el caso de que no se completen las 4 semanas*/
    elsif i<3.14 THEN
    /*en el caso de que sean mayores a una semana*/
      IF i >1 THEN
        tabla_retorno.extend;
        indice               := tabla_retorno.count;
        /*se calcula con las semanas en decimal y se redondea a dos decimales*/
        tabla_retorno(indice):= tabla_pago_docente('<div class="row"><div class="form-group has-success">'
        ||'<div class="col-md-3"><label>'||j||' </label><label> ('||TO_CHAR(ROUND(i,2),'99999999D99','NLS_NUMERIC_CHARACTERS = ''.,''')||' Semanas)</label></div>'
        
                
         ||'<div class="col-md-5"><div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>'
        ||'<input type="date" class="form-control" value="'||TO_CHAR(fe_pago,'yyyy-mm-dd')||'" name="fe_pago' ||j||'" readonly />'
      --||'<span class="input-group-addon"><i class="fa fa-check"></i></span>'
       ||'</div></div>'
       ||'<div class="col-md-4"><div class="input-group"><span class="input-group-addon">S/.</span>'
        ||'<input type="text" class="form-control" name="MES'
        ||j||'" readonly="" value="'||TO_CHAR(ROUND(i,2)*ca_pago_mensual,'99999999D99','NLS_NUMERIC_CHARACTERS = ''.,''')
        ||'"  required />'
        ||'<span class="input-group-addon"><i class="fa fa-check"></i></span></div></div>'
       ||'</div>' );
   /* 0.14 es un dia entero , la regla que pide el cliente es que si por lomenos se sobrepasa un dia,
   por ejemplo completan los 4 meses normales del ciclo mas 1 o 2 o 3 dias se cuentan como una semana
   (se le considera una semana mas de pago al docente)*/
      elsif i                 >0.14 THEN
        tabla_retorno.extend;
        indice               := tabla_retorno.count;
        tabla_retorno(indice):= tabla_pago_docente('<div class="row"><div class="form-group has-success">'
        ||'<div class="col-md-3"><label>'||j||' </label><label>(1 Semana)</label></div>'
        
        ||'<div class="col-md-5"><div class="input-group"><span class="input-group-addon"><i class="fa fa-calendar"></i></span>'
        ||'<input type="date" class="form-control" value="'||TO_CHAR(fe_pago,'yyyy-mm-dd')||'" name="fe_pago' ||j||'" readonly />'
      --||'<span class="input-group-addon"><i class="fa fa-check"></i></span>'
      ||'</div></div>'
        ||'<div class="col-md-4"><div class="input-group"><span class="input-group-addon">S/.</span>'
        ||'<input type="text" class="form-control" name="MES'
        ||j||'" readonly="" value="'||(1*ca_pago_mensual)||'"  required />'
        ||'<span class="input-group-addon"><i class="fa fa-check"></i></span></div></div>'
       ||'</div>' );
      END IF;
    END IF;
    j:=j+1;
  END LOOP;
RETURN tabla_retorno;
END;
/



  CREATE OR REPLACE FORCE VIEW "PROCESOSRH"."RHVD_AUTORIZAR_DGP" as
  SELECT t."ID_TRABAJADOR",
    t."NO_TRABAJADOR",
    t."AP_PATERNO",
    t."AP_MATERNO",
    t."NO_PUESTO",
    t."NU_PASOS",
    t."ID_DGP",
    t."CO_PASOS",
    t."ID_DETALLE_REQ_PROCESO",
    t."DE_PASOS",
    t."ID_DEPARTAMENTO",
    t."ID_PUESTO",
    t."ID_REQUERIMIENTO",
    t."ID_TIPO_PLANILLA",
    t."NO_REQ",
    t."ID_PASOS",
    t."NO_USUARIO",
    t."ID_USUARIO",
    t."NO_SECCION",
    t."NO_AREA",
    t."FE_CREACION",
    t."VAL_PLAZO",
    t."AR_FOTO",
    t."DE_FOTO",
    t."ID_FOTO",
    t."NO_AR_FOTO",
    t."TA_AR_FOTO",
    t."TI_AR_FOTO",
    t."VER_LIST_PLAZO",
    t."ELAB_CONTRATO",
    t."VAL_FIRM_CONTRATO",
    t."NO_DEP",
    t."MES_CREACION",
    t."VAL_COD_APS_EMPLEADO",
    t."VAL_COD_HUELLA_EMP",
    e.co_aps,
    e.co_huella_digital,
    t.LI_MOTIVO,
    t."ES_MFL",
    t.DI_CORREO_PERSONAL,
    t.DI_CORREO_INST,
    rhfu_validar_contrato_adjunto(t.ID_DGP) AS val_contrato_adjunto,
    t.ES_ACTIV_SIS_ESTADO,
    t.ES_PROC_ASIGNACION_F,rhfu_val_dgp_cotrato(t.id_dgp,t.id_trabajador) as val_dgp_contrato
    ,  RHFU_MES_PROCESAMIENTO_DGP(t.id_dgp) as mes_plazo
  FROM
    (SELECT e."ID_TRABAJADOR",
      e."NO_TRABAJADOR",
      e."AP_PATERNO",
      e."AP_MATERNO",
      e."NO_PUESTO",
      e."NU_PASOS",
      e."ID_DGP",
      e."CO_PASOS",
      e."ID_DETALLE_REQ_PROCESO",
      e."DE_PASOS",
      e."ID_DEPARTAMENTO",
      e."ID_PUESTO",
      e."ID_REQUERIMIENTO",
      e."ID_TIPO_PLANILLA",
      e."NO_REQ",
      e."ID_PASOS",
      e."NO_USUARIO",
      e."ID_USUARIO",
      e."NO_SECCION",
      e."NO_AREA",
      e."FE_CREACION",
      e.val_plazo,
      f.AR_FOTO,
      f.DE_FOTO,
      f.ID_FOTO,
      f.NO_AR_FOTO,
      f.TA_AR_FOTO,
      f.TI_AR_FOTO,
      rhfu_print_estado_plazo( e.id_dgp) AS ver_list_plazo,
      VAL_ELAB_CONTRATO( e.id_dgp)       AS ELAB_CONTRATO ,
      VA_ES_FIRM_CONTRATO( e.id_dgp)     AS val_firm_contrato,
      e.no_dep ,
      TO_CHAR(e.fe_mes,'MONTH','nls_date_language=spanish') AS mes_creacion,
      VAL_COD_APS_EMPLEADO(e.ID_TRABAJADOR)                 AS VAL_COD_APS_EMPLEADO,
      VAL_COD_HUELLA_EMPLEADO(e.ID_TRABAJADOR)              AS VAL_COD_HUELLA_EMP,
      e.LI_MOTIVO,
      e.ES_MFL,
      e.DI_CORREO_PERSONAL,
      e.DI_CORREO_INST,
      e.ES_ACTIV_SIS_ESTADO,
      e.ES_PROC_ASIGNACION_F
    
    FROM
      (SELECT dgp.id_trabajador,
        dt.NO_TRABAJADOR,
        dt.AP_PATERNO,
        dt.AP_MATERNO,
        pu.NO_PUESTO ,
        trim(ep.NU_PASOS) AS nu_pasos,
        dgp.id_dgp,
        ep.CO_PASOS,
        ep.ID_DETALLE_REQ_PROCESO,
        ep.DE_PASOS,
        ep.id_departamento,
        ep.id_puesto ,
        r.id_requerimiento,
        r.id_tipo_planilla,
        r.NO_REQ,
        ep.id_pasos ,
        ep.NO_USUARIO,
        ep.id_usuario,
        pu.no_seccion,
        pu.no_area,
        TO_CHAR(dgp.FE_CREACION,'dd/mm/yy HH:MI:SS') AS FE_CREACION,
        dgp.fe_creacion                              AS fe_mes,
        RHFU_VALIDAR_PLAZO_DGP(dgp.id_dgp)           AS val_plazo,
        pu.NO_DEP,
        dgp.LI_MOTIVO,
        dgp.ES_MFL,
        dt.DI_CORREO_PERSONAL,
        dt.DI_CORREO_INST,
        dgp.ES_ACTIV_SIS_ESTADO,
        dgp.ES_PROC_ASIGNACION_F
      FROM rhvd_user_aut ep ,
        rhtm_dgp dgp ,
        rhtm_trabajador dt ,
        rhvd_puesto_direccion pu ,
        rhtr_requerimiento r
      WHERE pu.id_puesto = dgp.id_puesto
      AND dgp.id_dgp     = ep.id_dgp
        /*   AND dgp.ID_PROCESO_CARGA_AC is null*/
      AND VAL_DGP_PROCESO( dgp.id_dgp )=0
      AND r.id_requerimiento           = ep.id_requerimiento
      AND dt.id_trabajador             = dgp.id_trabajador
      ORDER BY TO_NUMBER(SUBSTR(dgp.ID_DGP,5,LENGTH(dgp.ID_DGP))) DESC
      ) e
    LEFT OUTER JOIN RHTR_FOTOS_TRABAJADOR f
    ON (f.ID_TRABAJADOR = e.ID_TRABAJADOR)
    ) t
  LEFT OUTER JOIN RHTD_EMPLEADO e
  ON (T.ID_TRABAJADOR=e.ID_TRABAJADOR);

 ALTER TABLE RHTM_CARGA_ACADEMICA 
DROP CONSTRAINT SYS_C007605;

ALTER TABLE RHTM_CARGA_ACADEMICA
ADD CONSTRAINT SYS_C007605 PRIMARY KEY 
(
  NU_DOC 
, DE_HORARIO 
, DE_CARGA 
)
USING INDEX 
(
    CREATE UNIQUE INDEX SYS_C7605 ON RHTM_CARGA_ACADEMICA (NU_DOC ASC, DE_HORARIO ASC, DE_CARGA ASC) 
)
 ENABLE;
 
 create or replace function rhfu_validateIfCAItemExist(
nu_doc_sp rhtm_carga_academica.nu_doc%type
,ciclo rhtm_carga_academica.de_carga%type
,horario rhtm_carga_academica.de_horario%type) return int
as
i int;
begin
i:=0;
SELECT count(*) into i
    FROM rhtm_carga_academica
    WHERE 
    trim(nu_doc)=trim(nu_doc_sp)  and trim(de_carga)=trim(ciclo) and trim(de_horario)=trim(horario);
    return i;
end;
/
 
CREATE OR REPLACE PROCEDURE "RHSP_WS_CARGA_ACADEMICA"(
    ARR_CAMPUS        IN ARR_WS_CAMPUS,
    ARR_ES_TIPO_DOC   IN ARR_WS_ES_TIPO_DOC,
    ARR_NU_DOC        IN ARR_WS_NU_DOC,
    ARR_AP_PATERNO    IN ARR_WS_AP_PATERNO,
    ARR_AP_MATERNO    IN ARR_WS_AP_MATERNO,
    ARR_NO_TRABAJADOR IN ARR_WS_NO_TRABAJADOR,
    ARR_NO_FACULTAD   IN ARR_WS_NO_FACULTAD,
    ARR_NO_EAP        IN ARR_WS_NO_EAP,
    ARR_DE_CARGA      IN ARR_WS_DE_CARGA,
    ARR_NO_CURSO      IN ARR_WS_NO_CURSO,
    ARR_NU_GRUPO      IN ARR_WS_NU_GRUPO,
    ARR_DE_HORARIO    IN ARR_WS_DE_HORARIO,
    ARR_CA_HLAB       IN ARR_WS_CA_HLAB,
    ARR_DE_CONDICION  IN ARR_WS_DE_CONDICION,
    ARR_DE_TIPO_CURSO IN ARR_WS_DE_TIPO_CURSO,
    logRegister out varchar2 )
AS
  param CHAR(15 byte);
  g INT;
  countDuplicated int;
BEGIN
countDuplicated:=0;
  FOR i IN 1 .. ARR_NO_TRABAJADOR.COUNT
  LOOP
  if ARR_NU_DOC(i) is not null and ARR_NU_DOC(i)not in ('-','00000000','00000000  ')  
  AND ARR_DE_HORARIO(i) not in ('0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000')
  then
 g:=rhfu_validateIfCAItemExist(ARR_NU_DOC(i),ARR_DE_CARGA(i) ,ARR_DE_HORARIO(i));
 countDuplicated:=countDuplicated+g;
    IF g =0   THEN
 --RHSP_INSERT_CARGA_ACADEMICA(NULL, '1' , ARR_CAMPUS(i) , ARR_ES_TIPO_DOC(i) , ARR_NU_DOC(i) , ARR_AP_PATERNO(i) , ARR_AP_MATERNO(i) , ARR_NO_TRABAJADOR(i) , ARR_NO_FACULTAD(i) , ARR_NO_EAP(i) , ARR_DE_CARGA(i) , ARR_NO_CURSO(i) , ARR_NU_GRUPO(i) , ARR_DE_HORARIO(i) , ARR_CA_HLAB(i) , ARR_DE_CONDICION(i) , ARR_DE_TIPO_CURSO(i) , '0' , sysdate , param);
   --  commit;
  -- if trim(ARR_NU_DOC(i))='08148043' and trim(ARR_DE_CARGA(i))='2016-2' and trim(ARR_DE_HORARIO(i))='1000000100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000' then
  RHSP_INSERT_CARGA_ACADEMICA(NULL, '1' , ARR_CAMPUS(i) , ARR_ES_TIPO_DOC(i) , ARR_NU_DOC(i) , ARR_AP_PATERNO(i) , ARR_AP_MATERNO(i) , ARR_NO_TRABAJADOR(i) , ARR_NO_FACULTAD(i) , ARR_NO_EAP(i) , ARR_DE_CARGA(i) , ARR_NO_CURSO(i) , ARR_NU_GRUPO(i) , ARR_DE_HORARIO(i) , ARR_CA_HLAB(i) , ARR_DE_CONDICION(i) , ARR_DE_TIPO_CURSO(i) , '0' , sysdate , param);
   
  -- logRegister:=logRegister||' row register :'||ARR_NU_DOC(i)||' '||ARR_DE_CARGA(i)||' '||ARR_DE_HORARIO(i)||' ::';
  -- end if;
  --logRegister:=logRegister||' row register :'||ARR_NU_DOC(i)||' '||ARR_DE_CARGA(i)||' '||ARR_DE_HORARIO(i)||' \n';
  --logRegister:=logRegister||','||ARR_NU_DOC(i);
  --else
--logRegister:=logRegister||' row register :'||ARR_NU_DOC(i)||' '||ARR_DE_CARGA(i)||' '||ARR_DE_HORARIO(i)||' \n';
 END IF;
    END IF;
  END LOOP;
   logRegister:=logRegister||'::Registros procesados en BD:'||ARR_NO_TRABAJADOR.COUNT||'::Numero de duplicados:'||countDuplicated;
END;
/
 
DROP INDEX SYS_C007605;

CREATE UNIQUE INDEX INDICE_CLAVE_UNICA ON RHTM_CARGA_ACADEMICA (NU_DOC ASC, DE_CARGA ASC, DE_HORARIO ASC) 
LOGGING 
TABLESPACE "USERS" 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;
