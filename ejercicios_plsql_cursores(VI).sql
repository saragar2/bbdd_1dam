-----6-----

DECLARE
    CURSOR c_emp IS
    SELECT last_name, hire_date FROM hr.EMPLOYEES
    ORDER BY hire_date ASC;
BEGIN
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name ||  ' | ' || r_emp.hire_date);
    END LOOP;
END;

-----7-----

DECLARE
    CURSOR c_emp IS
    SELECT last_name, hire_date FROM hr.EMPLOYEES
    ORDER BY hire_date ASC;
    v_last_name hr.employees.last_name%TYPE;
    v_hire_date hr.employees.hire_date%TYPE;
BEGIN
    OPEN c_emp;
    FETCH c_emp INTO v_last_name, v_hire_date;
    WHILE c_emp%FOUND LOOP
        dbms_output.put_line(V_last_name ||  ' | ' || v_hire_date);
        FETCH c_emp INTO v_last_name, v_hire_date;
    END LOOP;
END;

-----8-----

CREATE OR REPLACE PROCEDURE longitud (len NUMBER) AS
    CURSOR c_emp IS
    SELECT employee_id, last_name FROM hr.employee
    WHERE last_name.lenght = len;
BEGIN
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name ||  ' | ' || r_emp.employee_id);
    END LOOP;
END;

DECLARE
    len NUMBER := 8;
    CURSOR c_emp IS
    SELECT employee_id, last_name FROM hr.employees
    WHERE LENGTH(last_name) = len;
BEGIN
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name ||  ' | ' || r_emp.employee_id);
    END LOOP;
END;

-----9-----

CREATE OR REPLACE PROCEDURE depart_plus (n NUMBER) AS
    CURSOR c_emp IS
    SELECT last_name, department_id FROM hr.EMPLOYEES
    WHERE DEPARTMENT_ID >= n AND department_id <= n+4;
BEGIN
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name ||  ' | ' || r_emp.department_id);
    END LOOP;
END;

DECLARE
    n NUMBER := 30;
    CURSOR c_emp IS
    SELECT last_name, department_id FROM hr.EMPLOYEES
    WHERE DEPARTMENT_ID >= n AND department_id <= n+40
    ORDER BY department_id;
BEGIN
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name ||  ' | ' || r_emp.department_id);
    END LOOP;
END;

-----10-----

DECLARE
    CURSOR c_emp IS
    SELECT last_name, employee_id FROM hr.employees
    ORDER BY (salary+7);

    v_last_name hr.employees.last_name%TYPE;
    v_employee_id   hr.employees.employee_id%TYPE;
BEGIN
    OPEN c_emp;
    FOR i IN 1..5 LOOP
        FETCH c_emp INTO v_last_name, v_employee_id;
        dbms_output.put_line(v_last_name ||  ' | ' || v_employee_id);
    END LOOP;
END;

-----11-----

CREATE OR REPLACE FUNCTION calculo_salario (s_min NUMBER, s_max NUMBER)
RETURN NUMBER AS
    CURSOR c_emp IS
    SELECT last_name FROM hr.EMPLOYEES
        WHERE salary >= s_min AND salary <= s_max;
    v_count   NUMBER;
BEGIN
    v_count := 0;
    FOR r_emp IN c_emp LOOP
        dbms_output.put_line(r_emp.last_name);
        v_count := v_count + 1;
    END LOOP;
    RETURN v_count;
EXCEPTION
    WHEN OTHERS THEN
        RETURN -1;
END;
