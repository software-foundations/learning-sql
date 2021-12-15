/*
	-- LogMaquinas.csv --

	maquina,dia,qtd
	Maquina 01,1,15.00
	Maquina 01,2,25.00
	Maquina 01,3,25.00
	Maquina 01,4,1.00
*/

/*
-> 01: Create table
*/

CREATE TABLE MAQUINAS(
	MAQUINA VARCHAR(20),
	DIA INT,
	QTD NUMERIC(10,2)
);

/*
	output:

	CREATE TABLE
*/

\d

/*
	           List of relations
	 Schema |     Name      | Type  | Owner
	--------+---------------+-------+-------
	 public | departamentos | table | root
	 public | funcionarios  | table | root
	 public | localizacao   | table | root
	 public | maquinas      | table | root
	(4 rows)
*/

\d maquinas

/*
	                     Table "public.maquinas"
	 Column  |         Type          | Collation | Nullable | Default
	---------+-----------------------+-----------+----------+---------
	 maquina | character varying(20) |           |          |
	 dia     | integer               |           |          |
	 qtd     | numeric(10,2)         |           |          |
*/

/*
-> 02: Copy CSV
*/
COPY MAQUINAS
FROM '/home/bruno/Documents/dev/learning_postgresql/postgresql/course_02_sql_udemy/06_import_csv/LogMaquinas.csv'
DELIMITER ','
CSV HEADER;

/*
	output:

	COPY 30
*/

SELECT * FROM MAQUINAS;

/*
	  maquina   | dia |  qtd
	------------+-----+-------
	 Maquina 01 |   1 | 15.00
	 Maquina 01 |   2 | 25.00
	 Maquina 01 |   3 | 25.00
	 Maquina 01 |   4 |  1.00
	 Maquina 01 |   5 | 13.00
	 Maquina 01 |   6 | 20.00
	 Maquina 01 |   7 | 35.00
	 Maquina 01 |   8 |  0.00
	 Maquina 01 |   9 |  1.00
	 Maquina 01 |  10 | 15.00
	 Maquina 02 |   1 | 15.00
	 Maquina 02 |   2 | 15.50
	 Maquina 02 |   3 | 14.50
	 Maquina 02 |   4 | 15.00
	 Maquina 02 |   5 | 15.00
	 Maquina 02 |   6 | 43.00
	 Maquina 02 |   7 | 15.00
	 Maquina 02 |   8 | 14.90
	 Maquina 02 |   9 | 15.10
	 Maquina 02 |  10 | 15.00
	 Maquina 03 |   1 | 15.00
	 Maquina 03 |   2 | 25.00
	 Maquina 03 |   3 | 10.00
	 Maquina 03 |   4 | 10.00
	 Maquina 03 |   5 | 20.00
	 Maquina 03 |   6 | 15.00
	 Maquina 03 |   7 | 10.00
	 Maquina 03 |   8 | 15.00
	 Maquina 03 |   9 | 15.00
	 Maquina 03 |  10 | 15.00
	(30 rows)
*/

/*
-> 03: Mean of machines
*/

SELECT
	AVG(qtd) AS mean_qtd
FROM maquinas;

/*
	      mean_qtd
	---------------------
	 15.9333333333333333
	(1 row)
*/

SELECT
	maquina,
	AVG(qtd) AS "mean grouped by maquinas.maquina"
FROM
	maquinas
GROUP BY
	maquina;

/*
	  maquina   | mean grouped by maquinas.maquina
	------------+----------------------------------
	 Maquina 01 |              15.0000000000000000
	 Maquina 03 |              15.0000000000000000
	 Maquina 02 |              17.8000000000000000
	(3 rows)
*/

SELECT
	maquina,
	AVG(qtd) AS "mean grouped by maquinas.maquina ordered"
FROM
	maquinas
GROUP BY
	maquina
ORDER BY
	2 DESC;

