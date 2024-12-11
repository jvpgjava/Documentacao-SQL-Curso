USE sakila; -- Use é o comando para usar um banco de dados(schema);

SELECT actor_id FROM actor; -- Select para exibir informações de determinada coluna, nesse caso eu queria selecionar as ids dos atores, com uso do from para saber de qual tabela em especifico;

SELECT actor_id,first_name FROM actor; -- Utilizado para exibir o id e nome dos autores;

SELECT * FROM actor; -- Utilizado para exibir tudo da tabela dos atores;

-- Visão Geral: SELECT para exibir, no * eu digo qual coluna quero que apareça, e no From digo a partir de qual tabela, no caso eu queria a partir da tabela actor;
-- SELECT coluna FROM tabela;
   
SELECT actor_id,first_name 
FROM actor; -- posso separar em linhas também

SELECT actor_id,first_name 
FROM actor
ORDER BY first_name;  -- ORDER BY usado para ordenar os resultados de uma consulta, pode ser em forma crescente ou decrescente


SELECT actor_id,first_name 
FROM actor
WHERE actor_id = 100 -- WHERE usado para filtrar registro em específico
ORDER BY first_name;

SELECT actor_id,first_name 
FROM actor
WHERE actor_id <10; -- mostre id do ator que seja menor do que 10
-- ORDER BY first_name;

SELECT actor_id,first_name 
FROM actor
WHERE actor_id <=10; -- mostre id do ator que seja menor ou igual a 10
-- ORDER BY first_name;

-- WHERE para filtrar registro específico e ORDER BY para ordenar qualquer coluna

SELECT * FROM payment;

SELECT 
  customer_id, 
  amount
FROM payment; -- selecionando registros específicos 

SELECT 
  customer_id, 
  amount,
  amount - (amount * 0.10) -- simulando um desconto de 10% 
FROM payment
WHERE customer_id = 1;  -- selecionando somente registros do customer id 1;

SELECT 
  customer_id, 
  amount,
  amount - (amount * 0.10) AS discount_10_percent -- AS usado para dizer o que quero que apareça, no caso quero que apareça o nome que coloquei e não amount
FROM payment
WHERE customer_id = 1;  

SELECT * FROM payment
WHERE amount = 0.99; -- exibir somente valores de centavos

SELECT * FROM payment
ORDER BY amount DESC; -- para exibir os maiores valores pagos primeiro, em ordem decrescenete
 -- WHERE amount = 0.99;
 
SELECT * FROM payment
WHERE amount = 11.99;

SELECT * FROM payment
WHERE amount != 0.99; -- com operador não que, só não vai exibir os ids que tiverem valor de 0.99

SELECT * FROM  adress
WHERE district = 'California';  -- mostrar endereços da California;

SELECT * FROM adress
WHERE district != 'Texas'; -- mostrar todos endereços, menos da California;


-- AND = E,   OR = OU,  NOT = NÃO  
SELECT * 
FROM customer
WHERE store_id = 1 AND active = 0; -- puxar o store id envolvendo a atividade dos clientes que estão inativos;

SELECT * FROM customer
WHERE store_id AND active = 0;

-- uso de AND
SELECT * FROM payment
WHERE staff_id = 1 AND amount = 1.99; -- mostrar vendas do usuário 1 'E' os valores de venda de 1.99

SELECT * FROM payment
WHERE staff_id = 1 AND amount = 1.99 AND customer_id < 10; -- realizando 3 consultas

-- uso de or
SELECT * FROM payment
WHERE staff_id = 1 OR amount = 1.99; -- mostre funcionarios de  1 ou valores de 1.99

-- uso de not, também pode ser usado o != no lugar do not
SELECT * FROM payment
WHERE NOT staff_id = 1 AND NOT amount = 1.99 AND customer_id < 10; -- estou negando apenas pra não mostrar usuarios 1 e salarios de 1.99

-- uso de in, especificar valores em clausula WHERE 
SELECT * FROM adress 
WHERE district IN ('Alberta'); -- selecionado distritos específicos do lugar

SELECT * FROM adress 
WHERE district IN ('Alberta', 'Texas'); -- selecionado distritos específicos do lugar
-- dentro de adress temos distritos, e queremos selecionar os distritos presentes nos adress Alberta e California

