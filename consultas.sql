-- Responda as seguintes perguntas
-- 1. Qual empresa utiliza o maior número de tecnologias na última pesquisa
(2/2022)?

SELECT empresa.nome, COUNT(*) as num_tecnologias
FROM empresa
JOIN relatorio ON empresa.id_empresa = relatorio.empresa_id
WHERE relatorio.data_compilacao = '2022-02-01'
GROUP BY empresa.nome
ORDER BY num_tecnologias DESC
LIMIT 1;

-- 2. Qual empresa utilizava o menor número de tecnologias na pesquisa
anterior (1/2022)?

SELECT empresa.nome, COUNT(relatorio.tecnologia_id) as num_tecnologias
FROM empresa
INNER JOIN relatorio ON empresa.id_empresa = relatorio.empresa_id
WHERE relatorio.data_compilacao = '2022/01'
GROUP BY empresa.nome
ORDER BY num_tecnologias ASC
LIMIT 1;

-- 3. Quantas empresas utilizam tecnologias da área de “Dados”
atualmente?

SELECT COUNT(DISTINCT empresa_id) as num_empresas
FROM relatorio
WHERE tecnologia_id IN (
  SELECT id_tec
  FROM tecnologia
  WHERE descricao LIKE '%Dados%'
);

-- 4. Quantas empresas utilizam tecnologias que não são da área de
“Dados” atualmente?

SELECT COUNT(DISTINCT empresa_id) as num_empresas
FROM relatorio
WHERE tecnologia_id NOT IN (
  SELECT id_tec
  FROM tecnologia
  WHERE descricao LIKE '%Dados%'
);
