CREATE TABLE like_reviews (
    id_usuario INT NOT NULL,
    id_review INT NOT NULL,
    data_like TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_usuario, id_review),

    CONSTRAINT fk_like_usuario
        FOREIGN KEY (id_usuario)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT fk_like_review
        FOREIGN KEY (id_review)
        REFERENCES reviews(id_review)
        ON DELETE CASCADE
);
