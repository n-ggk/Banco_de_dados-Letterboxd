CREATE TABLE diario (
    id_log SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    id_filme INT NOT NULL REFERENCES filmes(id_filme) ON DELETE CASCADE,
    data_assistido DATE NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    contem_spoilers BOOLEAN DEFAULT FALSE,
    reassistido BOOLEAN DEFAULT FALSE
);
