/*EJERCICIO 9*/
create or replace function numero_libros_leidos (fecha_inicial date, fecha_final date, nombre paraleer.nombre_libro%type) 
        return number as
    v_cont_libros number;
begin
    select count(cod_libro) into v_cont_libros
        from leidos
    where fecha between fecha_inicial and fecha_final
            and cod_libro in (select cod_libro
                                from paraleer
                            where lower(nombre_libro)=lower(nombre));
    return v_cont_libros;
end numero_libros_leidos;
/
declare 
    v_resultado number;
begin 
    v_resultado:=numero_libros_leidos(to_date('01/01/69','dd/mm/rr'), to_date('01/01/99','dd/mm/rr'),'LOS MITOS GRIEGOS');
    dbms_output.put_line(v_resultado);
end;
/
