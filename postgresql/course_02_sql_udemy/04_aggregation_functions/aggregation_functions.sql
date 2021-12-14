\d
--            List of relations
--  Schema |     Name      | Type  | Owner
-- --------+---------------+-------+-------
--  public | departamentos | table | root
--  public | funcionarios  | table | root
--  public | localizacao   | table | root
-- (3 rows)

/*
-> 01: simple query
*/

SELECT * FROM funcionarios;

SELECT * FROM departamentos;

/*
-> 02: count the number of occurrences
'count' counts the number of lines incrementally
and gives the result
*/


SELECT COUNT(*)
FROM funcionarios;

/*
	 count
	-------
	  1000
	(1 row)
*/

SELECT COUNT(*)
FROM departamentos;

/*
	 count
	-------
	    21
	(1 row)
*/

SELECT COUNT(*)
FROM localizacao;

/*
	 count
	-------
	     7
	(1 row)
/*

/*
-> 03: groupby sexo
*/

SELECT COUNT(*)
FROM funcionarios
GROUP BY sexo;

/*
	 count
	-------
	   504
	   496
	(2 rows)
*/

/*
-> 03.1: groupby sexo and put the column name
*/

SELECT sexo, COUNT(*)
FROM funcionarios
GROUP BY sexo;

/*
	   sexo    | count
	-----------+-------
	 Masculino |   504
	 Feminino  |   496
	(2 rows)
*/

/*
-> 03.1: groupby sexo and put the column name
		 and put and alias
*/

SELECT sexo, COUNT(*) AS "Amount"
FROM funcionarios
GROUP BY sexo;

/*
	   sexo    | Amount
	-----------+--------
	 Masculino |    504
	 Feminino  |    496
	(2 rows)
*/

/*
-> 04: number of 'funcionarios' in each 'departamentos'
- departamento: is a column in funcionarios tables
*/

\d funcionarios

/*
	                       Table "public.funcionarios"
	    Column     |          Type          | Collation | Nullable | Default
	---------------+------------------------+-----------+----------+---------
	 idfuncionario | integer                |           | not null |
	 nome          | character varying(100) |           |          |
	 email         | character varying(200) |           |          |
	 sexo          | character varying(10)  |           |          |
	 departamento  | character varying(100) |           |          |
	 admissao      | date                   |           |          |
	 salario       | integer                |           |          |
	 cargo         | character varying(100) |           |          |
	 idregiao      | integer                |           |          |
	Indexes:
	    "funcionarios_pkey" PRIMARY KEY, btree (idfuncionario)
*/

-- See that the Primary Key is the Name
-- Of the department itself
\d departamentos;

/*
	                      Table "public.departamentos"
	    Column    |          Type          | Collation | Nullable | Default
	--------------+------------------------+-----------+----------+---------
	 departamento | character varying(100) |           | not null |
	 divisao      | character varying(100) |           |          |
	Indexes:
	    "departamentos_pkey" PRIMARY KEY, btree (departamento)
*/

SELECT departamento, COUNT(*)
FROM funcionarios
GROUP BY departamento;

/*
	 departamento | count
	--------------+-------
	 Roupas       |    53
	 Games        |    49
	 Música       |    37
	 Joalheria    |    46
	 Jardim       |    47
	 Esporte      |    40
	 Calçados     |    43
	 Books        |    47
	 Computadores |    52
	 Ferramentas  |    39
	 Outdoors     |    48
	 Industrial   |    47
	 Bebês        |    45
	 Filmes       |    36
	 Lar          |    52
	 Crianças     |    38
	 Beleza       |    53
	 Automotivo   |    46
	 Eletronicos  |    49
	 Alimentícios |    46
	 Brinquedos   |    41
	 Saúde        |    46
	(22 rows)
*/

SELECT departamento, COUNT(*) AS "numero_funcionarios"
FROM funcionarios
GROUP BY departamento;

/*
	 departamento | numero_funcionarios
	--------------+---------------------
	 Roupas       |                  53
	 Games        |                  49
	 Música       |                  37
	 Joalheria    |                  46
	 Jardim       |                  47
	 Esporte      |                  40
	 Calçados     |                  43
	 Books        |                  47
	 Computadores |                  52
	 Ferramentas  |                  39
	 Outdoors     |                  48
	 Industrial   |                  47
	 Bebês        |                  45
	 Filmes       |                  36
	 Lar          |                  52
	 Crianças     |                  38
	 Beleza       |                  53
	 Automotivo   |                  46
	 Eletronicos  |                  49
	 Alimentícios |                  46
	 Brinquedos   |                  41
	 Saúde        |                  46
	(22 rows)
*/

/*
-> 05: show the max salary
*/

SELECT salario
FROM funcionarios;

/*
	 salario
	---------
	   67470
	   71869
	  101768
	   96897
	   63702
	  118497
	   65889
	   84427
	  108657
	  108093
	  121966
	   44179
	   85227
	   59763
*/

SELECT MAX(salario)
FROM funcionarios;

/*
	  max
	--------
	 149929
	(1 row)
*/

SELECT MAX(salario) AS "highest funcionarios.salario"
FROM funcionarios;

/*
	 MAX_funcionarios.salario
	--------------------------
	                   149929
	(1 row)
*/

