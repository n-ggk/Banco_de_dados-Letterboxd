INSERT INTO usuarios (nome, email, senha, data_cadastro)
VALUES
('Asaph', 'asaph@email.com', 'senha', CURRENT_TIMESTAMP),
('Nicolas', 'nicolas@email.com', '2444666666', CURRENT_TIMESTAMP),
('Jamilly', 'jamilly@email.com', 'souabarbiegirl', CURRENT_TIMESTAMP);

INSERT INTO generos (nome)
VALUES 
('Filme de terror'),
('Filme de ação'),
('Filme de ficção científica'),
('Filme de romance');

INSERT INTO pessoas (nome, data_nascimento, foto_perfil)
VALUES
('Leonardo DiCaprio', '1974-11-11', NULL),
('Matthew Macfadyen', '1974-10-17', NULL);

INSERT INTO filmes (titulo, ano_lancamento, duracao, sinopse)
VALUES
('Titanic', 1997, 195, 'Filme de romance'),
('O Grande Gatsby', 2013, 143, 'Filme de romance'),
('Foi Apenas um Sonho', 2008, 119, 'Filme de romance'),
('Romeu + Julieta', 1996, 120, 'Filme de romance'),
('Orgulho e Preconceito', 2005, 129, 'Filme de romance'),
('A Praia', 2000, 119, 'Filme de romance'),
('Interestelar', 2014, 169, 'Filme de ficção científica'),
('Backrooms', 2026, 111, 'Filme de terror'),
('Batman Begins', 2005, 140, 'Filme de ação');

INSERT INTO filme_genero (id_filme, id_genero)
SELECT f.id_filme, g.id_genero
FROM filmes f, generos g
WHERE g.nome = 'Filme de romance'
AND f.titulo IN (
    'Titanic',
    'O Grande Gatsby',
    'Foi Apenas um Sonho',
    'Romeu + Julieta',
    'Orgulho e Preconceito',
    'A Praia'
);

INSERT INTO filme_ator (id_filme, id_pessoa, nome_personagem)
SELECT f.id_filme, p.id_pessoa, 'Personagem principal'
FROM filmes f, pessoas p
WHERE p.nome = 'Leonardo DiCaprio'
AND f.titulo IN (
    'Titanic',
    'O Grande Gatsby',
    'Foi Apenas um Sonho',
    'Romeu + Julieta',
    'A Praia'
);

INSERT INTO filme_ator (id_filme, id_pessoa, nome_personagem)
SELECT f.id_filme, p.id_pessoa, 'Mr. Darcy'
FROM filmes f, pessoas p
WHERE p.nome = 'Matthew Macfadyen'
AND f.titulo = 'Orgulho e Preconceito';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 5.0, 'Excelente filme', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'Titanic';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 4.8, 'Muito bom', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'O Grande Gatsby';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 4.7, 'Ótimo drama romântico', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'Foi Apenas um Sonho';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 4.6, 'Clássico moderno', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'Romeu + Julieta';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 4.5, 'Romance muito bem produzido', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'Orgulho e Preconceito';

INSERT INTO reviews (id_usuario, id_filme, nota, texto, data_review)
SELECT u.id_usuario, f.id_filme, 4.0, 'Bom filme', CURRENT_TIMESTAMP
FROM usuarios u, filmes f
WHERE u.nome = 'Nicolas' AND f.titulo = 'A Praia';
