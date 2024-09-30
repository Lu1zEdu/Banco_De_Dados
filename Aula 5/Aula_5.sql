drop table cliente cascade constraints;
drop table vendedor cascade constraints;
drop table produto cascade constraints;
drop table pedido cascade constraints;
drop table item_pedido cascade constraints;
 
create table cliente
(cod_clie number(4) constraint clie_cd_pk primary key,
nome_clie varchar2(20) constraint clie_no_nn not null,
endereco varchar2(30),cidade varchar2(15),
cep char(8),
uf char(2),
cnpj char(14),
ie char(12));
 
create table vendedor
(cod_ven number(4) constraint ven_cod_pk primary key,
nome_ven varchar2(20) constraint ven_no_nn not null,
salario_fixo number(12,2),
comissao char(1));
 
create table produto
(cod_prod number(4) constraint prod1_cod_pk primary key,
unidade varchar2(3),
descricao varchar2(30),
val_unit number(10,2));
 
create table PEDIDO
(num_pedido number(4) constraint pedido_num_pk primary key,
pr_entrega number(3) constraint entrega_pr_nn not null,
cod_clie references cliente,
cod_ven references vendedor);
 
create table item_pedido
(num_pedido references pedido,
cod_prod references produto,
quant number(10,2));


insert into cliente values(720,'Ana','Rua 17 n.19','Niteroi','24358310','RJ','12113231000134','2134');
insert into cliente values(870,'Flavio','Av. Pres. Vargas, 10','Sao Paulo','22763931','SP','2253412693879','4631');
insert into cliente values(110,'Jorge','Rua Caiapo, 13','Curitiba','30078500','PR','1451276498349',null);
insert into cliente values(222,'Lucia','Rua Itabira, 123','Belo Horizonte','22124391','MG','28315212393488','2985');
insert into cliente values(830,'Mauricio','Av. Paulista, 1236','Sao Paulo','3012683','SP','3281698574656','9343');
insert into cliente values(130,'Edmar','Rua da Praia, s/n','Salvador','30079300','BA','234632842349','7121');
insert into cliente values(410,'Rodolfo','Largo da Lapa, 27','Rio de Janeiro','30078900','RJ','1283512823469','743');
insert into cliente values(20,'Beth','Av. Climerio, 45','Sao Paulo','25679300','SP','3248512673268','9280');
insert into cliente values(157,'Paulo','Trav. Moraes, casa 3','Londrina',null,'PR','328482233242','1923');
insert into cliente values(180,'Livio','Av. Beira Mar, 1256','Florianopolis','30077500','SC','1273657123474','1111');
insert into cliente values(260,'Susana','Rua Lopes Mandes, 12','Niteroi','30046500','RJ','217635712329','2530');
insert into cliente values(290,'Renato','Rua Meireles, 123','Sao Paulo','30225900','SP','1327657112314','1820');
insert into cliente values(390,'Sebastiao','Rua da Igreja, 10','Uberaba','30438700','MG','321765472133','9071');
insert into cliente values(234,'Jose','Quadra 3, Bl. 3, sl. 1003','Brasilia','22841650','DF','2176357612323','2931');

insert into vendedor values(209,'Jose','1800','C');
insert into vendedor values(111,'Carlos','2490','A');
insert into vendedor values(11,'Joao','2780','C');
insert into vendedor values(240,'Antonio','9500','C');
insert into vendedor values(720,'Felipe','4600','A');
insert into vendedor values(213,'Jonas','2300','A');
insert into vendedor values(101,'Joao','2650','C');
insert into vendedor values(310,'Josias','870','B');
insert into vendedor values(250,'Mauricio','2930','B');

