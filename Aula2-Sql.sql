Aula 1 - 19/08/24

-- comentários de linha
/* comentários várias linhas*/


Parte 1 - comandos DDL - estrutura

Data Definition Language

Create - cria tabelas
alter - altera estrutura pronta
drop - apaga tabelas

Tabela - Funcionario
         mat_fun - N - 4 - Pk
         nm_fun  - A - 30 - Nn
         dt_adm  - D - Nn
         salario - N - 8,2
         sexo    - C - 1 - Nn
         
Criando tabelas:
Sintaxe: create table table_name (column_name1 datatype(size) [constraint],
                                  column_name2 datatype(size) [constraint],
                                  ......................);
                                  
obs: constaint é opcional, nem todas as colunas tem

Exibindo a estrutura de uma tabela

sintaxe: desc table_name;

desc funcionario;

criando a tabela funcionário:


create table funcionario (mat_fun Number(4) Primary key,
                          nm_fun  varchar(30) Not null,
                          dt_adm  Date Not null,
                          salario Number(10,2),
                          sexo    Char(1) not null);

desc funcionario_2024;   

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null);
 
Relacionamentos: 1 - N - criando a FK

Tabela: cargo - cd_cargo - N - 4 - PK
                nm_cargo - A - 25 - Nn, Uk
                salario  - N - 8,2
                
create table cargo (cd_cargo number(4) constraint cargo_cd_pk1 primary key,
                    nm_cargo varchar(25) constraint cargo_nm_nn1 not null
                                         constraint cargo_nm_uk1 unique,
                    salario number(10,2));
                    
Tabela: Funcionário, já existe???? vamos apagar

Apagando uma tabela sem relacionamento

sintaxe: drop table table_name;

drop table funcionario_2024;

create table funcionario_2024
(mat_fun Number(4) constraint func_mat_pk Primary key,
 nm_fun  varchar(30) constraint func_nm_nn Not null,
 dt_adm  Date constraint func_dt_nn Not null,
 salario Number(10,2),
 sexo    Char(1) constraint func_sx_nn not null,
 fk_cargo number(4) constraint func_cargo_fk references cargo);
 
 obs fk: column_name datatype(syze) [constraint] references table_name
 
 references é a criação da foreign key (fk) ou chave estrangeira

Aula 2 - 02/09/20024
Aula 2 - Criando Relacionamento 1 - 1

CREATE TABLE PESSOA1 (COD_PESS1 NUMBER(3) PRIMARY KEY , NM_PESS1 VARCHAR(30) NOT NULL );

CREATE TABLE PESSOA2 ( COD_PESS2 NUMBER(3) PRIMARY KEY , NM_PESS2 VARCHAR(30) NOT NULL , FK_PESS NUMBER(3) UNIQUE REFERENCES PESSOA1 );

DML - Alterações de estrutura - Tabela

SiNTAXE : ALTER TABLE TABLE_NAME.......
VARIAÇÕES : 
            INCLUIR COLUNAS : ADD COLUM_NAME
            INCLUIR CONSTRAINT : ADD CONSTRAINT CONSTRAINT_NAME
            MODIFICAR TIPO DE DADOS : MODIFY
            MODIFICAR TAMANHO : MODIFY
            APAGAR COLUNA : DROP COLUM COLUM_NAME


CREATE TABLE TESTE(NOME NUMBER(4));

ALTER TABLE TESTE ADD CODIGO NUMBER(4);

ALTER TABLE TESTE ADD CONSTRAINT TESTE_CD_PK PRIMARY KEY(CODIGO);

ALTER TABLE TESTE MODIFY NOME VARCHAR(30);

ALTER TABLE TESTE MODIFY NOME VARCHAR(45);

ALTER TABLE TESTE DROP CONSTRAINT TESTE_CD_PK;

ALTER TABLE TESTE DROP COLUMN CODIGO;

ALTER TABLE TESTE RENAME COLUMN NOME TO NOME_CLIENTE ;

ALTER TABLE TESTE MODIFY NOME_CLIENTE NOT NULL;

DESC TESTE;

INSERT INTO TESTE VALUES ('Luiz Eduardo');
DESC TESTE;
INSERT INTO CARGO VALUES (1 ,'prog.JAVA' , 10000),(2, 'DBA' , 12500.80)
SELECT * FROM TESTE
SELECT * FROM CARGO
INSERT INTO CARGO VALUES(1 ,'prog.JAVA' , 10000);
INSERT INTO CARGO VALUES (2, 'DBA' , 12500.80)
INSERT INTO CARGO VALUES (3 ,'CEO' , 25000);
INSERT INTO CARGO VALUES(4, 'Adm Redes' , 8500) ; 
INSERT INTO CARGO VALUES(5 ,'Estagio' , 3300);
SELECT * FROM CARGO

INSERT INTO CARGO VALUES (6 , 'Adm Seg' , null)
SELECT * FROM CARGO

commit;