-- uso de between, filtrar dados dentro de um intervalo de valores
-- between = entre
SELECT * FROM payment 
WHERE amount BETWEEN 1.99 AND 3.99; -- valor entre 1.99 a 3.99
-- ou seja, maior ou igual a 1.99 e menor ou igual a 3.99

-- uso de like, pra valor específico
SELECT * FROM actor
WHERE first_name LIKE 'A%'; -- quero que encontre nomes que comecem com A

SELECT * FROM actor
WHERE first_name LIKE '%c'; -- quero que encontre nomes que finalizem com C

SELECT * FROM actor
WHERE first_name NOT LIKE 'A%'; -- quero que não exiba nomes com a

-- uso de is null, para analisar qual campo não tem informação
SELECT * FROM adress
WHERE adress2 IS NULL; -- puxei apenas aqueles que não possuem dado informado, no caso sem endereço 2

-- uso de limit, para limitar a quantidade 
SELECT * FROM actor
LIMIT 10; -- selecionando 10 primeiros atores;

SELECT * FROM actor
LIMIT 5, 10; -- fazendo ele pular os 5 primeiros registros e exibir do 6 em diante;  

-- uso de REGEXP, 
SELECT * FROM actor
WHERE first_name REGEXP 'a'; -- selecionando nomes que contenham a letra A

SELECT * FROM actor
WHERE first_name REGEXP '^a'; -- selecionando atores que comecem com letra A

SELECT * FROM actor
WHERE first_name REGEXP '^a|d'; -- selecionando atores que comecem com a letra A e que contenham deallocate prepare

SELECT * FROM actor
WHERE first_name REGEXP '^a|^d'; -- selecionando atores que comecem com A e com d 

SELECT * FROM actor
WHERE first_name REGEXP '[ger]a';  -- selecionar nomes combinando, comb1: g e a, comb2: E e a, comb3: r e a;

SELECT * FROM actor
WHERE first_name REGEXP '^[ger]a'; -- mesma logica anterior, mas que inicie com as combinacoes


-- operadores matematicos
-- + (somar), - (subtrair), * (multiplicar), / (dividir)

-- SELECT nome, salario, salario*12 As salario_anual
-- FROM empregados

-- operadores de comparacao
-- = Igual a, > Maior que, >= Maior ou igual a que, < Menor que, <= Menor ou igual a que, <> Diferente de
-- SELECT codigo_empregado, nome, salario
-- FROM empregados
-- WHERE codigo_empregado=12

-- operadores logicos
-- AND Retorna TRUE se ambas as condições forem verdadeiras
-- OR Retorna TRUE se uma das condições for verdadeira
-- NOT Retorna TRUE se a condição seguinte for falsa

-- No exemplo abaixo uma linha será retornada se o empregado for do estado de SP e o seu salário maior que 2200.
-- SELECT nome, salário, cidade, estado
-- FROM empregados
-- WHERE estado=**SP** and salario > 2200

-- Neste caso uma linha será retornado se o empregado for do estado de SP ou se o seu salário for maior que 2200.
-- SELECT nome, salário, cidade, estado
-- FROM empregados
-- WHERE estado=**SP** or salario > 2200


-- uso de joins, serve para colocar informações de duas tabelas em uma tela
SELECT * FROM customer
JOIN payment ON customer.customer_id = payment.payment_id; 
-- junçao de customer com payment, customer id tem que ser igual ao payment id, para exibir as informaçoes de ambas tabelas

-- filtrando com join:
SELECT
     customer.customer_id, 
     customer.first_name, 
     customer.last_name, 
     payment.rental_id, 
     payment.amount
FROM customer
JOIN payment ON customer.customer_id = payment.payment_id; 
-- Acima:
-- Seleciona o ID do cliente
-- Seleciona o primeiro nome do cliente
-- Seleciona o sobrenome do cliente
-- Seleciona o ID do aluguel do pagamento
-- Seleciona o valor do pagamento
-- Junta as tabelas customer e payment usando o customer_id

-- uso de Alias, para abreviação
SELECT
     cus.customer_id, 
     cus.first_name, 
     cus.last_name, 
     pay.rental_id, 
     pay.amount
