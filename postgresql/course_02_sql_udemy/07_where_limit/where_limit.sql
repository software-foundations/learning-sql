/*
-> 01: Mean of machines
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
-> 02: Round
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
-> 03: What is the mode
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
-> 04: What is the mode of each
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