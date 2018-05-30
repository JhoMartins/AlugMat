--Fechando conexões do banco ALUGMAT para permitir exclusão
USE MASTER;

GO

ALTER DATABASE ALUGMAT SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

GO

ALTER DATABASE ALUGMAT SET SINGLE_USER;

GO

--Excluindo banco ALUGMAT
DROP DATABASE ALUGMAT;

GO

--Criando banco ALUGMAT
CREATE DATABASE ALUGMAT;

GO

USE ALUGMAT;

GO

--Executar a partir desse ponto se não for necessário excluir o banco, mas sim algumas tabelas
DROP TABLE PERFIL;

GO

CREATE TABLE PERFIL (
ID INT PRIMARY KEY IDENTITY,
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1),
MARCA CHAR(1),
OCULTAR CHAR(1),
PER_DESCRICAO VARCHAR(50),
PER_USUARIO CHAR(1),
PER_USUARIO_I CHAR(1),
PER_USUARIO_A CHAR(1),
PER_USUARIO_E CHAR(1),
PER_PERFIL CHAR(1),
PER_PERFIL_I CHAR(1),
PER_PERFIL_A CHAR(1),
PER_PERFIL_E CHAR(1),
PER_MARCA CHAR(1),
PER_MARCA_I CHAR(1),
PER_MARCA_A CHAR(1),
PER_MARCA_E CHAR(1),
PER_CATEGORIA CHAR(1),
PER_CATEGORIA_I CHAR(1),
PER_CATEGORIA_A CHAR(1),
PER_CATEGORIA_E CHAR(1),
PER_FORNECEDOR CHAR(1),
PER_FORNECEDOR_I CHAR(1),
PER_FORNECEDOR_A CHAR(1),
PER_FORNECEDOR_E CHAR(1),
PER_PRODUTO CHAR(1),
PER_PRODUTO_I CHAR(1),
PER_PRODUTO_A CHAR(1),
PER_PRODUTO_E CHAR(1),
PER_CLIENTE CHAR(1),
PER_CLIENTE_I CHAR(1),
PER_CLIENTE_A CHAR(1),
PER_CLIENTE_E CHAR(1),
PER_ALUGUEL CHAR(1),
PER_ALUGUEL_I CHAR(1),
PER_ALUGUEL_A CHAR(1),
PER_ALUGUEL_E CHAR(1)
)

GO

--Inserindo Perfil para teste com todas as permissões liberadas
INSERT INTO PERFIL (STATUS, PER_DESCRICAO, PER_USUARIO,PER_USUARIO_I,PER_USUARIO_A,PER_USUARIO_E,PER_PERFIL,PER_PERFIL_I,PER_PERFIL_A,PER_PERFIL_E,PER_MARCA,PER_MARCA_I,PER_MARCA_A,PER_MARCA_E,PER_CATEGORIA,PER_CATEGORIA_I,PER_CATEGORIA_A,PER_CATEGORIA_E,PER_FORNECEDOR,PER_FORNECEDOR_I,PER_FORNECEDOR_A,PER_FORNECEDOR_E,PER_PRODUTO,PER_PRODUTO_I,PER_PRODUTO_A,PER_PRODUTO_E,PER_CLIENTE,PER_CLIENTE_I,PER_CLIENTE_A,PER_CLIENTE_E,PER_ALUGUEL,PER_ALUGUEL_I,PER_ALUGUEL_A,PER_ALUGUEL_E)
VALUES ('S','Gerente', 'S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S','S');
INSERT INTO PERFIL (STATUS, PER_DESCRICAO, PER_USUARIO,PER_USUARIO_I,PER_USUARIO_A,PER_USUARIO_E,PER_PERFIL,PER_PERFIL_I,PER_PERFIL_A,PER_PERFIL_E,PER_MARCA,PER_MARCA_I,PER_MARCA_A,PER_MARCA_E,PER_CATEGORIA,PER_CATEGORIA_I,PER_CATEGORIA_A,PER_CATEGORIA_E,PER_FORNECEDOR,PER_FORNECEDOR_I,PER_FORNECEDOR_A,PER_FORNECEDOR_E,PER_PRODUTO,PER_PRODUTO_I,PER_PRODUTO_A,PER_PRODUTO_E,PER_CLIENTE,PER_CLIENTE_I,PER_CLIENTE_A,PER_CLIENTE_E,PER_ALUGUEL,PER_ALUGUEL_I,PER_ALUGUEL_A,PER_ALUGUEL_E)
VALUES ('S','Atendente', 'S','N','N','N', 'S','N','N','N','S','S','S','N','S','S','S','N','S','S','S','N','S','S','S','N','S','S','S','N','S','S','S','N');
INSERT INTO PERFIL (STATUS, PER_DESCRICAO, PER_USUARIO,PER_USUARIO_I,PER_USUARIO_A,PER_USUARIO_E,PER_PERFIL,PER_PERFIL_I,PER_PERFIL_A,PER_PERFIL_E,PER_MARCA,PER_MARCA_I,PER_MARCA_A,PER_MARCA_E,PER_CATEGORIA,PER_CATEGORIA_I,PER_CATEGORIA_A,PER_CATEGORIA_E,PER_FORNECEDOR,PER_FORNECEDOR_I,PER_FORNECEDOR_A,PER_FORNECEDOR_E,PER_PRODUTO,PER_PRODUTO_I,PER_PRODUTO_A,PER_PRODUTO_E,PER_CLIENTE,PER_CLIENTE_I,PER_CLIENTE_A,PER_CLIENTE_E,PER_ALUGUEL,PER_ALUGUEL_I,PER_ALUGUEL_A,PER_ALUGUEL_E)
VALUES ('S','Estagiário', 'S','N','N','N', 'S','N','N','N','S','N','N','N','S','N','N','N','S','N','N','N','S','N','N','N','S','N','N','N','S','N','N','N');

