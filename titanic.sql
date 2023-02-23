--a) Selecione todos os campos, filtrando passageiros com mais de 30 anos.
-- Select all fields, filtering passengers whose age is greater than 30 years old.
SELECT *
FROM titanic
WHERE Age > 30;

--b) Selecione os 25 primeiros registros, com todos os campos, filtrando passageiros da 2ª classe.
-- Select all fields from the first 25 rows, filtering passengers from second class.
SELECT TOP 25 *
FROM titanic
WHERE Pclass = 2;

--c) Selecione todos os campos, filtrando passageiros da 1ª classe e com 18 anos ou menos.
-- Select all fields, filtering passengers from first class and whose age is less or equal to 18.
SELECT *
FROM titanic 
WHERE Pclass = 1 AND Age <= 18;
--d) Selecione todos os campos, filtrando passageiros da 3ª classe ou que são do sexo masculino.
-- Select all fields filtering passengers from third class or those who are male.
SELECT *
FROM titanic 
WHERE Pclass = 3 OR Sex = 'male';

--e) Selecione os campos: Name, Sex, Pclass e Age, filtrando passageiros com menos de 45 anos
-- Select the following fields filtering those passengers who are less than 45 years old: Name, Sex, Pclass e Age
SELECT 
	Name, 
	Sex, 
	Pclass,
	Age
FROM dbo.titanic 
WHERE Age < 45;
--f) Selecione todos os campos, filtrando passageiros que têm  "Master." dentro do nome
-- Select all fields filtering passengers who have the word "Master" in their name.
SELECT *
FROM dbo.titanic 
WHERE Name LIKE '%Master.%';
--g) Selecione todos os campos, filtrando passageiros que não tem nem 18 e nem 50 anos.
-- Select all fields filtering passengers who aren't neither 18 nor 50.
SELECT *
FROM dbo.titanic 
WHERE Age NOT IN (18, 50)
/*h) Selecione os campos: Survived, Name, Sex, Pclass e Age, filtrando passageiros que entre 10 e 35 anos, 
 * ordenando por idade do mais velho para o mais novo.*/
/*Select the following fields filtering passengers who are between 10 and 35 years old: 
 * Survived, Name, Sex, Pclass e Age*/ 

SELECT 
	Survived, 
	Name, 
	Sex, 
	Pclass,
	Age
FROM titanic
WHERE Age BETWEEN 10 AND 35
ORDER BY Age DESC

/*Correct the Age of those passengers are greater than 100*/
SELECT 
	CASE WHEN age > 100 THEN CAST(age/10 AS INT) ELSE Age END AS AdjustedAge
FROM dbo.titanic 
ORDER BY age DESC




SELECT 	
	COUNT(1) AS qtde_registros,-- considers both null and non null values
	COUNT(PassengerId) As qtd_reg_passengerId, -- only considers non null values
	COUNT(Age) As qtd_reg_Age
FROM
	titanic;
	
/*Select frequency, minimum, maximum, sum, average and standard deviation from pclass*/
SELECT 	
	pclass,
	COUNT(1) AS freq_abs,
	MIN(fare) AS tarifa_min,
	MAX(fare) AS tarifa_max,
	SUM(fare) AS tarifa_soma,
	AVG(fare) AS tarifa_media,
	STDEV(fare) AS tarifa_dp
FROM
	titanic
WHERE 
	fare > 0 AND fare < 1000000
GROUP BY pclass
ORDER BY 1;

--a) Selecione os campos Name e Age, e crie uma nova variável chamada "Maior_idade", com 1 caso Age seja maior ou igual a 18 anos, e 0 senão.
-- Select Name, Age and create a new variable called (maior_idade) giving it the value one if passengers age is greater or equal to 18 and 0 otherwise.

SELECT 
	Name,
	Age,
	CASE WHEN Age >= 18 THEN 1 ELSE 0 END AS Maior_idade
FROM titanic

--b) Selecione o campo Name, e  crie uma variável chamada título, com as seguintes categorias: Doutor, Mestre, Senhor, Senhora, Senhorita e Reverendo (Rev.).
-- Select field Name and create a new one called titulo considering these categories: Doutor, Mestre, Senhor, Senhora, Senhorita e Reverendo (Rev.).
SELECT 
	Name,
	CASE WHEN Name LIKE '%Dr.%' THEN 'Doutor'
	WHEN Name LIKE '%Master.%' THEN 'Mestre'
	WHEN Name LIKE '%Mr.%' THEN 'Senhor'
	WHEN Name LIKE '%Mrs.%' THEN 'Senhora'
	WHEN Name LIKE '%Miss.%' THEN 'Senhorita'
	WHEN Name LIKE '%Rev.%' THEN 'Reverendo'
	ELSE NULL
	END AS titulo
FROM titanic;

--c) Selecione a contagem de registros total, e a contagem de registros não nulos da variável Embarked.
-- Select the total count and the non null count of the Embarked variable.
SELECT 
	COUNT(1),
	COUNT(Embarked)
FROM titanic

--d) Selecione o sexo, agrupando a frequencia absoluta, a média, mínimo, máximo e desvio padrão da variável Age.
--SELECT sex, absolute frequency, average, minimum, maximum and standard deviation of the Age variable grouping by sex.
SELECT
	sex,
	COUNT(age) AS freq_abs,
	AVG(age) AS media,
	MIN(age) AS minimo,
	MAX(age) AS maximo,
	STDEV(age) AS desvio_padrao
FROM 
	dbo.titanic 
GROUP BY
	sex
	