FROM customer cus
JOIN payment pay ON cus.customer_id = pay.payment_id; -- colocar a abreviacao na frente para referir

-- múltiplas tabelas
SELECT
     cus.customer_id, 
     cus.first_name, 
     cus.last_name, 
     adr.adress,
     pay.rental_id, 
     pay.amount
FROM customer cus
JOIN payment pay ON cus.customer_id = pay.payment_id
JOIN adress adr ON cus.customer_id = adr.adress_id;

-- uso de UNION, combinar os resultados de duas ou mais consultas SELECT, removendo automaticamente linhas duplicadas
-- Combinando resultados de duas tabelas diferentes
SELECT first_name FROM customer
UNION
SELECT first_name FROM staff;

-- Similar ao UNION, mas mantém linhas duplicadas
SELECT first_name FROM customer
UNION ALL
SELECT first_name FROM staff;

-- uso de distinct 
-- Remove linhas duplicadas dentro de uma ÚNICA consulta
-- Mantém apenas valores únicos em uma coluna ou combinação de colunas
-- Funciona dentro de uma única consulta SELECT
-- Mostra nomes únicos de clientes
SELECT DISTINCT first_name 
FROM customer;

-- Mostra combinações únicas de first_name e last_name
SELECT DISTINCT first_name, last_name 
FROM customer;

-- Distinct vs union
-- DISTINCT: Trabalha em uma única consulta
-- UNION: Combina resultados de múltiplas consultas

-- DISTINCT em uma única tabela
SELECT DISTINCT city, country 
FROM address;

-- UNION combinando resultados de tabelas diferentes
SELECT city, 'Address' AS source 
FROM address
UNION
SELECT city, 'Store' AS source 
FROM store;



-- Manipulação de Dados

INSERT INTO language VALUES -- inserir valores de acordo com a quant. de colunas
(DEFAULT, 'Portuguese', '2006-01-22 13:09:23');

-- Adicionando múltiplas linhas:
INSERT INTO language VALUES -- inserir valores de acordo com a quant. de colunas
(DEFAULT, 'Japanese', '2006-01-22 13:09:23'),
(DEFAULT, 'Spanish', '2006-01-22 13:09:23'),
(DEFAULT, 'English', '2006-01-22 13:09:23');

-- Inserção em múltiplas tabelas
INSERT INTO language VALUES
(DEFAULT, 'Brasil', '2006-01-22 13:09:02');

INSERT INTO language VALUES
(DEFAULT, 'Angola', '2006');

INSERT INTO language VALUES
(DEFAULT, 'Japão', last_insert_id(), '2006-01-22 13:09:02'); -- last_insert_id procura pela ultima id inserida, vinculando com Angola

-- Cópia de uma tabela, backup
CREATE TABLE payment_backup AS 
SELECT * FROM payment;  -- copiei uma tabela inteira

-- Remover tabelas:
-- Truncate table remove dados das tabelas
-- DROP TABLE remove tabela em si

-- Atualizando um valor:
UPDATE payment
SET 
   amount = 15.99
WHERE payment_id = 1; -- atualizando valor do pagamento da id 1 pra 15.99

-- Deletando um valor:
DELETE FROM payment
WHERE payment_id = 16049; -- atualizando valor do pagamento com id 16049

-- Funções SQL:
-- MIN() - retorna o menor valor da coluna selecionada
-- MAX() - retorna o maior valor da coluna selecionada
-- COUNT() - retorna o número de linhas em um conjunto
-- SUM() - retorna a soma total de uma coluna numérica
-- AVG() - retorna o valor médio de uma coluna numérica

SELECT MAX(amount)
FROM payment; -- mostrar o maior valor

SELECT MIN(amount)
FROM payment; -- menor valor

SELECT 
   MAX(amount),
   MIN(amount)
FROM payment; -- ambos

SELECT AVG(amount)
FROM payment; -- 

SELECT 
   MAX(amount) AS maior,
   MIN(amount) AS menor,
   AVG(amount) AS 'média de valores',
   SUM(amount) AS 'total de vendas', -- soma total
   COUNT(amount) AS 'número de vendas'-- contar quantas vendas
FROM payment; -- maior, menor e media