GO

DROP TABLE USUARIO;

GO

CREATE TABLE USUARIO (
ID INT PRIMARY KEY IDENTITY,
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1),
MARCA CHAR(1),
USU_NOME VARCHAR(50),
USU_DEPARTAMENTO VARCHAR(100),
USU_LOGIN VARCHAR(10),
USU_SENHA VARCHAR(10),
USU_ID_PERFIL INT
)

GO

--Inserindo usuário de teste com todas as permissões liberadas (Login: TESTE / Senha: 123)
INSERT INTO USUARIO (STATUS, USU_NOME, USU_DEPARTAMENTO, USU_LOGIN, USU_SENHA, USU_ID_PERFIL) VALUES ('S','Jhonatan Martins', 'Desenvolvimento', 'jhbmartins', '123456', 1);
INSERT INTO USUARIO (STATUS, USU_NOME, USU_DEPARTAMENTO, USU_LOGIN, USU_SENHA, USU_ID_PERFIL) VALUES ('S','Cristiane Poletto', 'Desenvolvimento', 'cpoletto', '123', 1);
INSERT INTO USUARIO (STATUS, USU_NOME, USU_DEPARTAMENTO, USU_LOGIN, USU_SENHA, USU_ID_PERFIL) VALUES ('S','Deividson Sabino', 'Suporte', 'desabino', '123456', 1);
INSERT INTO USUARIO (STATUS, USU_NOME, USU_DEPARTAMENTO, USU_LOGIN, USU_SENHA, USU_ID_PERFIL) VALUES ('S','Felipe Noronha', 'Vendas', 'fenoronha', '1234', 2);
INSERT INTO USUARIO (STATUS, USU_NOME, USU_DEPARTAMENTO, USU_LOGIN, USU_SENHA, USU_ID_PERFIL) VALUES ('S','Francisco Bióca', 'Vendas', 'frbioca', '1234', 3);
GO

DROP TABLE MARCA;

GO

CREATE TABLE MARCA (
ID INT PRIMARY KEY IDENTITY,
DESCRICAO VARCHAR(30) NOT NULL,
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1) NOT NULL
)

GO

INSERT INTO MARCA (DESCRICAO, DATA_INC, DATA_ALT, STATUS) VALUES ('Gedore', CURRENT_TIMESTAMP, NULL, 'S')
INSERT INTO MARCA (DESCRICAO, DATA_INC, DATA_ALT, STATUS) VALUES ('Belzer', CURRENT_TIMESTAMP, NULL, 'S')

GO

DROP TABLE CATEGORIA;

GO

CREATE TABLE CATEGORIA (
ID INT PRIMARY KEY IDENTITY,
DESCRICAO VARCHAR(30) NOT NULL,
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1) NOT NULL
)

GO

INSERT INTO CATEGORIA (DESCRICAO, DATA_INC, DATA_ALT, STATUS) VALUES ('Peças', CURRENT_TIMESTAMP, NULL, 'S')
INSERT INTO CATEGORIA (DESCRICAO, DATA_INC, DATA_ALT, STATUS) VALUES ('Máquinas', CURRENT_TIMESTAMP, NULL, 'S')

GO

DROP TABLE FORNECEDOR;

GO

