\d
--            List of relations
--  Schema |     Name      | Type  | Owner
-- --------+---------------+-------+-------
--  public | departamentos | table | root
--  public | funcionarios  | table | root
--  public | localizacao   | table | root
-- (3 rows)

/*
-> 01: Show limited amount of lines
*/

SELECT *
FROM funcionarios
LIMIT 10;

/*
	 idfuncionario |    nome    |           email            |   sexo    | departamento |  admissao  | salario |           cargo            | idregiao
	---------------+------------+----------------------------+-----------+--------------+------------+---------+----------------------------+----------
	             1 | Kelley     | rkelley0@soundcloud.com    | Feminino  | Computadores | 2009-10-02 |   67470 | Structural Engineer        |        2
	             2 | Armstrong  | sarmstrong1@infoseek.co.jp | Masculino | Esporte      | 2008-03-31 |   71869 | Financial Advisor          |        2
	             3 | Carr       | fcarr2@woothemes.com       | Masculino | Automotivo   | 2009-07-12 |  101768 | Recruiting Manager         |        3
	             4 | Murray     | jmurray3@gov.uk            | Feminino  | Joalheria    | 2014-12-25 |   96897 | Desktop Support Technician |        3
	             5 | Ellis      | jellis4@sciencedirect.com  | Feminino  | Alimentícios | 2002-09-19 |   63702 | Software Engineer III      |        7
	             6 | Phillips   | bphillips5@time.com        | Masculino | Ferramentas  | 2013-08-21 |  118497 | Executive Secretary        |        1
	             7 | Williamson | rwilliamson6@ted.com       | Masculino | Computadores | 2006-05-14 |   65889 | Dental Hygienist           |        6
	             8 | Harris     | aharris7@ucoz.com          | Feminino  | Brinquedos   | 2003-08-12 |   84427 | Safety Technician I        |        4
	             9 | James      | rjames8@prnewswire.com     | Masculino | Joalheria    | 2005-09-07 |  108657 | Sales Associate            |        2
	            10 | Sanchez    | rsanchez9@cloudflare.com   | Masculino | Filmes       | 2013-03-13 |  108093 | Sales Representative       |        1
	(10 rows)
*/

/*
-> 02: what is the total salary amount
	   which the company pays ?

	   R: We solve that with
	   aggregate sum(<column>)
*/

SELECT
SUM(salario) as "Sum of all salaries"
FROM funcionarios;

/*
	 Sum of all salaries
	---------------------
	            97331223
	(1 row)
*/

/*
-> 03: sum of salary per deparatamento
*/

SELECT
departamento,
SUM(salario)
FROM funcionarios
GROUP BY departamento;

/*
	 departamento |   sum
	--------------+---------
	 Roupas       | 5037890
	 Games        | 5090304
	 Música       | 3274767
	 Joalheria    | 4039362
	 Jardim       | 4792085
	 Esporte      | 3756041
	 Calçados     | 3968118
	 Books        | 4459837
	 Computadores | 5152963
	 Ferramentas  | 4095808
	 Outdoors     | 5378660
	 Industrial   | 4366340
	 Bebês        | 4218724
	 Filmes       | 3632825
	 Lar          | 4822205
	 Crianças     | 3543027
	 Beleza       | 5481063
	 Automotivo   | 4584268
	 Eletronicos  | 4489141
	 Alimentícios | 4651241
	 Brinquedos   | 3943674
	 Saúde        | 4552880
	(22 rows)
*/

/*
-> 04: Total and Media paid per department
*/

SELECT
	departamento,
	SUM(salario),
	AVG(salario)
FROM funcionarios
GROUP BY departamento;

/*
	 departamento |   sum   |         avg
	--------------+---------+---------------------
	 Roupas       | 5037890 |  95054.528301886792
	 Games        | 5090304 | 103883.755102040816
	 Música       | 3274767 |  88507.216216216216
	 Joalheria    | 4039362 |  87812.217391304348
	 Jardim       | 4792085 | 101959.255319148936
	 Esporte      | 3756041 |  93901.025000000000
	 Calçados     | 3968118 |  92281.813953488372
	 Books        | 4459837 |  94890.148936170213
	 Computadores | 5152963 |  99095.442307692308
	 Ferramentas  | 4095808 | 105020.717948717949
	 Outdoors     | 5378660 | 112055.416666666667
	 Industrial   | 4366340 |  92900.851063829787
	 Bebês        | 4218724 |  93749.422222222222
	 Filmes       | 3632825 | 100911.805555555556
	 Lar          | 4822205 |  92734.711538461538
	 Crianças     | 3543027 |  93237.552631578947
	 Beleza       | 5481063 | 103416.283018867925
	 Automotivo   | 4584268 |  99658.000000000000
	 Eletronicos  | 4489141 |  91615.122448979592
	 Alimentícios | 4651241 | 101113.934782608696
	 Brinquedos   | 3943674 |  96187.170731707317
	 Saúde        | 4552880 |  98975.652173913043
	(22 rows)
*/

