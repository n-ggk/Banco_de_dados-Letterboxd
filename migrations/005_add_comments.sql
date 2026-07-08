CREATE TABLE comentarios (
    id_comentario SERIAL PRIMARY KEY,
    id_usuario INT NOT NULL REFERENCES usuarios(id_usuario) ON DELETE CASCADE,
    texto TEXT NOT NULL,
    data_envio TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    id_review_alvo INT REFERENCES reviews(id_review) ON DELETE CASCADE,
    id_lista_alvo INT REFERENCES listas(id_lista) ON DELETE CASCADE,

    CHECK (
        (id_review_alvo IS NOT NULL AND id_lista_alvo IS NULL)
        OR
        (id_review_alvo IS NULL AND id_lista_alvo IS NOT NULL)
    )
);