/*
	  maquina   | mean grouped by maquinas.maquina ordered
	------------+------------------------------------------
	 Maquina 02 |                      17.8000000000000000
	 Maquina 01 |                      15.0000000000000000
	 Maquina 03 |                      15.0000000000000000
	(3 rows)
*/

/*
-> 04: Round
	   ROUND (<agg>, <n_decimals:int>)
*/

SELECT
	maquina,
	ROUND(AVG(qtd)) AS "mean grouped by maquinas.maquina ordered"
FROM
	maquinas
GROUP BY
	maquina
ORDER BY
	2 DESC;

/*
-> 05: What is the mode
	   ("moda", in portuguese)
	   of the qunatities ?
*/

SELECT
	maquina, qtd, COUNT(*) as "mode"
FROM
	maquinas
GROUP BY
	maquina, qtd
ORDER BY
	3 DESC;

/*
	  maquina   |  qtd  | mode
	------------+-------+------
	 Maquina 03 | 15.00 |    5
	 Maquina 02 | 15.00 |    5
	 Maquina 03 | 10.00 |    3
	 Maquina 01 |  1.00 |    2
	 Maquina 01 | 15.00 |    2
	 Maquina 01 | 25.00 |    2
	 Maquina 01 | 20.00 |    1
	 Maquina 01 | 13.00 |    1
	 Maquina 02 | 14.50 |    1
	 Maquina 01 | 35.00 |    1
	 Maquina 02 | 43.00 |    1
	 Maquina 02 | 15.50 |    1
	 Maquina 03 | 20.00 |    1
	 Maquina 02 | 15.10 |    1
	 Maquina 03 | 25.00 |    1
	 Maquina 01 |  0.00 |    1
	 Maquina 02 | 14.90 |    1
	(17 rows)
*/

/*
-> 06: What is the mode of each
	   quantity of each machine ?
*/

-- 'Maquina 01' (1 mode)

SELECT
	maquina, qtd, COUNT(*)
FROM
	maquinas
WHERE
	maquina = 'Maquina 01'
GROUP BY
	maquina, qtd
ORDER BY
	3 DESC
LIMIT 1; -- Show the first line only

/*
	  maquina   | qtd  | count 
	------------+------+-------             
	 Maquina 01 | 1.00 |     2
	(1 row)  
*/

-- 'Maquina 01' (all modes)

SELECT
	maquina, qtd, COUNT(*)
FROM
	maquinas
WHERE
	maquina = 'Maquina 01'
GROUP BY
	maquina, qtd
ORDER BY
	3 DESC;

/*
	  maquina   |  qtd  | count 
	------------+-------+-------
	 Maquina 01 | 15.00 |     2
	 Maquina 01 |  1.00 |     2
	 Maquina 01 | 25.00 |     2
	 Maquina 01 |  0.00 |     1
	 Maquina 01 | 20.00 |     1
	 Maquina 01 | 35.00 |     1
	 Maquina 01 | 13.00 |     1
	(7 rows)
*/

-- 'Maquina 02' (1 mode)

SELECT
	maquina, qtd, COUNT(*)
FROM
	maquinas
WHERE
	maquina = 'Maquina 02'
GROUP BY
	maquina, qtd
ORDER BY
	3 DESC
LIMIT 1; -- Show the first line only

/*
	  maquina   |  qtd  | count 
	------------+-------+-------
	 Maquina 02 | 15.00 |     5
	(1 row)
*/

-- 'Maquina 02' (all modes)

SELECT
	maquina, qtd, COUNT(*)
FROM
	maquinas
WHERE
	maquina = 'Maquina 02'
GROUP BY
	maquina, qtd
ORDER BY
	3 DESC;

/*
	  maquina   |  qtd  | count 
	------------+-------+-------
	 Maquina 02 | 15.00 |     5
	 Maquina 02 | 14.50 |     1
	 Maquina 02 | 14.90 |     1
	 Maquina 02 | 15.10 |     1
	 Maquina 02 | 15.50 |     1
	 Maquina 02 | 43.00 |     1
	(6 rows)
*/