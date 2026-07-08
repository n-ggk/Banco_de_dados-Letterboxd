CREATE TABLE estudios (
    id_estudio SERIAL PRIMARY KEY,
    nome VARCHAR(150) NOT NULL UNIQUE,
    pais_origem VARCHAR(100)
);

CREATE TABLE paises (
    id_pais SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE filme_estudio (
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    id_estudio INT NOT NULL REFERENCES estudios(id_estudio) ON DELETE CASCADE,
    PRIMARY KEY (id_filme, id_estudio)
);

CREATE TABLE filme_pais (
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    id_pais INT NOT NULL REFERENCES paises(id_pais) ON DELETE CASCADE,
    PRIMARY KEY (id_filme, id_pais)
);