SELECT 
   MAX(amount) AS maior,
   MIN(amount) AS menor,
   AVG(amount) AS 'média de valores',
   SUM(amount) AS 'total de vendas', -- soma total
   COUNT(amount) AS 'número de vendas'-- contar quantas vendas
FROM payment -- maior, menor e media
WHERE staff_id = 1;

-- Agrupando os Clientes
SELECT 
   customer_id,
   SUM(amount) AS total
   
FROM payment
GROUP BY customer_id -- agrupando através de customers
ORDER BY total DESC; -- ordenando valores totais de forma decrescente

-- Ordenando os clientes
SELECT 
   cus.customer_id,
   cus.first_name AS nome ,
   cus.last_name AS sobrenome,
   SUM(amount) AS total
FROM payment pay 
JOIN customer cus USING(customer_id) -- using para usar customer_id como referencia
GROUP BY customer_id
ORDER BY total DESC;

-- Filtrando valores com having
SELECT 
   cus.customer_id,
   cus.first_name AS nome ,
   cus.last_name AS sobrenome,
   SUM(amount) AS total,
   COUNT(amount) AS compras
FROM payment pay 
JOIN customer cus USING(customer_id) -- using para usar customer_id como referencia
GROUP BY customer_id
HAVING total >= 150
ORDER BY total DESC;

-- o HAVING é usado para filtrar os resultados após o agrupamento dos dados. Isso significa que ele age sobre os grupos gerados por um comando GROUP BY, permitindo refinar os dados agrupados com base em condições agregadas
-- O WHERE age antes do agrupamento e lida com dados individuais. Já o HAVING age após o agrupamento e lida com dados agregados

-- Uso de subquery
SELECT *
FROM payment
WHERE amount > (SELECT AVG(amount)
                FROM payment);
                
-- Uso de MAX em subquery
SELECT *
FROM payment
WHERE amount = (SELECT MAX(amount)
                FROM payment
                WHERE customer_id = 1
                );   
                
-- Uso de IN, que serve para filtrar dados dentro de algo
SELECT *
FROM customer
WHERE customer_id IN (
      SELECT customer_id
      FROM payment
      GROUP BY customer_id
      HAVING COUNT(*) > 35);         
      
-- Uso de Any, para filtrar qualquer um la dentro 
SELECT *
FROM customer
WHERE customer_id = ANY (
      SELECT customer_id
      FROM payment
      GROUP BY customer_id
      HAVING COUNT(*) > 35);      
      
-- Criar views
CREATE VIEW vendas_por_cliente AS
SELECT 
    cus.customer.id,
    cus.first_name,
    cus.last_name,
    pay.amount
FROM customer
JOIN payment
     ON customer_id = payment_id;    
     
SELECT vendas_por_cliente; -- exibir o atalho     

-- DROP VIEW é usado para excluir uma view, enquanto o comando REPLACE é usado para recriar uma view existente
CREATE OR REPLACE VIEW vendas_por_cliente AS
SELECT 
    cus.customer.id,
    cus.first_name,
    cus.last_name,
    pay.amount
FROM customer
JOIN payment
     ON customer_id = payment_id       
ORDER BY pay.amount ASC;    


