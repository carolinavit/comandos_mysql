SELECT
    MIN(planos.valor) AS faturamento_minimo,
    MAX(planos.valor) AS faturamento_maximo,
    FORMAT(AVG(planos.valor), 2) AS faturamento_medio,
    SUM(planos.valor) AS faturamento_total
FROM planos INNER JOIN usuarios ON usuarios.id_plano = planos.id_plano;
