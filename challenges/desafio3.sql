SELECT 
    usuarios.nome_usuario AS pessoa_usuaria,
    COUNT(historico.id_musica) AS musicas_ouvidas,
    ROUND(SUM(musicas.duracao) / 60, 2) AS total_minutos
FROM
    usuarios
        INNER JOIN
    historico ON usuarios.id_usuario = historico.id_usuario
        INNER JOIN
    musicas ON historico.id_musica = musicas.id_musica
GROUP BY usuarios.nome_usuario
ORDER BY usuarios.nome_usuario;
