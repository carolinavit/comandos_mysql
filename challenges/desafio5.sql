SELECT
    musicas.nome_musica AS cancao, 
    COUNT(historico.id_musica) AS reproducoes
FROM
    musicas
    INNER JOIN historico ON historico.id_musica = musicas.id_musica
GROUP BY historico.id_musica
ORDER BY reproducoes DESC, cancao 
LIMIT 2;
