--- SELECT * FROM points

/*
--- Frequencia Absoluta por Produto
SELECT descProduto,
    COUNT(idTransacao) AS "Frequencia Absoluta"
FROM points
GROUP BY descProduto;
*/

-- Frequencia Absoluta Acumulada por Produto
WITH tb_freq_abs AS (
    SELECT descProduto,
        COUNT(idTransacao) AS "Frequencia Absoluta"
    FROM points
    GROUP BY descProduto
)
SELECT descProduto,
    "Frequencia Absoluta",
    SUM("Frequencia Absoluta") OVER (ORDER BY descProduto) AS "Frequencia Acumulada"
FROM tb_freq_abs
ORDER BY descProduto;


-- Frequencia Relativa por Produto
SELECT descProduto,
    COUNT(idTransacao) AS "Frequencia Absoluta",
    ROUND(COUNT(idTransacao) * 100.0 / (SELECT COUNT(*) FROM points), 2) AS "Frequencia Relativa (%)"
FROM points
GROUP BY descProduto
ORDER BY COUNT(idTransacao) DESC;


-- Frequencia Relativa Acumulada por Produto
WITH tb_freq AS (
    SELECT descProduto,
        COUNT(idTransacao) AS "Frequencia Absoluta",
        ROUND(COUNT(idTransacao) * 100.0 / (SELECT COUNT(*) FROM points), 2) AS "Frequencia Relativa (%)"
    FROM points
    GROUP BY descProduto
)
SELECT descProduto,
    "Frequencia Absoluta",
    "Frequencia Relativa (%)",
    ROUND(SUM("Frequencia Relativa (%)") OVER (ORDER BY "Frequencia Absoluta" DESC), 2) AS "Frequencia Relativa Acumulada (%)"
FROM tb_freq
ORDER BY "Frequencia Absoluta" DESC;