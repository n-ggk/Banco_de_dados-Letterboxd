CREATE TABLE pessoas (
    id_pessoa SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    data_nascimento DATE,
    foto_perfil TEXT
);

CREATE TABLE filme_ator (
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    id_pessoa INT NOT NULL REFERENCES pessoas(id_pessoa) ON DELETE CASCADE,
    nome_personagem VARCHAR(150),
    PRIMARY KEY (id_filme, id_pessoa, nome_personagem)
);

CREATE TABLE filme_equipe (
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    id_pessoa INT NOT NULL REFERENCES pessoas(id_pessoa) ON DELETE CASCADE,
    cargo VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_filme, id_pessoa, cargo)
);
