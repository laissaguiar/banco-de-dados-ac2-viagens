drop database if exists Cidades;
create database Cidades;
use Cidades;


create table Veiculo(
id              int          primary key        auto_increment,
nome            varchar(15),
placa           varchar(7),
numero_viagens   int                             references Viagem(id)
);

create table Condutor(
id           int          primary key        auto_increment,
nome         varchar(15)  not null,
cnh          float,
veiculo_id   int                             references Veiculo(id)
);

create table Viagem(
id                   int             primary key        auto_increment,
cidade_origem        varchar(20)     not null,
cidade_destino       varchar(20)     not null,
distancia_km         decimal(5,1)    not null,
data_ida             date            not null,
data_volta           date            not null,
veiculo_id           int                                references Veiculo(id)
);


insert into Veiculo(nome, placa, numero_viagens) values
("Gol", "ahd5600", 3),
("Uno", "pdc4691", 4),
("Fox", "rcv6b15", 5),
("HB20", "wee0z45", 6),
("Onix", "kpj0016", 6);

insert into Condutor(nome, cnh, veiculo_id) values 
("William", 000648553299, 1),
("Antonio", 153227964580, 2),
("Taylor", 445694235600, 3),
("Arthur", 788956223046, 4),
("Ada", 632569487966, 5),
("Martha", null, 6);

insert into Viagem(cidade_origem, cidade_destino, distancia_km, data_ida, data_volta, veiculo_id) values
("Sorocaba",       "Campinas",        88.9, '2022-03-19', '2022-03-20', 1),
("Sorocaba",       "Sao Paulo",       104.0, '2022-04-09', '2022-04-09', 1),
("Sorocaba",      "Campos do Jordao", 275.0, '2022-07-12', '2022-07-25', 1),
("Sorocaba",       "Porto Alegre",    1101.0, '2021-06-05', '2021-06-15', 2),
("Porto Alegre",   "Florianopolis",   456.0, '2021-10-10', '2021-10-16', 2),
("Florianopolis",  "Sorocaba",        658.0, '2021-12-20', '2022-01-03', 2),
("Sorocaba",       "Osasco",          81.8, '2022-05-08', '2022-05-10', 2),
("Sao Paulo",      "Guaruja",         98.0, '2022-02-27', '2022-03-04', 3),
("Sao Paulo",      "Paraty",          287.0, '2022-08-13', '2022-08-20', 3),
("Sao Paulo",      "Rio de Janeiro",  434.0, '2022-10-01', '2022-10-09', 3),
("Sao Paulo",      "Jundiai",         57.2, '2020-09-30', '2020-10-02', 3),
("Sao Paulo",      "Botucatu",        237.0, '2021-06-15', '2021-06-20', 3),
("Rio de Janeiro", "Japeri",          72.0, '2021-03-19', '2021-03-27', 4),
("Rio de Janeiro", "Cabo Frio",       152, '2021-12-07', '2021-12-20', 4),
("Rio de Janeiro", "Mage",            62.0, '2022-11-11', '2022-11-21', 4),
("Rio de Janeiro", "Petropolis",      62.2, '2022-02-15', '2022-02-16', 4),
("Rio de Janeiro", "Belo Horizonte",  444.0, '2022-07-10', '2022-07-26', 4),
("Rio de Janeiro", "Barbacena",       274.0, '2020-09-09', '2020-09-15', 4),
("Belo Horizonte", "Brumadinho",      57.3, '2020-05-20', '2020-05-22', 5),
("Belo Horizonte", "Igarape",         51.0, '2020-12-06', '2020-12-22', 5),
("Belo Horizonte", "Salvador",        1358.0, '2021-01-29', '2021-01-09', 5),
("Belo Horizonte", "Brasilia",        735.0, '2021-06-28', '2021-07-01', 5),
("Belo Horizonte", "Porto Seguro",    930.0, '2021-12-22', '2022-01-03', 5),
("Belo Horizonte", "Sao Paulo",       584.0, '2022-03-06', '2022-03-10', 5),
("Belo Horizonte", "Montes Claros",   426.0, '2022-11-18', '2022-11-22', 5);


