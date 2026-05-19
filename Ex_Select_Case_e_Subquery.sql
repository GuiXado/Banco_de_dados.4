-- Consulta dos usuários, mostrando a senha apenas se ela for a padrão ('123mudar'),
-- caso contrário, exibe 8 asteriscos
SELECT id, name, email, username,
		CASE
			WHEN password = '123mudar'
			THEN password 
			ELSE '********'
		END AS password
FROM users

-- Consulta do projeto 10001, retornando nome, descrição, data e data final
-- considerando duração de 15 dias, realizado pelo usuário de email
-- aparecido@empresa.com
SELECT name, description, data,
	   DATEADD(DAY, 15, data) AS data_final
FROM projects
WHERE id = 10001
AND id IN
	(
		SELECT projects_id
		FROM users_has_projects
		WHERE users_id IN
			(
				SELECT id
				FROM users
				WHERE email = 'aparecido@empresa.com'
			)
	)

-- Consulta do nome e email dos usuários envolvidos
-- no projeto de nome 'Auditoria'
SELECT name, email
FROM users
WHERE id IN 
	(
			
	)

-- Consulta do nome, descrição, data, data final e custo total
-- dos projetos que possuem o termo 'Manutenção' no nome,
-- considerando custo diário de 79.85 e finalização em 16/09/2014
SELECT 
	name,
	description,
	data,
	'2014-09-16' AS data_final,
	DATEDIFF(DAY, data, '2014-09-16') * 79.85 AS custo_total
FROM projects
WHERE name LIKE '%Manutenção%'