/*
-> 05: Order by <some_int>
	   means order by
	   the <some_int> column.

	   if 3, order by AVG(salario)
*/

-- default: ASC (ascending)
SELECT
	departamento,
	SUM(salario),
	AVG(salario)
FROM funcionarios
GROUP BY departamento
ORDER BY 3;

/*
	 departamento |   sum   |         avg
	--------------+---------+---------------------
	 Joalheria    | 4039362 |  87812.217391304348
	 Música       | 3274767 |  88507.216216216216
	 Eletronicos  | 4489141 |  91615.122448979592
	 Calçados     | 3968118 |  92281.813953488372
	 Lar          | 4822205 |  92734.711538461538
	 Industrial   | 4366340 |  92900.851063829787
	 Crianças     | 3543027 |  93237.552631578947
	 Bebês        | 4218724 |  93749.422222222222
	 Esporte      | 3756041 |  93901.025000000000
	 Books        | 4459837 |  94890.148936170213
	 Roupas       | 5037890 |  95054.528301886792
	 Brinquedos   | 3943674 |  96187.170731707317
	 Saúde        | 4552880 |  98975.652173913043
	 Computadores | 5152963 |  99095.442307692308
	 Automotivo   | 4584268 |  99658.000000000000
	 Filmes       | 3632825 | 100911.805555555556
	 Alimentícios | 4651241 | 101113.934782608696
	 Jardim       | 4792085 | 101959.255319148936
	 Beleza       | 5481063 | 103416.283018867925
	 Games        | 5090304 | 103883.755102040816
	 Ferramentas  | 4095808 | 105020.717948717949
	 Outdoors     | 5378660 | 112055.416666666667
	(22 rows)
*/

SELECT
	departamento,
	SUM(salario),
	AVG(salario)
FROM
	funcionarios
GROUP BY departamento
ORDER BY 3 ASC;

/*
	 departamento |   sum   |         avg
	--------------+---------+---------------------
	 Joalheria    | 4039362 |  87812.217391304348
	 Música       | 3274767 |  88507.216216216216
	 Eletronicos  | 4489141 |  91615.122448979592
	 Calçados     | 3968118 |  92281.813953488372
	 Lar          | 4822205 |  92734.711538461538
	 Industrial   | 4366340 |  92900.851063829787
	 Crianças     | 3543027 |  93237.552631578947
	 Bebês        | 4218724 |  93749.422222222222
	 Esporte      | 3756041 |  93901.025000000000
	 Books        | 4459837 |  94890.148936170213
	 Roupas       | 5037890 |  95054.528301886792
	 Brinquedos   | 3943674 |  96187.170731707317
	 Saúde        | 4552880 |  98975.652173913043
	 Computadores | 5152963 |  99095.442307692308
	 Automotivo   | 4584268 |  99658.000000000000
	 Filmes       | 3632825 | 100911.805555555556
	 Alimentícios | 4651241 | 101113.934782608696
	 Jardim       | 4792085 | 101959.255319148936
	 Beleza       | 5481063 | 103416.283018867925
	 Games        | 5090304 | 103883.755102040816
	 Ferramentas  | 4095808 | 105020.717948717949
	 Outdoors     | 5378660 | 112055.416666666667
	(22 rows)
*/

-- descending: DESC
SELECT
	departamento,
	SUM(salario),
	AVG(salario)
FROM
	funcionarios
GROUP BY departamento
ORDER BY 3 DESC;

/*
	 departamento |   sum   |         avg
	--------------+---------+---------------------
	 Outdoors     | 5378660 | 112055.416666666667
	 Ferramentas  | 4095808 | 105020.717948717949
	 Games        | 5090304 | 103883.755102040816
	 Beleza       | 5481063 | 103416.283018867925
	 Jardim       | 4792085 | 101959.255319148936
	 Alimentícios | 4651241 | 101113.934782608696
	 Filmes       | 3632825 | 100911.805555555556
	 Automotivo   | 4584268 |  99658.000000000000
	 Computadores | 5152963 |  99095.442307692308
	 Saúde        | 4552880 |  98975.652173913043
	 Brinquedos   | 3943674 |  96187.170731707317
	 Roupas       | 5037890 |  95054.528301886792
	 Books        | 4459837 |  94890.148936170213
	 Esporte      | 3756041 |  93901.025000000000
	 Bebês        | 4218724 |  93749.422222222222
	 Crianças     | 3543027 |  93237.552631578947
	 Industrial   | 4366340 |  92900.851063829787
	 Lar          | 4822205 |  92734.711538461538
	 Calçados     | 3968118 |  92281.813953488372
	 Eletronicos  | 4489141 |  91615.122448979592
	 Música       | 3274767 |  88507.216216216216
	 Joalheria    | 4039362 |  87812.217391304348
	(22 rows)
*/