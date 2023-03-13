SELECT 
(SELECT COUNT(id_musica) FROM musicas) AS cancoes,
(SELECT COUNT(id_artista) FROM artistas) AS artistas,
(SELECT COUNT(id_album) FROM albuns) AS albuns;
