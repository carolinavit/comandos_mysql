DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artistas(
  id_artista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_artista VARCHAR(45) NOT NULL
 );

INSERT INTO artistas(nome_artista) VALUES
('Beyoncé'),
('Queen'),
('Elis Regina'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone');


CREATE TABLE albuns(
  id_album INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_album VARCHAR(45) NOT NULL,
  id_artista INT NOT NULL,
  ano_lancamento INT NOT NULL,
  FOREIGN KEY (id_artista)
	REFERENCES artistas (id_artista)
 );

INSERT INTO albuns(nome_album, id_artista, ano_lancamento) VALUES
('Renaissance', 1, 2022),
('Jazz', 2, 1978),
('Hot Space', 2, 1982),
('Falso Brilhante', 3, 1998),
('Vento de Maio', 3, 2001),
('QVVJFA?', 4, 2003),
('Somewhere Far Beyond', 5, 2007),
('I Put A Spell On You', 6, 2012);


CREATE TABLE musicas (
	id_musica INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_musica VARCHAR(45) NOT NULL,
  duracao INT NOT NULL,
  id_album INT NOT NULL,
  id_artista INT NOT NULL,
  FOREIGN KEY (id_album)
		REFERENCES albuns (id_album),
	FOREIGN KEY (id_artista)
		REFERENCES artistas (id_artista)
);

INSERT INTO musicas(nome_musica, duracao, id_album, id_artista) VALUES
('BREAK MY SOUL', 279, 1, 1),
('VIRGO`S', 369, 1, 1),
('ALIEN SUPERSTAR', 116, 1, 1),
('Dont`t Stop Me Now', 203, 2, 2),
('Under Pressure', 152, 2, 2),
('Como Nossos Pais', 105, 3, 3),
('O Medo de Amar é o Medo de Ser Livre', 207, 3, 3),
('Samba em Paris', 267, 4, 4),
('The Bard`s Song', 244, 5, 5),
('Feeling Good', 100, 6, 6);


CREATE TABLE planos (
	id_plano INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  valor DECIMAL(5, 2) NOT NULL,
  tipo_plano VARCHAR(45) NOT NULL
);

INSERT INTO planos(valor, tipo_plano)
VALUES
(0, 'Gratuito'),
(7.99, 'Familiar'),
(5.99, 'Universitario'),
(6.99, 'Pessoal');


CREATE TABLE usuarios (
	id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(45) NOT NULL,
  idade INT NOT NULL,
  id_plano INT NOT NULL,
  data_assinatura DATETIME NOT NULL,
  FOREIGN KEY (id_plano)
	 REFERENCES planos (id_plano)
);

INSERT INTO usuarios(nome_usuario, idade, id_plano, data_assinatura) VALUES
('Barbara Liskov', 82, 1, '2019-10-20'),
('Robert Cecil Martin', 58, 1, '2017-01-06'),
('Ada Lovelace', 37, 2, '2017-12-30'),
('Martin Fowler', 46, 2, '2017-01-17'),
('Sandi Metz', 58, 2, '2018-04-29'),
('Paulo Freire', 19, 3, '2018-02-14'),
('Bell Hooks', 26, 3, '2018-01-05'),
('Christopher Alexander', 85, 4, '2019-06-05'),
('Judith Butler', 45, 4, '2020-05-13'),
('Jorge Amado', 58, 4, '2017-02-17');


CREATE TABLE historico (
	id_usuario INT NOT NULL,
	id_musica INT NOT NULL,
  data_reproducao DATETIME NOT NULL,
  FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario),
  FOREIGN KEY (id_musica)
    REFERENCES musicas (id_musica),
    CONSTRAINT PRIMARY KEY (id_usuario, id_musica)
);

INSERT INTO historico(id_usuario, id_musica, data_reproducao) VALUES
(1, 8, '2022-02-28 10:45:55'),
(1, 2, '2020-05-02 05:30:35'),
(1, 10, '2020-03-06 11:22:33'),
(2, 10, '2022-08-05 08:05:17'),
(2, 7, '2020-01-02 07:40:33'),
(3, 10, '2020-11-13 16:55:13'),
(3, 2, '2020-12-05 18:38:30'),
(4, 8, '2021-08-15 17:10:10'),
(5, 8, '2022-01-09 01:44:33'),
(5, 5, '2020-08-06 15:23:43'),
(6, 7, '2017-01-24 00:31:17'),
(6, 1, '2017-10-12 12:35:20'),
(7, 4, '2011-12-15 22:30:49'),
(8, 4, '2012-03-17 14:56:41'),
(9, 9, '2022-02-24 21:14:22'),
(10, 3, '2015-12-13 08:30:22');


CREATE TABLE seguidores (
	id_usuario INT NOT NULL,
	id_artista INT NOT NULL,
	FOREIGN KEY (id_usuario)
    REFERENCES usuarios (id_usuario),
  FOREIGN KEY (id_artista)
    REFERENCES artistas (id_artista),
    CONSTRAINT PRIMARY KEY (id_usuario , id_artista)
);

INSERT INTO seguidores(id_usuario, id_artista) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(4, 4),
(5, 5),
(5, 6),
(6, 6),
(6, 1),
(7, 6),
(9, 3),
(10, 2);