/*
1 - (1 ponto) - Crie o digrama lógico do banco de dados
2 - (1 ponto) - Crie o script que cria as tabelas, seus relacionamentos e restrições
3 - (1 ponto) - Crie uma function que, dado a placa do veículo, retorna quantas viagens já fez.
4 - (1 ponto) - Crie uma procedure que, recebe apenas 4 parâmetros: cidade de orgiem, destino, condutor e veículo e registra uma viagem com data de saída no dia seguinte.
5 - (1 ponto) - Sempre que uma viagem for alterada, registre essa ocorrência em uma tabela apropriada.
6 - (1 ponto) - A origem deve ser sempre diferente do destino e a distância sempre maior que zero, seja a viagem registrada por procedures ou pelos comandos insert e update.
7 - (1 ponto) - Crie uma view que exibe os detalhes de todas as viagens, como nome das cidades, nome do condutor, placa e nome do veículo, data e etc.
8 - (1 ponto) - Selecione as distâncias entre todos os pares de cidades.
9 - (1 ponto) - Crie uma função que dado duas cidades, retorna a distância entre elas, ou lance um erro caso a distância ou as cidades não estiverem previamente definidas.
10 - (1 ponto) - Selecione todos os condutores sem CNH informada.
*/



/* 3 - (1 ponto) - Crie uma function que, dado a placa do veículo, retorna quantas viagens já fez.
*/
delimiter $
CREATE FUNCTION PlacaViagens(placa VARCHAR(7))
 RETURNS INT
BEGIN
DECLARE quantas_viagens INT
SELECT quantas_viagens = LOWER(str placa, GET)
FROM Veiculo 
RETURN quantas_viagens

END$

delimiter ;

/* 4 - (1 ponto) - Crie uma procedure que, recebe apenas 4 parâmetros: cidade de orgiem, destino, condutor e veículo e registra uma viagem com data de saída no dia seguinte.
*/
delimiter $ 
CREATE PROCEDURE Viagens_parametros()
BEGIN
SELECT cidade_origem, cidade_destino
FROM Viagem
JOIN Condutor ON Viagem.veiculo_id = Condutor.veiculo_id
WHERE veiculo_id = veiculo_id;
END$

delimiter ;


/* 5 - (1 ponto) - Sempre que uma viagem for alterada, registre essa ocorrência em uma tabela apropriada.
*/
CREATE TABLE Viagens(
	id              int          primary key        auto_increment,     
	cidade_origem        varchar(20), 
	cidade_destino       varchar(20), 
	distancia_km         decimal(5,1), 
	data_ida             date,
	data_volta           date,     
	veiculo_id           int
);

CREATE TABLE ViagensHistory(
id					int		primary key 	auto_increment,  
idViagemAlterada	int,
updateDateTime		datetime
);


 CREATE TRIGGER LogViagensAlteradas 
AFTER UPDATE
ON Viagens FOR EACH ROW
INSERT INTO  ViagensHistory
SET 
	idViagemAlterada = OLD.id,
    updateDateTime = CURRENT_TIMESTAMP;



/* 7 - (1 ponto) - Crie uma view que exibe os detalhes de todas as viagens, como nome das cidades, nome do condutor, placa e nome do veículo, data e etc.
*/
    CREATE view DetalhesViagens AS 
    SELECT cidade_origem, cidade_destino, Condutor.nome as Condutor, Veiculo.placa as PlacaVeiculo, Veiculo.nome, data_ida, data_volta
    FROM Viagem
    JOIN Condutor ON Viagem.veiculo_id = Condutor.veiculo_id
    JOIN Veiculo ON Viagem.veiculo_id = Veiculo.id
    group by Viagem.id;

/* 8 - (1 ponto) - Selecione as distâncias entre todos os pares de cidades.
*/
select cidade_origem, cidade_destino, distancia_km from Viagem;

/* 9 - (1 ponto) - Crie uma função que dado duas cidades, retorna a distância entre elas, ou lance um erro caso a distância ou as cidades não estiverem previamente definidas.
*/
delimiter $
CREATE FUNCTION Cidades(viagem_id INTEGER)
RETURN distancia_km 

END$

delimiter ; 

/* 10 - (1 ponto) - Selecione todos os condutores sem CNH informada.
*/
    select nome from Condutor where cnh is null;