/*
-> 06: show the min salary
*/

SELECT MIN(salario) AS "lowest funcionarios.salario"
FROM funcionarios;

/*
	 lowest funcionarios.salario
	-----------------------------
	                       40138
	(1 row)
*/

/*
-> 07: Show max and min salary together
*/

SELECT MIN(salario), MAX(salario)
FROM funcionarios;

/*
	->   min  |  max
	-------+--------
	 40138 | 149929
	(1 row)
*/

SELECT
MIN(salario) AS "lowest salary",
MAX(salario) AS "highest salary"
FROM funcionarios;

/*
	 lowest salary | highest salary
	---------------+----------------
	         40138 |         149929
	(1 row)
*/

/*
-> 08: Show max and min salary of each department
*/

SELECT departamento,
MIN(salario) AS "lowest salary",
MAX(salario) AS "highest salary"
FROM funcionarios
GROUP BY departamento;

/*
	departamento | lowest salary | highest salary
	--------------+---------------+----------------
	 Roupas       |         42797 |         148408
	 Games        |         41516 |         149221
	 Música       |         42759 |         144608
	 Joalheria    |         41026 |         149114
	 Jardim       |         50057 |         148860
	 Esporte      |         40418 |         147166
	 Calçados     |         45463 |         147739
	 Books        |         42714 |         146745
	 Computadores |         46960 |         149336
	 Ferramentas  |         44788 |         149586
	 Outdoors     |         43366 |         148906
	 Industrial   |         40194 |         148816
	 Bebês        |         42924 |         148687
	 Filmes       |         41898 |         146970
	 Lar          |         40415 |         149598
	 Crianças     |         43097 |         149351
	 Beleza       |         40254 |         149099
	 Automotivo   |         42602 |         146167
	 Eletronicos  |         40218 |         149597
	 Alimentícios |         44919 |         149929
	 Brinquedos   |         40138 |         149835
	 Saúde        |         43431 |         145962
*/

/*
-> 09: Show max and min salary of each sex
*/

SELECT sexo,
MIN(salario) as "lowest salary",
MAX(salario) as "highest salary"
FROM funcionarios
GROUP BY sexo;

/*
	   sexo    | lowest salary | highest salary
	-----------+---------------+----------------
	 Masculino |         40194 |         149835
	 Feminino  |         40138 |         149929
	(2 rows)
*/

/*
-> 10: bonus: show max and min salary,
	   per sex of each department
*/

SELECT sexo, departamento,
MIN(salario) as "lowest salary",
MAX(salario) as "highest salary"
FROM funcionarios
GROUP BY sexo, departamento;

/*
	departamento |   sexo    | lowest salary | highest salary
	--------------+-----------+---------------+----------------
	 Industrial   | Feminino  |         54876 |         140850
	 Joalheria    | Masculino |         41026 |         149114
	 Outdoors     | Feminino  |         43366 |         148906
	 Lar          | Masculino |         44593 |         146432
	 Computadores | Masculino |         47541 |         139304
	 Games        | Masculino |         41516 |         145575
	 Alimentícios | Masculino |         44919 |         148993
	 Crianças     | Masculino |         44093 |         139163
	 Industrial   | Masculino |         40194 |         148816
	 Esporte      | Feminino  |         52792 |         146611
	 Calçados     | Masculino |         45463 |         140243
	 Saúde        | Feminino  |         43431 |         145962
	 Outdoors     | Masculino |         46072 |         144932
	 Roupas       | Masculino |         43067 |         130188
	 Eletronicos  | Feminino  |         41697 |         149597
	 Bebês        | Feminino  |         50448 |         141464
	 Música       | Masculino |         43940 |         138540
	 Automotivo   | Masculino |         44377 |         146167
	 Calçados     | Feminino  |         52041 |         147739
	 Beleza       | Masculino |         40254 |         149099
	 Books        | Masculino |         42714 |         146745
	 Games        | Feminino  |         42347 |         149221
	 Eletronicos  | Masculino |         40218 |         144073
	 Lar          | Feminino  |         40415 |         149598
	 Filmes       | Feminino  |         51132 |         142840
	 Ferramentas  | Masculino |         47271 |         144661
	 Joalheria    | Feminino  |         46653 |         145281
	 Brinquedos   | Masculino |         41855 |         149835
	 Beleza       | Feminino  |         41299 |         143853
	 Jardim       | Masculino |         50057 |         144965
	 Filmes       | Masculino |         41898 |         146970
	 Brinquedos   | Feminino  |         40138 |         144991
	 Books        | Feminino  |         47131 |         145284
	 Jardim       | Feminino  |         51792 |         148860
	 Ferramentas  | Feminino  |         44788 |         149586
	 Computadores | Feminino  |         46960 |         149336
	 Saúde        | Masculino |         43986 |         142967
	 Alimentícios | Feminino  |         45486 |         149929
	 Música       | Feminino  |         42759 |         144608
	 Automotivo   | Feminino  |         42602 |         136448
	 Crianças     | Feminino  |         43097 |         149351
	 Bebês        | Masculino |         42924 |         148687
	 Esporte      | Masculino |         40418 |         147166
	 Roupas       | Feminino  |         42797 |         148408
*/
