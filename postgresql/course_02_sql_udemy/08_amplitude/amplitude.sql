/*
-> 01: Mode of a whole data set
*/

SELECT
	maquina, qtd, COUNT(*) AS "mode"
FROM
	maquinas
GROUP BY
	maquina, qtd
ORDER BY
	2 DESC;

/*
	  maquina   |  qtd  | mode
	------------+-------+------
	 Maquina 02 | 43.00 |    1
	 Maquina 01 | 35.00 |    1
	 Maquina 03 | 25.00 |    1
	 Maquina 01 | 25.00 |    2
	 Maquina 03 | 20.00 |    1
	 Maquina 01 | 20.00 |    1
	 Maquina 02 | 15.50 |    1
	 Maquina 02 | 15.10 |    1
	 Maquina 03 | 15.00 |    5
	 Maquina 01 | 15.00 |    2
	 Maquina 02 | 15.00 |    5
	 Maquina 02 | 14.90 |    1
	 Maquina 02 | 14.50 |    1
	 Maquina 01 | 13.00 |    1
	 Maquina 03 | 10.00 |    3
	 Maquina 01 |  1.00 |    2
	 Maquina 01 |  0.00 |    1
	(17 rows)
*/

/*
-> 02: What's the min, max, and the
	   amplitude of each 'maquina' ?
*/

SELECT
	maquina,	
	MAX(qtd) AS "maximum",
	MIN(qtd) AS "minimum",
	MAX(qtd) - MIN(qtd) as "amplitude"
FROM
	maquinas
GROUP BY
	maquina
ORDER BY
	4 DESC;

/*
	  maquina   | maximum | minimum | amplitude 
	------------+---------+---------+-----------
	 Maquina 01 |   35.00 |    0.00 |     35.00
	 Maquina 02 |   43.00 |   14.50 |     28.50
	 Maquina 03 |   25.00 |   10.00 |     15.00
	(3 rows)
*/

/*
-> 03: Adding the average for the 02
*/

SELECT
	maquina,
	ROUND(AVG(qtd), 2) AS "average",
	MAX(qtd) AS "maximum",
	MIN(qtd) AS "minimum",
	MAX(qtd) - MIN(qtd) AS "amplitude"
FROM
	maquinas
GROUP BY
	maquina
ORDER BY
	4 DESC;

/*
	  maquina   | average | maximum | minimum | amplitude             
	------------+---------+---------+---------+-----------            
	 Maquina 02 |   17.80 |   43.00 |   14.50 |     28.50            
	 Maquina 03 |   15.00 |   25.00 |   10.00 |     15.00            
	 Maquina 01 |   15.00 |   35.00 |    0.00 |     35.00            
	(3 rows)
*/