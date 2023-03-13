SELECT
	(artistas.nome_artista) as artista,
    (albuns.nome_album) as album
FROM artistas
	INNER JOIN albuns
	ON artistas.id_artista = albuns.id_artista
HAVING
	artistas.nome_artista = 'Elis Regina';
