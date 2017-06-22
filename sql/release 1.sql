create or replace function rhfu_convertTaskToNumber(taskNumber varchar2) return number
is
begin
return to_number(substr(taskNumber,2,length(taskNumber))); 
end;
/

create or replace function rhfu_aut_complete_time(iddgp rhtv_autorizacion.id_dgp%type, idaut rhtv_autorizacion.id_autorizacion%type) return number is
cursor autQuery is select fe_creacion,id_autorizacion from rhtv_autorizacion where id_dgp=iddgp ORDER BY fe_creacion ASC ;
autInit date;
i int;
completeTime number;
BEGIN
i:=0;completeTime:=0;
for r in autQuery loop
i:=i+1;
  if  r.id_autorizacion =idaut  then
    if i>1 then 
      completeTime:=r.fe_creacion-autInit;
    end if;
  else 
    autInit:=r.fe_creacion;
  end if;
end loop;
return completeTime;
END;
/

--and id_autorizacion='AUT-009746' ;

select * from rhtv_autorizacion where id_dgp='DGP-001364' ORDER BY fe_creacion ASC ;
        
 select rhfu_aut_complete_time('DGP-001364','AUT-008941') from dual;