CREATE TABLE FORNECEDOR (
ID INT PRIMARY KEY IDENTITY,
RAZAO_SOCIAL VARCHAR(50) NOT NULL,
NOME_FANTASIA VARCHAR(50),
CNPJ VARCHAR(18) NOT NULL, --00.000.000/0000-00
IE VARCHAR(15) NOT NULL, --000.000.000.000
LOGRADOURO VARCHAR(20) NOT NULL,
NOME_LOGRADOURO VARCHAR(50) NOT NULL,
NUM INT NOT NULL,
COMPLEMENTO VARCHAR(20),
BAIRRO VARCHAR(30) NOT NULL,
CIDADE VARCHAR(40) NOT NULL,
ESTADO CHAR(2) NOT NULL,
TELEFONE VARCHAR(13), --(00)0000-0000
CELULAR VARCHAR(14), --(00)00000-0000
EMAIL VARCHAR(50),
CONTATO VARCHAR(50),
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1) NOT NULL
)

GO

INSERT INTO FORNECEDOR (RAZAO_SOCIAL, CNPJ, IE, LOGRADOURO, NOME_LOGRADOURO, NUM, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, TELEFONE, CELULAR, EMAIL, CONTATO, DATA_INC, DATA_ALT, STATUS) VALUES ('Caterpillar', '12.123.123/0001-11', '123.456.789.123', 'Rodovia', 'Luis de Queiroz', 0, NULL, 'Unileste', 'Piracicaba', 'SP', '(19)2106-2100', NULL, 'contato@caterpillar.com.br', 'Contato', CURRENT_TIMESTAMP, NULL, 'S')
INSERT INTO FORNECEDOR (RAZAO_SOCIAL, CNPJ, IE, LOGRADOURO, NOME_LOGRADOURO, NUM, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, TELEFONE, CELULAR, EMAIL, CONTATO, DATA_INC, DATA_ALT, STATUS) VALUES ('3M', '13.323.133/3301-11', '123.999.888.123', 'Rua', 'Dr Osvaldo de Oliveira', 115, NULL, 'Capão Redondo', 'São Paulo', 'SP', '(11)1898-8980', NULL, 'contato@3m.com.br', 'Contato', CURRENT_TIMESTAMP, NULL, 'S')
INSERT INTO FORNECEDOR (RAZAO_SOCIAL, CNPJ, IE, LOGRADOURO, NOME_LOGRADOURO, NUM, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, TELEFONE, CELULAR, EMAIL, CONTATO, DATA_INC, DATA_ALT, STATUS) VALUES ('JFN Materiais', '12.666.999/0001-11', '666.666.666.123', 'Rua', 'José Ferreira Neto', 0, NULL, 'Itaquera', 'São Paulo', 'SP', '(19)2106-2100', NULL, 'contato@jfnmateriais.com.br', 'Contato', CURRENT_TIMESTAMP, NULL, 'S')

GO

DROP TABLE PRODUTO;

GO

CREATE TABLE PRODUTO (
ID INT PRIMARY KEY IDENTITY,
DESCRICAO VARCHAR(50) NOT NULL,
CD_INTERNO VARCHAR(10) NOT NULL,
VALOR_DIARIA FLOAT NOT NULL,
STATUS CHAR(1) NOT NULL,
DISPONIVEL CHAR(1),
DEVOLVER CHAR(1),
CARACTERISTICAS VARCHAR(MAX),
CD_MARCA INT NOT NULL,
CD_CATEGORIA INT NOT NULL,
CD_FORNECEDOR INT NOT NULL,
DATA_INC DATETIME,
DATA_ALT DATETIME,
CD_CLIENTE INT, --Se for 0, está disponível
CONSTRAINT FK_MARCA FOREIGN KEY(CD_MARCA) REFERENCES MARCA(ID),
CONSTRAINT FK_CATEGORIA FOREIGN KEY(CD_CATEGORIA) REFERENCES CATEGORIA(ID),
CONSTRAINT FK_FORNECEDOR FOREIGN KEY(CD_FORNECEDOR) REFERENCES FORNECEDOR(ID)
)

GO

--SELECT * FROM PRODUTO

