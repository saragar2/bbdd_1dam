/*EJERCICIO 1*/
create or replace procedure precio_producto (cod_producto varchar2) as
    v_precio producto.precio_venta%type;
begin
    select precio_venta into v_precio
        from producto 
    where codigo_producto=cod_producto;
    DBMS_OUTPUT.put_line('El precio de ese producto es: '|| v_precio);
exception 
    when no_data_found then
        dbms_output.put_line('Ningun producto con ese codigo');
    when others then 
        dbms_output.put_line('Error en la aplicacion: '||SQLERRM);
    
end precio_producto;
/
set serveroutput on;
begin
    precio_producto('11679');
end;
/
/*EJERCICIO 2*/
create or replace procedure modificar_precio (cod_producto varchar2, precio_venta_in number) as
    v_cont number;
    v_precio_actual producto.precio_venta%type;
begin 
    --compruebo que el producto existe
    select count(codigo_producto) into v_cont
        from producto
    where codigo_producto=cod_producto;
    --dbms_output.put_line(v_cont);
    if(v_cont>0) then --si existe consulto su precio para comprobar que no supera el 20%
        select precio_venta into v_precio_actual 
            from producto
        where codigo_producto=cod_producto;
        if(precio_venta_in<v_precio_actual*1.2) then
            update producto set precio_venta=precio_venta_in
                where codigo_producto=cod_producto; 
            commit;
        end if;
    else
        dbms_output.put_line('Ese codigo no existe');
    end if;
end modificar_precio;
/
begin 
    modificar_precio('11679',14.14);
end;
/
/*EJERCICIO 3*/
create or replace procedure cambiar_oficio(num_emple number, nuevo_oficio varchar2) as
    v_cont number;
    v_oficio_actual emple.oficio%type;
begin 
    select count(emp_no) into v_cont
        from emple
    where emp_no= num_emple;
    
    if(v_cont>0) then 
        select oficio into v_oficio_actual
            from emple
        where emp_no=num_emple;
        update emple set oficio=nuevo_oficio where emp_no=num_emple;
        dbms_output.put_line('El empleado indicado ha cambiado de:'||v_oficio_actual||' a '||nuevo_oficio);
    else 
        dbms_output.put_line('Ese codigo de trabajador no existe');
    end if;
exception 
    when no_data_found then
        dbms_output.put_line('Ningun empleado con ese codigo');
    when others then 
        dbms_output.put_line('Error en la aplicacion: '||SQLERRM);
end;
/
begin
    cambiar_oficio(7935,'PROGRAM');
end;
/
/*EJERCICIO 4*/
create or replace procedure cambiar_oficio_v2(nuevo_oficio varchar2) as
    v_num_emple_mayor emple.emp_no%type;
begin 
    select max(emp_no) into v_num_emple_mayor
        from emple;
    cambiar_oficio(v_num_emple_mayor,nuevo_oficio);
exception 
    when no_data_found then
        dbms_output.put_line('Ningun empleado con ese codigo');
    when others then 
        dbms_output.put_line('Error en la aplicacion: '||SQLERRM);
        rollback;
end cambiar_oficio_v2;
/
begin 
    cambiar_oficio_v2('prueba');
end;
/
/*EJERCICIO 5*/
create or replace function devolver_empleado(apellido_in varchar2)
        return number as
    v_cont number;
begin
    select count(emp_no) into v_cont
        from emple 
    where apellido=apellido_in;
    
    if(v_cont=0) then
        dbms_output.put_line('Ningun empleado con ese apellido');
        return -1;
    elsif(v_cont>1) then 
        
        dbms_output.put_line('Hay mas de un empleado con ese apellido');
        return -2;
    end if;
exception
    when no_data_found then
        return -1;
    when others then 
        return -3;
end devolver_empleado;
/
update emple set apellido='SANROMAN' where emp_no=7369;
set serverout on;
declare 
    v_resultado number;
begin
    v_resultado:=devolver_empleado('SANROMAN');
    dbms_output.put_line(v_resultado);
end;
/
/*ejercicio 6*/
create or replace procedure subir_salario(num_emple number, aumento number) as
    v_cont number;
    v_salario number;
