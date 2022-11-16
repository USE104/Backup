
drop database dbPI;

create database dbPI;	

show databases;

use dbPI;

create table tbFuncionario(
codFunc int auto_increment,
Nome varchar(45) not null,
CPF varchar (16) unique not null,
dataNascimento date,
CTPS varchar(35) unique not null,
Serie varchar(4) not null,
UF varchar(45) not null,
Tel varchar(15) not null,
Email varchar(45) not null,
Endereco varchar(80)not null,
Numero varchar(7) not null,
Complemento varchar(45) not null,
Cargo varchar(15) not null,
primary key (codFunc)
);


create table tbUsuario(
codUsuario int auto_increment,
Login varchar(20) unique not null,
Senha varchar(20) not null,
codFunc int not null,
primary key (codUsuario),
foreign key (codFunc) references tbFuncionario (codFunc)
);

create table tbUsuarioONG(
codusuarioONG int auto_increment,
Nome varchar(45) not null,
dataNascimento date not null,
Email varchar (100) not null,
Senha varchar(45) not null,
CPF varchar(45) unique not null,
Tel varchar(12) not null,
Experiencia varchar(12),
RedeSocial varchar (20),
codUsuario int not null,
primary key (codusuarioONG),
foreign key (codFunc) references tbFuncionario (codFunc)
);

create table tbONG(
codONG int auto_increment,
Nome varchar(45) not null,
Email varchar(100) not null,
Tel char(18) not null,
CNPJ char(25),
Endereco varchar(100) not null,
Numero varchar (10) not null,
Complemento varchar(40)not null,
Categoria varchar(15) not null,
Descricao varchar(150) not null,
WebSite varchar (75),
RedeSocial varchar (35),
codUsuario int  not null,
primary key (codONG),
foreign key (codFunc) references tbFuncionario (codFunc)
);

create table tbLoja(
codLoja int auto_increment,
nomeProduto varchar(10) not null,
Valor varchar (10) not null,
Quantidade varchar (5) not null,
Descricao varchar(15) not null,
codUsuario int not null,
primary key (codLoja),
foreign key (codFunc) references tbFuncionario (codFunc)
);




desc tbFuncionario;

insert into tbFuncionario (Nome,CPF,dataNascimento,CTPS,Serie,UF,Tel,Email,Endereco,Numero,Complemento,Cargo) values('Thaina','123.456.788-10','1952.01.25','907.54875.46-1','3554','SP','(011)1234-5578','thaina@tg.com','Av Paulista','12','Apt 1','Administrador');
insert into tbFuncionario (Nome,CPF,dataNascimento,CTPS,Serie,UF,Tel,Email,Endereco,Numero,Complemento,Cargo) values('Victoria','123.456.689-10','1953.02.17','108.95086.55-4','1254','SP','(011)1233-5678','victoria@tg.com','Av Morumbi','22','Casa 4','Supervisora');
insert into tbFuncionario (Nome,CPF,dataNascimento,CTPS,Serie,UF,Tel,Email,Endereco,Numero,Complemento,Cargo) values ('Jose Hugo','000.000.000-11','1997.05.31','100.10001.17-1','2147','SP','(011)1233-5645','jose@tg.com','Rebouca','254','Apt 12','Suporte');
insert into tbFuncionario (Nome,CPF,dataNascimento,CTPS,Serie,UF,Tel,Email,Endereco,Numero,Complemento,Cargo) values ('Caio','123.451.589-12','1953.02.17','113.10001.13-2','1458','SP','(011)1233-5777','caio@tg.com','Av Moema','912','Casa 5','SAC');
insert into tbFuncionario (Nome,CPF,dataNascimento,CTPS,Serie,UF,Tel,Email,Endereco,Numero,Complemento,Cargo) values ('Erik','123.156.589-10','1953.02.17','122.10001.15-7','1478','SP','(011)1244-5771','erik@tg.com','Av Pacaembu','145','Apt 12','Dev');

select * from tbFuncionario;

	

desc tbUsuario;

insert into tbUsuario (Login,Senha,codFunc) values ('admin-thai','gabrielti104',1);
insert into tbUsuario (Login,Senha,codFunc) values ('sup-vick','photografic',2);
insert into tbUsuario (Login,Senha,codFunc) values ('sac-caio','cabeloblue',3);
insert into tbUsuario (Login,Senha,codFunc) values ('sac-jhss','l0s3',4);	
insert into tbUsuario (Login,Senha,codFunc) values ('dev-erick','motorista',5);

select * from tbUsuario;


desc tbusuarioONG;

insert into tbusuarioONG (Nome,dataNascimento,Email,Senha,CPF,Tel,Experiencia,RedeSocial,codFunc) values ('Erik Oliveira','1997-06-27','Erick@senacsp.com','12345','111.111.111-11','(011)91234-5678','Iniciante','Github',2);
insert into tbusuarioONG (Nome,dataNascimento,Email,Senha,CPF,Tel,Experiencia,RedeSocial,codFunc) values ('Herick Cesar','1996-08-31','Herick.C@senacsp.com','123456','111.111.111-12','(011)91234-5659','Iniciante','Github',1);
insert into tbusuarioONG (Nome,dataNascimento,Email,Senha,CPF,Tel,Experiencia,RedeSocial,codFunc) values ('Wesley','1994-12-25','Wesley@senacsp.com','123457','111.111.111-13','(011)91234-5648','Iniciante','Linkdlin',3);
insert into tbusuarioONG (Nome,dataNascimento,Email,Senha,CPF,Tel,Experiencia,RedeSocial,codFunc) values ('Gabriel Souza','1940-12-24','gabriel.S@senacsp.com','123459','111.111.111-17','(011)91234-5677','Iniciante','Github',3);


select * from tbusuarioONG;


desc tbONG;


insert into tbONG (Nome,Email,Tel,CNPJ,Endereco,Numero,Complemento,Categoria,Descricao,WebSite,RedeSocial,codFunc) values('Arroz e Feijao','bomprato@mail.com','(11)1234-5678','63.958.777/0001-83','Av Paulista','254','Conj AB445','Alimentacao','Alimento para todos','','@BoaComida',1);
insert into tbONG (Nome,Email,Tel,CNPJ,Endereco,Numero,Complemento,Categoria,Descricao,WebSite,RedeSocial,codFunc) values('TrapoChique','doeroupa@mail.com','(11)1234-4478','','Av 23 de Maio','22','Conj 144','Vestimentacao','Roupa para todos','www.wordpress.trapochique.com','@TrapoChique',2);

select * from tbONG;


desc tbLoja;

insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Bolsa','R$30,50',' 10','Feita de materiais reciclaveis',2);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Camiseta tamanho diversos','R$ 20,50',' 30','Feita de materiais reciclaveis',1);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Pagina Exclusiva','R$ 15,50',' 30','Material de apoio e conteudo exclusivo',2);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Tablet','R$100,00',' 30','Ideal para estudos',2);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Lapis','R$2,00',' 10','Ideal para escrita e desenho',1);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Oculos','R$20,00',' 30','Armacao de Oculos',1);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Chaveiro','R$10,00',' 30','Chaveiro Personalizado',2);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Case de Celular','R$20,00',' 30','Diversos modelos',2);
insert into tbLoja (nomeProduto,Valor,Quantidade,Descricao,codFunc) values('Caderno Universitario','R$20,00',' 30','20 Materias e 160 Folhas',2);

select * from tbLoja;