INSERT INTO PRODUTO (DESCRICAO, CD_INTERNO, VALOR_DIARIA, STATUS, DISPONIVEL, CARACTERISTICAS, CD_MARCA, CD_CATEGORIA, CD_FORNECEDOR, DATA_INC, DATA_ALT, CD_CLIENTE) VALUES ('Trator', 'TR01', 500.00, 'S', 'S', 'Trator Urbano com capacidade de movimentar até 500kg', 2, 2, 1, CURRENT_TIMESTAMP, NULL, NULL)
INSERT INTO PRODUTO (DESCRICAO, CD_INTERNO, VALOR_DIARIA, STATUS, DISPONIVEL, CARACTERISTICAS, CD_MARCA, CD_CATEGORIA, CD_FORNECEDOR, DATA_INC, DATA_ALT, CD_CLIENTE) VALUES ('Espátula', 'E01', 5.00, 'S', 'N', 'Largura da lâmina: 102mm (4")', 1, 1, 2, CURRENT_TIMESTAMP, NULL, 3)
INSERT INTO PRODUTO (DESCRICAO, CD_INTERNO, VALOR_DIARIA, STATUS, DISPONIVEL, CARACTERISTICAS, CD_MARCA, CD_CATEGORIA, CD_FORNECEDOR, DATA_INC, DATA_ALT, CD_CLIENTE) VALUES ('Parafusadeira de impacto', 'GSB18VLI', 919.90, 'S', 'N', 'Bateria 18v - 1/2 pol', 2, 2, 3, CURRENT_TIMESTAMP, NULL, 3)
INSERT INTO PRODUTO (DESCRICAO, CD_INTERNO, VALOR_DIARIA, STATUS, DISPONIVEL, CARACTERISTICAS, CD_MARCA, CD_CATEGORIA, CD_FORNECEDOR, DATA_INC, DATA_ALT, CD_CLIENTE) VALUES ('Guindaste', 'GD01', 700.00, 'S', 'S', 'Guindaste de 50m capacidade para erguer até 5T', 2, 2, 1, CURRENT_TIMESTAMP, NULL, NULL)
INSERT INTO PRODUTO (DESCRICAO, CD_INTERNO, VALOR_DIARIA, STATUS, DISPONIVEL, CARACTERISTICAS, CD_MARCA, CD_CATEGORIA, CD_FORNECEDOR, DATA_INC, DATA_ALT, CD_CLIENTE) VALUES ('Jogo de Bits e Soquetes com Chave Catraca', '68736', 35.00, 'S', 'N', '47 peças, inúmeras utilidades. Encaixe: 3/4"', 1, 1, 3, CURRENT_TIMESTAMP, NULL, 2)

GO

DROP TABLE CLIENTE;

GO

CREATE TABLE CLIENTE (
ID INT PRIMARY KEY IDENTITY,
TIPO_PESSOA CHAR(1) NOT NULL,
NOME VARCHAR(50) NOT NULL,
CPF VARCHAR(14), --000.000.000-00
RG VARCHAR(12), --00.000.000-0
CNPJ VARCHAR(18), --00.000.000/0000-00
IE VARCHAR(15), --000.000.000.000
LOGRADOURO VARCHAR(20) NOT NULL,
NOME_LOGRADOURO VARCHAR(50) NOT NULL,
NUM INT NOT NULL,
COMPLEMENTO VARCHAR(20),
BAIRRO VARCHAR(30) NOT NULL,
CIDADE VARCHAR(40) NOT NULL,
ESTADO CHAR(2) NOT NULL,
TELEFONE VARCHAR(13), --(00)0000-0000
CELULAR VARCHAR(14), --(00)00000-0000
EMAIL VARCHAR(50),
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1) NOT NULL
)

GO

INSERT INTO CLIENTE (TIPO_PESSOA,NOME,CPF,RG,CNPJ,IE,LOGRADOURO,NOME_LOGRADOURO,NUM,COMPLEMENTO,BAIRRO,CIDADE,ESTADO,TELEFONE,CELULAR,EMAIL,DATA_INC,DATA_ALT,STATUS) VALUES ('F','Neymar Jr','242.342.342-34','234234234234',NULL,NULL,'Rua','Vereador Toninho Furlan',176,NULL,'Parque Residêncial Rochelle 2','Santa Bárbara d Oeste','SP','(23)4234-2342','(23)42342-3423','neymar.jr@gmail.com',CURRENT_TIMESTAMP,NULL,'S')
INSERT INTO CLIENTE (TIPO_PESSOA,NOME,CPF,RG,CNPJ,IE,LOGRADOURO,NOME_LOGRADOURO,NUM,COMPLEMENTO,BAIRRO,CIDADE,ESTADO,TELEFONE,CELULAR,EMAIL,DATA_INC,DATA_ALT,STATUS) VALUES ('J','Cristiano Ronaldo',NULL,NULL,'32.132.132/1321-32','313.213.213.213','Rua','Operario Osvaldo dos Santos',58,NULL,'Chácara Machadinho 2','Americana','SP','(32)1313-2132',NULL,'cr7@gmail.com',CURRENT_TIMESTAMP,NULL,'S')
INSERT INTO CLIENTE (TIPO_PESSOA,NOME,CPF,RG,CNPJ,IE,LOGRADOURO,NOME_LOGRADOURO,NUM,COMPLEMENTO,BAIRRO,CIDADE,ESTADO,TELEFONE,CELULAR,EMAIL,DATA_INC,DATA_ALT,STATUS) VALUES ('F','Zlatan Ibrahimović','123.132.132-13','456123145646',NULL,NULL,'Rua','Damásio Pimentel de Camargo',93,NULL,'Santa Rita de Cássia','Santa Bárbara d Oeste','SP',NULL,'(21)31321-3213','zlatanibh@gmail.com',CURRENT_TIMESTAMP,NULL,'S')