begin 
    select count(emp_no) into v_cont
        from emple
    where emp_no=num_emple;
    if(v_cont>0) then
        --update emple set salario=salario+aumento where emp_no=num_emple;
        select salario into v_salario
            from emple
        where emp_no=num_emple;
        if(v_salario is not null) then 
            update emple set salario=salario+aumento where emp_no=num_emple;
        else
            update emple set salario=aumento where emp_no= num_emple;
        end if;
    end if;
/*exception 
    when raise_application_error then
        DBMS_OUTPUT.PUT_LINE('Ha funcionado la excepcion');*/
end subir_salario;
/
begin 
    subir_salario(8,50);
end;
/
/*ejercicio 7*/
insert into emple (emp_no,salario) values(8,null);
/*ejercicio 8.1*/
create or replace procedure insert_depart(nombre varchar2, localidad varchar2) as
    v_nombre_depart depart.dnombre%type;
    v_cont number;
    v_cont_d number;
begin
    select count(dept_no) into v_cont
        from depart
    where lower(dnombre)=lower(nombre);
    if(v_cont>0) then 
        dbms_output.put_line('Nombre de departamento duplicado');
    else
        select max(dept_no) into v_cont_d
            from depart;
        if(v_cont_d is null) then 
            insert into depart values (10,nombre,localidad);
        else
            insert into depart values (v_cont_d+10,nombre, localidad);
        end if;
    end if;
end insert_depart;
/
begin 
    insert_depart('I+D','chozas');
end;
/
/*EJERCICIO 8.2*/
insert into emple (emp_no,dept_no) values (10,60);
create or replace procedure borrar_depart (depart_borrar depart.dept_no%type, depart_nuevo depart.dept_no%type) as
    v_cont number;
begin
    select count(dept_no) into v_cont
        from depart 
    where dept_no=depart_nuevo;
    if(v_cont=0) then 
        dbms_output.put_line('El nuevo departamento no existe');
    else
        update emple set dept_no=depart_nuevo where dept_no=depart_borrar;
        delete from depart where dept_no=depart_borrar;
    end if;
end borrar_depart;
/
begin
    borrar_depart(60,50);
end;
/
/*EJERCICIO 8.3*/
create or replace procedure modifica_localidad (num_depart depart.dept_no%type, localidad depart.loc%type) as
    v_cont number;
begin 
    select count(dept_no) into v_cont
        from depart 
    where dept_no=num_depart;
    if(v_cont>0) then 
        update depart set loc=localidad where dept_no=num_depart;
    else
        dbms_output.put_line('No existe ese departamento');
    end if;
end modifica_localidad;
/
begin
    modifica_localidad(50,'chozas');
end;
/
/*EJERCICIO 8.4*/
create or replace procedure visualiza_datos_depart (num_depart depart.dept_no%type) as
    v_cont number;
    v_cont_emple number;
    v_loc depart.loc%type;
    v_dnombre depart.dnombre%type;
begin
    select count(dept_no) into v_cont
        from depart
    where dept_no=num_depart;
    if(v_cont>0) then 
        select dnombre, loc , count(emp_no) into v_dnombre, v_loc, v_cont_emple
            from depart d, emple e
        where d.dept_no= num_depart and e.dept_no=d.dept_no
        group by d.dept_no, dnombre, loc;
        DBMS_OUTPUT.PUT_LINE('El departamento: '||num_depart||' con nombre: '||v_dnombre
            ||' y localidad en: '||v_loc||' tiene '||v_cont_emple||' empleados');
    else
        dbms_output.put_line('No existe este departamento');
    end if;
end visualiza_datos_depart;
/
begin 
    visualiza_datos_depart(20);
end;
/
/*EJERCICIO 10*/
create or replace function borrar_depart_v2(num_depart depart.dept_no%type, minimo number, maximo number)
        return number as
    v_cont number;
    v_cont_emple number;
begin
    select count(dept_no) into v_cont
        from depart
    where dept_no=num_depart;
    if(v_cont>0) then
        select count(emp_no) into v_cont_emple
            from emple
        where dept_no=num_depart;
        if(v_cont_emple between minimo and maximo) then
            delete from emple where dept_no=num_depart;
            delete from depart where dept_no=num_depart;
            dbms_output.put_line('Se han eliminado '||v_cont_emple||' empleados');
            return v_cont_emple;
        end if;
    else
        return -1;
    end if;
end borrar_depart_v2;
/
declare 
    cont number;
begin
    cont:=borrar_depart_v2(1000,0,2);
end;
/




































































