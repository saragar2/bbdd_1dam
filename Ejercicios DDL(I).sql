-----1-----
CREATE TABLE PROVINCIAS(ID      NUMBER(2)
                        CONSTRAINT PROVINCIAS_PK PRIMARY KEY,
                        NOMBRE  VARCHAR2     NOT NULL);
INSERT INTO provincias VALUES (6, 'BADAJOZ');
INSERT INTO provincias VALUES (28, 'MADRID');
CREATE TABLE PERSONAS(ID             NUMBER(2)    PRIMARY KEY,
                      NOMBRE         VARCHAR2     NOT NULL,
                      DIRECCION      VARCHAR2,
                      ID_PROVINCIA   NUMBER(2)     NOT NULL
                      CONSTRAINT PERSONAS_FK REFERENCES PROVINCIAS);
INSERT INTO personas VALUES(1111, 'JUAN', 'MIRAFLORES 15', 'DON BENITO', 6);
INSERT INTO personas VALUES(2222, 'SUSANA', 'ISLAS 155', 'MADRID', 28);
--DELETE (no me acuerdo de como era)
-----2-----
INSERT INTO provincias VALUES (28, 'VALENCIA');
INSERT INTO personas VALUES(2222, 'CAROLINA', 'JARA S/N', 'MADRID', 28);
-----3-----
CREATE TABLE EJEMPLO1(DNI       VARCHAR2(10)
                      CONSTRAINT EJEMPLO1_PK PRIMARY KEY,
                      NOMBRE    VARCHAR2(30),
                      EDAD      NUMBER(2),
                      FECHA     DATE
                      DEFAULT SYSDATE);
INSERT INTO ejemplo1 VALUES('12345678V', 'SANTIAGO', 36);
-----4-----
CREATE TABLE EJEMPLO2(DNI       VARCHAR2(10)
                      CONSTRAINT EJEMPLO2_PK PRIMARY KEY,
                      NOMBRE    VARCHAR2(30)
                      DEFAULT 'NO DEFINIDO',
                      USUARIO   NUMBER
                      DEFAULT 0);
INSERT INTO ejemplo2 VALUES('1234567R');
-----5-----
CREATE TABLE EJEMPLO3(DNI       VARCHAR2(10)
                      CONSTRAINT EJEMPLO3_PK PRIMARY KEY NOT NULL,
                      NOMBRE    VARCHAR2(30), --hay que checkear si esta en mayusculas o no pero ns como
                      EDAD      NUMBER(2) NOT NULL
                      CONSTRAINT EJEMPLO3_CK1 CHECK (EDAD BETWEEN 5 AND 20),
                      CURSO     NUMBER
                      CONSTRAINT EJEMPLO3_CK3 CHECK (CURSO IN (1, 2, 3)));
INSERT INTO ejemplo3 VALUES('12345X', 'Pepe', 4, 1);
INSERT INTO ejemplo3 VALUES('12345X', 'PEPE', 10, 2);
INSERT INTO ejemplo3 VALUES('12345X', 'MARIA', 12, 2);
INSERT INTO ejemplo3 VALUES('22345X', 'MARIA', 12, 5);
INSERT INTO ejemplo3 VALUES('22345X', 'MARIA', 12, 2);
-----6-----

-----7-----