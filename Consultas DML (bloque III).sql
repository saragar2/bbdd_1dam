-----1-----
----pendiente
-----2-----
-----3-----
-----4-----
-----5-----
INSERT INTO emple30
    SELECT *
        FROM emple
    WHERE dept_no = 30;
-----6-----
-----7-----
INSERT INTO emple VALUES (1111, 'GARCÍA', 'LIMPIADOR', 7698, SYSDATE, 130000, 11000, (SELECT MAX(dept_no)
                                                                                                  FROM emple));
-----8-----
INSERT INTO emple
    SELECT 1112, 'QUIROGA', oficio, dir, SYSDATE, salario, comision, dept_no
        FROM emple
    WHERE emp_no = 7788;
----9-----