insert into produto values ('25','KG','Queijo',0.97);
insert into produto values ('31','BAR','Chocolate',0.87);
insert into produto values ('78','L','Vinho',2.00);
insert into produto values ('22','M','Linho',0.11);
insert into produto values ('30','SAC','Acucar',0.30);
insert into produto values ('53','M','Linha',1.80);
insert into produto values ('13','G','Ouro',6.18);
insert into produto values ('45','M','Madeira',0.25);
insert into produto values ('87','M','Cano',1.97);
insert into produto values ('77','M','Papel',1.05);

insert into pedido values ('121','20','410','209');
insert into pedido values ('97','20','720','101');
insert into pedido values ('101','15','720','101');
insert into pedido values ('137','20','720','720');
insert into pedido values ('148','20','720','101');
insert into pedido values ('189','15','870','213');
insert into pedido values ('104','30','110','101');
insert into pedido values ('203','30','830','250');
insert into pedido values ('98','20','410','209');
insert into pedido values ('143','30','20','11');
insert into pedido values ('105','30','180','240');
insert into pedido values ('111','15','260','240');
insert into pedido values ('103','20','260','11');
insert into pedido values ('91','20','260','11');
insert into pedido values ('138','20','260','11');
insert into pedido values ('108','15','290','310');
insert into pedido values ('119','30','390','250');

insert into item_pedido values ('121','25','10');
insert into item_pedido values ('121','31','35');
insert into item_pedido values ('97','77','20');
insert into item_pedido values ('101','31','9');
insert into item_pedido values ('101','78','18');
insert into item_pedido values ('101','13','5');
insert into item_pedido values ('98','77','5');
insert into item_pedido values ('148','45','8');
insert into item_pedido values ('148','31','7');
insert into item_pedido values ('148','77','3');
insert into item_pedido values ('148','25','10');
insert into item_pedido values ('148','78','30');
insert into item_pedido values ('104','53','32');
insert into item_pedido values ('203','31','6');
insert into item_pedido values ('189','78','45');
insert into item_pedido values ('143','31','20');
insert into item_pedido values ('143','78','10');

COMMIT;



SELECT * FROM CLIENTE;
SELECT NOME_CLIE FROM CLIENTE; 

-- Exerc 1  :
SELECT * FROM VENDEDOR;
SELECT DESCRICAO , VAL_UNIT FROM PRODUTO;

-- Apelido nas colunas : 
SELECT  NOME_VEN NOME, SALARIO_FIXO "Salário vendedor" FROM VENDEDOR;

-- Classificando a saída de dados:
SELECT* FROM VENDEDOR ORDER BY NOME_VEN; -- ORDEM CRESCENTE
SELECT* FROM VENDEDOR ORDER BY NOME_VEN DESC; -- ORDEM DECRESENTE

SELECT * FROM CLIENTE ORDER BY 2; -- POSIÇÃO 2
SELECT NOME_CLIE , UF FROM CLIENTE ORDER BY 2; -- POSIÇÃO 2 :UF
SELECT NOME_CLIE , UF FROM CLIENTE ORDER BY 2 , 1; -- POSIÇÃO 2 E 1 DEPOIS


SELECT NOME_CLIE , UF FROM CLIENTE ORDER BY 2 , 1 DESC; -- POSIÇÃO 2 E 1 DEPOIS COM O DEC (ORDEM DECRESENTE)

-- FILTER

SELECT * FROM CLIENTE WHERE UF = 'SP';

SELECT * FROM CLIENTE WHERE UF = 'SP' OR UF='sp';

SELECT * FROM CLIENTE WHERE UF = 'SP' OR UF='sp';

-- Exerc 2 :

SELECT * FROM PRODUTO;
SELECT * FROM PRODUTO WHERE VAL_UNIT<2;
SELECT NOME_VEN ,SALARIO_FIXO FROM VENDEDOR WHERE SALARIO_FIXO>'3500' ORDER BY 2 DESC;
SELECT * FROM CLIENTE WHERE COD_CLIE>130 AND COD_CLIE<800;
SELECT NOME_CLIE, UF, IE FROM CLIENTE WHERE UF!='RJ' AND UF!='MG' AND IE<'2000';



