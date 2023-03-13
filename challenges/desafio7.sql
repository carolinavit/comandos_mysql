SELECT
    (artistas.nome_artista) AS artista,
    (albuns.nome_album) AS album,
    COUNT(seguidores.id_artista) AS pessoas_seguidoras
FROM albuns
    INNER JOIN artistas
        ON artistas.id_artista = albuns.id_artista
    INNER JOIN seguidores
        ON seguidores.id_artista = artistas.id_artista
GROUP BY artista, album
ORDER BY COUNT(seguidores.id_artista) DESC, artista, album;