-- Funções com String
/*
ASCII() Retorna o valor numérico do caractere mais à esquerda
BIN() Retorna uma string contendo representação binária de um número
BIT_LENGTH() Retorna o comprimento do argumento em bits
CHAR() Retorna o caractere para cada inteiro passado
CHAR_LENGTH() Retorna o número de caracteres no argumento
CHARACTER_LENGTH() Sinônimo de CHAR_LENGTH()
CONCAT() Retorna string concatenada
CONCAT_WS() Retorna concatenado com separador
ELT() Retorna string no número do índice
EXPORT_SET() Retorna uma string tal que para cada bit definido nos bits de valor, você obtém uma string on e para cada bit não definido, você obtém uma string off
FIELD() Índice (posição) do primeiro argumento nos argumentos subsequentes
FIND_IN_SET() Índice (posição) do primeiro argumento dentro do segundo argumento
FORMAT() Retorna um número formatado com um número especificado de casas decimais
HEX() Representação hexadecimal de valor decimal ou string
INSERT() Insere substring na posição especificada até o número especificado de caracteres
INSTR() Retorna o índice da primeira ocorrência da substring
LCASE() Sinônimo de LOWER()
LEFT() Retorna o número de caracteres mais à esquerda conforme especificado
LENGTH() Retorna o comprimento de uma string em bytes
LIKE Correspondência de padrões simples
LOAD_FILE() Carrega o arquivo nomeado
LOCATE() Retorna a posição da primeira ocorrência da substring
LOWER() Retorna o argumento em letras minúsculas
LPAD() Retorna o argumento da string, preenchido à esquerda com a string especificada
LTRIM() Remover espaços iniciais
MAKE_SET() Retorna um conjunto de strings separadas por vírgula que possuem o bit em bits correspondente definido
MATCH() Executa pesquisa de texto completo
MID() Retorna uma substring começando na posição especificada
NOT LIKE Negação de correspondência de padrões simples
NOT REGEXP Negação de REGEXP
OCT() Retorna uma string contendo representação octal de um número
OCTET_LENGTH() Sinônimo de LENGTH()
ORD() Retorna o código do caractere para o caractere mais à esquerda do argumento
POSITION() Sinônimo de LOCATE()
QUOTE() Escape do argumento para uso em uma instrução SQL
REGEXP Se a string corresponde à expressão regular
REGEXP_INSTR() Índice inicial da substring correspondente à expressão regular
REGEXP_LIKE() Se a string corresponde à expressão regular
REGEXP_REPLACE() Substitui substrings que correspondem à expressão regular
REGEXP_SUBSTR() Retorna substring correspondente à expressão regular
REPEAT() Repete uma string o número especificado de vezes
REPLACE() Substitui ocorrências de uma string especificada
REVERSE() Inverte os caracteres em uma string
RIGHT() Retorna o número especificado de caracteres mais à direita
RLIKE Se a string corresponde à expressão regular
RPAD() Acrescenta string o número especificado de vezes
RTRIM() Remover espaços finais
SOUNDEX() Retorna uma string soundex
PARECE COMO Comparar sons
SPACE() Retorna uma string com o número especificado de espaços
STRCMP() Compara duas strings
SUBSTR() Retorna a substring conforme especificado
SUBSTRING() Retorna a substring conforme especificado
SUBSTRING_INDEX() Retorna uma substring de uma string antes do número especificado de ocorrências do delimitador
TRIM() Remove espaços iniciais e finais
UCASE() Sinônimo de UPPER()
UNHEX() Retorna uma string contendo representação hexadecimal de um número
UPPER() Converte para maiúsculas
WEIGHT_STRING() Retorna a string de peso para uma string */

-- criando Database
CREATE DATABASE teste;

-- Apagar Database
DROP DATABASE teste;

-- Usar Database 
USE nomedatabasecriado;