GO

DROP TABLE ALUGUEL;

GO

CREATE TABLE ALUGUEL (
ID INT PRIMARY KEY IDENTITY,
SUBTOTAL FLOAT,
TOTAL_MULTA FLOAT,
DESCONTO FLOAT,
TOTAL FLOAT,
CD_CLIENTE INT,
CD_USUARIO INT,
DATA_INC DATETIME,
DATA_ALT DATETIME,
STATUS CHAR(1),
CONSTRAINT FK_CLIENTE FOREIGN KEY(CD_CLIENTE) REFERENCES CLIENTE(ID),
CONSTRAINT FK_USUARIO FOREIGN KEY(CD_USUARIO) REFERENCES USUARIO(ID)
)

GO
--SELECT * FROM ALUGUEL

INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 1, 1, 'S', '10.03.2018');
INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 3, 2, 'S', '20.03.2018');
INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 3, 5, 'S', '29.05.2018');
INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 2, 4, 'S', '29.05.2018');
INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 2, 1, 'S', '01.06.2018');
INSERT INTO ALUGUEL (SUBTOTAL, TOTAL, TOTAL_MULTA, DESCONTO, CD_CLIENTE, CD_USUARIO, STATUS, DATA_INC) VALUES (0, 0, 0, 0, 3, 3, 'S', '04.06.2018');

GO

DROP TABLE ITENSALUGUEL;

GO

CREATE TABLE ITENSALUGUEL (
ID INT PRIMARY KEY IDENTITY,
CD_PRODUTO INT,
DT_LOCACAO DATE,
DT_DEVOLUCAO DATE,
QTDE_DIAS INT,
QTDE_DIAS_ATRASO INT,
VALOR_DIARIA FLOAT,
VALOR_MULTA FLOAT,
VALOR_TOTAL FLOAT, --VALOR_DIARIA * QTDE_DIAS, sem somar com VALOR_MULTA
CD_ALUGUEL INT,
DEVOLVIDO CHAR(1),
CONSTRAINT FK_ALUGUEL FOREIGN KEY(CD_ALUGUEL) REFERENCES ALUGUEL(ID),
CONSTRAINT FK_PRODUTO FOREIGN KEY(CD_PRODUTO) REFERENCES PRODUTO(ID)
)

GO

--SELECT * FROM ITENSALUGUEL

INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (5, '10.03.2018', '11.03.2018', 1, 1, 35.00, 3.50, 38.50, 'S', 1);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (2, '20.03.2018', '28.03.2018', 8, 0, 5.00, 0.00, 40.00, 'S', 2);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (4, '20.03.2018', '28.03.2018', 8, 0, 700.00, 0.00, 5600.00, 'S', 2);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (1, '20.03.2018', '22.03.2018', 2, 1, 500.00, 50.00, 1050.00, 'S', 2);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (2, '29.05.2018', '30.05.2018', 1, NULL, 5.00, NULL, 5.00, 'N', 3);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (3, '29.05.2018', '03.06.2018', 5, 0, 919.90, 0.00, 4599.50, 'S', 4);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (5, '01.06.2018', '03.06.2018', 2, NULL, 35.00, NULL, 70.00, 'N', 5);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (4, '01.06.2018', '03.06.2018', 2, 0, 700.00, 0.00, 1400.00, 'S', 5);
INSERT INTO ITENSALUGUEL (CD_PRODUTO, DT_LOCACAO, DT_DEVOLUCAO, QTDE_DIAS, QTDE_DIAS_ATRASO, VALOR_DIARIA, VALOR_MULTA, VALOR_TOTAL, DEVOLVIDO, CD_ALUGUEL) VALUES (3, '04.06.2018', '09.06.2018', 5, NULL, 919.90, NULL, 4599.50, 'N', 6);
