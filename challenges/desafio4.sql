SELECT 
	usuarios.nome_usuario as pessoa_usuaria,
    IF( (SELECT COUNT(*) FROM historico
        WHERE YEAR(historico.data_reproducao) >= 2021 
        AND usuarios.id_usuario = historico.id_usuario) > 0, 
        'Ativa', 'Inativa') AS status_pessoa_usuaria
FROM usuarios
ORDER BY usuarios.nome_usuario;
