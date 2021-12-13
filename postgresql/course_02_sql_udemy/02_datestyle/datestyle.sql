 -- Show datestyle (setted in /etc/postgresql/12/main/postgresql.conf)
SHOW datestyle;
/*
DateStyle 
-----------
ISO, DMY
*/

-- Alter datestyle

-- Show the style of the date in the datavase again
SHOW datestyle;
/*
 DateStyle 
-----------
 ISO, MDY
*/

-- Now, try execute create_database.sql again

-- Now, execute some select
SELECT * FROM funcionarios;

/*
idfuncionario |    nome    |               email                |   sexo    | departamento |  admissao  | salario |                cargo                 | idregiao 
---------------+------------+------------------------------------+-----------+--------------+------------+---------+--------------------------------------+----------
             1 | Kelley     | rkelley0@soundcloud.com            | Feminino  | Computadores | 2009-02-10 |   67470 | Structural Engineer                  |        2
             3 | Carr       | fcarr2@woothemes.com               | Masculino | Automotivo   | 2009-12-07 |  101768 | Recruiting Manager                   |        3
             8 | Harris     | aharris7@ucoz.com                  | Feminino  | Brinquedos   | 2003-12-08 |   84427 | Safety Technician I                  |        4
             9 | James      | rjames8@prnewswire.com             | Masculino | Joalheria    | 2005-07-09 |  108657 | Sales Associate                      |        2
            12 | Black      | mblackb@edublogs.org               | Masculino | Roupas       | 2003-04-02 |   44179 | Data Coordiator                      |        7
            15 | Jacobs     | ajacobse@google.it                 | Feminino  | Games        | 2007-04-03 |  141139 | Community Outreach Specialist        |        7
            17 | Morgan     | dmorgang@123-reg.co.uk             | Feminino  | Crianças     | 2011-04-05 |  148952 | Programmer IV                        |        6
            18 | Nguyen     | jnguyenh@google.com                | Masculino | Lar          | 2014-03-11 |   93804 | Geologist II                         |        5
            21 | Bryant     | sbryantk@wunderground.com          | Feminino  | Industrial   | 2005-12-08 |   78052 | Software Consultant                  |        3
            23 | Chapman    | jchapmanm@archive.org              | Feminino  | Joalheria    | 2001-12-04 |  126103 | Senior Developer                     |        4

            (...)
*/