CREATE TABLE usuarios (
    id_usuario SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE filmes (
    id_filme SERIAL PRIMARY KEY,
    titulo VARCHAR(150) NOT NULL,
    ano_lancamento INT NOT NULL,
    duracao INT,
    sinopse TEXT
);

CREATE TABLE generos (
    id_genero SERIAL PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE filme_genero (
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    id_genero INT NOT NULL REFERENCES generos(id_genero) ON DELETE CASCADE,
    PRIMARY KEY (id_filme, id_genero)
);

CREATE TABLE reviews (
    id_review SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    nota NUMERIC(2,1) NOT NULL CHECK (nota >= 0 AND nota <= 5),
    texto TEXT,
    data_review TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE (id_usuario, id_filme)
);

CREATE TABLE listas (
    id_lista SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    nome VARCHAR(120) NOT NULL,
    descricao TEXT
);

CREATE TABLE lista_filmes (
    id_lista INT NOT NULL REFERENCES listas(id_lista) ON DELETE CASCADE,
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    posicao INT,
    PRIMARY KEY (id_lista, id_filme)
);

CREATE TABLE seguidores (
    id_usuario_seguidor INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_usuario_seguido INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    PRIMARY KEY (id_usuario_seguidor, id_usuario_seguido),
    CHECK (id_usuario_seguidor <> id_usuario_seguido)
);