-- Criando tabelas
CREATE TABLE marcas (
    id INT NOT NULL AUTO_INCREMENT,
    nome_marca VARCHAR(255) NOT NULL,
    origem VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE inventario (
    id INT NOT NULL AUTO_INCREMENT,
    modelo VARCHAR(255) NOT NULL,
    transmissao VARCHAR(255) NOT NULL,
    motor VARCHAR(255) NOT NULL,
    combustivel VARCHAR(255) NOT NULL,
    marcas_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (marcas_id) REFERENCES marcas(id)
);

CREATE TABLE clientes (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    sobrenome VARCHAR(255) NOT NULL, 
    endereco VARCHAR(255)  NOT NULL,
    PRIMARY KEY (id)
);

-- Inserindo valores nas tabelas
INSERT INTO clientes (nome, sobrenome, endereco) VALUES
('Andre', 'Iacono', 'Rua 1'),
('Marcos', 'Souza', 'Rua 2'),
('Andre', 'Souza', 'Rua 2'),
('Andre', 'Souza', 'Rua 2'),
('Andre', 'Souza', 'Rua 2');

INSERT INTO marcas (nome_marca, origem) VALUES
('BMW', 'Alemanha'),
('Fiat', 'Italia'),
('Mercedes-Benz', 'Alemanha'),
('Renault', 'França'),
('Jaguar', 'Inglaterra');

INSERT INTO inventario (modelo, transmissao, motor, combustivel, marcas_id) VALUES
('BMW 218', 'Automatica', '2.0', 'Gasolina', '1'),
('XE 2.0D', 'Manual', '2.0', 'Diesel', '5'),

-- Alterar propriedade de uma tabela
ALTER TABLE marcas ADD origem VARCHAR(255) NOT NULL;

-- Data Types
-- String Data Types:
/*
CHAR(tamanho) Uma string de comprimento FIXO (pode conter letras, números e caracteres especiais). O parâmetro size especifica o comprimento da coluna em caracteres - pode ser de 0 a 255. O padrão é 1
VARCHAR(tamanho) Uma string de comprimento VARIÁVEL (pode conter letras, números e caracteres especiais). O parâmetro size especifica o comprimento máximo da string em caracteres - pode ser de 0 a 65535
BINARY(tamanho) Igual a CHAR(), mas armazena strings de bytes binários. O parâmetro size especifica o comprimento da coluna em bytes. O padrão é 1
VARBINARY(tamanho) Igual a VARCHAR(), mas armazena strings de bytes binários. O parâmetro size especifica o comprimento máximo da coluna em bytes.
TINYBLOB Para BLOBs (objetos binários grandes). Comprimento máximo: 255 bytes
TINYTEXT Contém uma string com comprimento máximo de 255 caracteres
TEXT(tamanho) Contém uma string com comprimento máximo de 65.535 bytes
BLOB(tamanho) Para BLOBs (objetos binários grandes). Armazena até 65.535 bytes de dados
MEDIUMTEXT Contém uma string com comprimento máximo de 16.777.215 caracteres
MEDIUMBLOB Para BLOBs (objetos binários grandes). Armazena até 16.777.215 bytes de dados
LONGTEXT Contém uma string com comprimento máximo de 4.294.967.295 caracteres
LONGBLOB Para BLOBs (objetos binários grandes). Armazena até 4.294.967.295 bytes de dados
ENUM(val1, val2, val3, ...) Um objeto string que pode ter apenas um valor, escolhido em uma lista de valores possíveis. Você pode listar até 65.535 valores em uma lista ENUM. Caso seja inserido um valor que não esteja na lista, será inserido um valor em branco. Os valores são classificados na ordem em que você os insere
SET(val1, val2, val3, ...) Um objeto string que pode ter 0 ou mais valores, escolhidos em uma lista de valores possíveis. Você pode listar até 64 valores em uma lista SET
*/

-- Numeric Data Types:
/*
BIT(tamanho) Um tipo de valor de bit. O número de bits por valor é especificado em tamanho. O parâmetro size pode conter um valor de 1 a 64. O valor padrão para tamanho é 1.
TINYINT(tamanho) Um número inteiro muito pequeno. O intervalo assinado é de -128 a 127. O intervalo não assinado é de 0 a 255. O parâmetro size especifica a largura máxima de exibição (que é 255)
BOOL Zero é considerado falso, valores diferentes de zero são considerados verdadeiros.
BOOLEAN Igual a BOOL
SMALLINT(tamanho) Um número inteiro pequeno. O intervalo assinado é de -32768 a 32767. O intervalo não assinado é de 0 a 65535. O parâmetro size especifica a largura máxima de exibição (que é 255)
MEDIUMINT(tamanho) Um número inteiro médio. O intervalo assinado é de -8388608 a 8388607. O intervalo não assinado é de 0 a 16777215. O parâmetro size especifica a largura máxima de exibição (que é 255)
INT(tamanho) Um número inteiro médio. O intervalo assinado é de -2147483648 a 2147483647. O intervalo não assinado é de 0 a 4294967295. O parâmetro size especifica a largura máxima de exibição (que é 255)
INTEGER(tamanho) Igual a INT(tamanho)
BIGINT(tamanho) Um número inteiro grande. O intervalo assinado é de -9223372036854775808 a 9223372036854775807. O intervalo não assinado é de 0 a 18446744073709551615. O parâmetro size especifica a largura máxima de exibição (que é 255)
FLOAT(tamanho, d) Um número de ponto flutuante. O número total de dígitos é especificado em tamanho. O número de dígitos após o ponto decimal é especificado no parâmetro d. Esta sintaxe está obsoleta no MySQL 8.0.17 e será removida em versões futuras do MySQL
FLOAT(p) Um número de ponto flutuante. MySQL usa o valor p para determinar se deve usar FLOAT ou DOUBLE para o tipo de dados resultante. Se p for de 0 a 24, o tipo de dados se torna FLOAT(). Se p for de 25 a 53, o tipo de dados se torna DOUBLE()
DOUBLE(size, d) Um número de ponto flutuante de tamanho normal. O número total de dígitos é especificado em tamanho. O número de dígitos após o ponto decimal é especificado no parâmetro d
PRECISÃO DUPLA (tamanho, d)	 
DECIMAL(tamanho, d) Um número exato de ponto fixo. O número total de dígitos é especificado em tamanho. O número de dígitos após o ponto decimal é especificado no parâmetro d. O número máximo para tamanho é 65. O número máximo para d é 30. O valor padrão para tamanho é 10. O valor padrão para d é 0.
DEC(tamanho, d) Igual a DECIMAL(tamanho,d)
*/

-- Date and Time Data Types
/*
DATA Uma data. Formato: AAAA-MM-DD. O intervalo suportado é de '1000-01-01' a '9999-12-31'
DATETIME(fsp) Uma combinação de data e hora. Formato: AAAA-MM-DD hh:mm:ss. O intervalo suportado é de '1000-01-01 00:00:00' a '9999-12-31 23:59:59'. Adicionando DEFAULT e ON UPDATE na definição da coluna para obter inicialização automática e atualização para a data e hora atuais
TIMESTAMP(fsp) Um carimbo de data/hora. Os valores TIMESTAMP são armazenados como o número de segundos desde a época Unix ('1970-01-01 00:00:00' UTC). Formato: AAAA-MM-DD hh:mm:ss. O intervalo suportado é de '1970-01-01 00:00:01' UTC a '2038-01-09 03:14:07' UTC. A inicialização e atualização automáticas para a data e hora atuais podem ser especificadas usando DEFAULT CURRENT_TIMESTAMP e ON UPDATE CURRENT_TIMESTAMP na definição da coluna
TIME(fsp) Uma hora. Formato: hh:mm:ss. O intervalo suportado é de '-838:59:59' a '838:59:59'
ANO Um ano no formato de quatro dígitos. Valores permitidos no formato de quatro dígitos: 1901 a 2155 e 0000.
MySQL 8.0 não suporta ano no formato de dois dígitos.
*/


-- Visualizando DB de usuários:
USE mysql;
SELECT * FROM user;
-- A partir disso, se visualiza os usuários e suas permissões referente a DB do mysql

-- Ou:
SELECT * FROM mysql.user;

-- Criação de usuários no banco:
CREATE USER joao IDENTIFIED BY '1212'; -- usuario identificado por tal senha, e acesso a tudo
CREATE user evilyn@localhost IDENTIFIED BY '1234'; -- Ou CREATE USER evilyn@127.0.0.1
CREATE user ricardo@EmpresaExemplo IDENTIFIED BY '2201'; -- só vai poder em máquinas daquele dominio ou empresa
 -- ou seja, esse usuario só pode acessar dentro do servidor local
 
SELECT * FROM mysql.user -- puxando usuarios 

-- Remover usuario do DB:
DROP USER ricardo@EmpresaExemplo;

SELECT * FROM mysql.user

-- Recuperar senha do usuario do DB:
SET PASSWORD FOR joao@localhost = '4343'; -- alterando nova senha para esse usuario
-- Pode-se utilizar a opção de users and priviligies para alteracoes;

-- Verificar permissões de usuários:
SHOW GRANTS FOR joao;

-- Aplicando permissões
GRANT SELECT, INSERT, UPDATE, DELETE 
ON sakila.* TO joao; -- coloquei as permissões que queria dentro do db sakila para o usuario joao

SHOW GRANTS FOR joao; -- verificando as permissoes que foram dadas

-- Aplicando como admin, ou seja, permissao de tudo
GRANT ALL
ON sakila.* TO evilyn@localhost;

-- Removendo permissões dos usuários do DB:
REVOKE UPDATE 
ON sakila.*
FROM evilyn@localhost

