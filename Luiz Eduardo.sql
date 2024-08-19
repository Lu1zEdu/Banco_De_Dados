create table Funcionario(mat_fun NUMBER(4) primary key,
                        nm_fun VARCHAR(30) NOT NULL,
                        dt_adm DATE NOT NULL,
                        salario NUMBER(10,2),
                        sexo CHAR(1)NOT NULL
                        );

create table Funcionario_2024(
mat_fun NUMBER(4)CONSTRAINT func_mat_pk Primary key,
nm_fun VARCHAR(30)CONSTRAINT func_nm_nn NOT NULL,
dt_adm DATE CONSTRAINT func_dt_nn NOT NULL,
salario NUMBER(10,2) ,
sexo CHAR(1) CONSTRAINT func_sx_nn NOT NULL,
fk_cargo number(4) constraint func_cargo_fk references cargo 
);

drop table cargo;

create table cargo(
cd_cargo number(4) constraint cargo_func_pk primary key,
nm_cargo varchar(25) constraint nm_cargo_func not null constraint nm_cargo_func_uk UNIQUE,
salario number(10,2) 
);

