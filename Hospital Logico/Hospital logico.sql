drop schema Modelagem_logica;
create schema if not exists Modelagem_logica default character set utf8mb4;
use Modelagem_logica;

create table if not exists departamentos(
cod_especialidade int,
nome_especialidade varchar(45),
primary key (cod_especialidade)
);
create table if not exists pacientes(
cpf_paciente VARCHAR(45) not null,
nome varchar(45) not null,
data_nasc date not null,
telefone varchar(45) not null,
email varchar(45) not null,
primary key(cpf_paciente));

create table if not exists medicos(
crm int not null,
uf char not null,
nome varchar(45) not null,
email varchar(45) not null, 
telefone varchar(45) not null,
depart_cod_especialidade int not null,
primary key(crm, uf),
constraint depto_med 
foreign key (depart_cod_especialidade) references departamentos(cod_especialidade)
);



create table if not exists consultas(
id_consultas varchar(45) not null,
anamnese text(45) not null,
data_con date not null,
hora time not null,
cpf_paciente varchar(45) not null,
crm_cons int,
uf_cons char(2),
cpf_paciente_con varchar(45),
primary key(id_consultas),
constraint cpf_paciente_con foreign key(cpf_paciente_con)
references pacientes(cpf_paciente),
constraint med_cons foreign key(crm_cons, uf_cons)
references medicos(crm, uf),
constraint pac_cons foreign key (cpf_paciente) references pacientes(cpf_paciente)
);

