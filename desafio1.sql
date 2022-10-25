DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
    plan_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    plan_name VARCHAR(100) NOT NULL,
    price DECIMAL(5,2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.users(
    user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    plan_id INT NOT NULL,
    subscribe_date DATE,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artists(
    artist_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    album_name VARCHAR(100) NOT NULL,
    release_year INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.singles(
    single_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    single_name VARCHAR(100) NOT NULL,
    single_length VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    artist_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following_artists(
    following_artist_name VARCHAR(100) NOT NULL,
    artist_id INT NOT NULL,
    user_id INT NOT NULL,
    PRIMARY KEY(artist_id, user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
    single_history VARCHAR(100) NOT NULL,
    user_id INT NOT NULL,
    single_id INT NOT NULL,
    PRIMARY KEY (user_id, single_id),
    FOREIGN KEY(user_id) REFERENCES users(user_id),
    FOREIGN KEY(single_id) REFERENCES singles(single_id)
  ) engine = InnoDB;



  INSERT INTO SpotifyClone.plans (plan_name, price)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.users (user_name, age, plan_id, subscribe_date)
  VALUES
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

  INSERT INTO SpotifyClone.artists (artist_id ,artist_name)
  VALUES
    (1, 'Beyoncé'),
    (2, 'Queen'),
    (3, 'Elis Regina'),
    (4, 'Baco Exu do Blues'),
    (5, 'Blind Guardian'),
    (6, 'Nina Simone');

  INSERT INTO SpotifyClone.albuns (artist_id ,album_name, release_year)
  VALUES
	  (1, 'Renaissance', 2022),
    (2, 'Jazz', 1978),
    (2, 'Hot Space', 1982),
    (3, 'Falso Brilhante', 1998),
    (3, 'Vento de Maio', 2001),
    (4, 'QVVJFA?', 2003),
    (5, 'Somewhere Far Beyond', 2007),
    (6, 'I Put A Spell On You', 2012);

  INSERT INTO SpotifyClone.singles (single_name, single_length, album_id, artist_id)
  VALUES
    ('BREAK MY SOUL', 279, 1, 1),
    ('VIRGO’S GROOVE', 369, 1, 1),
    ('ALIEN SUPERSTAR', 116, 1, 1),
    ('Don’t Stop Me Now', 203, 2, 2),
    ('Under Pressure', 152, 3, 2),
    ('Como Nossos Pais', 105, 4, 3),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 5, 3),
    ('Samba em Paris', 267, 6, 4),
    ('The Bard’s Song', 244, 7, 5),
    ('Feeling Good', 100, 8, 6);

  INSERT INTO SpotifyClone.following_artists (user_id, artist_id, following_artist_name)
  VALUES
    (1, 1, 'Beyoncé'),
    (1, 2, 'Queen'),
    (1, 3, 'Elis Regina'),
    (2, 1, 'Beyoncé'),
    (2, 3, 'Elis Regina'),
    (3, 2, 'Queen'),
    (4, 4, 'Baco Exu do Blues'),
    (5, 5, 'Blind Guardian'),
    (5, 6, 'Nina Simone'),
    (6, 6, 'Nina Simone'),
    (6, 1, 'Beyoncé'),
    (7, 6, 'Nina Simone'),
    (9, 3, 'Elis Regina'),
    (10, 2, 'Queen');

  INSERT INTO SpotifyClone.history (user_id, single_id, single_history)
  VALUES
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