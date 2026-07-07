CREATE TABLE watchlist (
    id_usuario INT NOT NULL,
    id_filme INT NOT NULL,
    data_adicionado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_usuario, id_filme),

    CONSTRAINT fk_watchlist_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT fk_watchlist_filme
        FOREIGN KEY (id_filme)
        REFERENCES filmes(id_filme)
        ON DELETE CASCADE
);
