CREATE TABLE seguidores (
    id_usuario_seguidor INT NOT NULL,
    id_usuario_seguido INT NOT NULL,
    data_follow TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    PRIMARY KEY (id_usuario_seguidor, id_usuario_seguido),

    CONSTRAINT fk_usuario_seguidor
        FOREIGN KEY (id_usuario_seguidor)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT fk_usuario_seguido
        FOREIGN KEY (id_usuario_seguido)
        REFERENCES usuarios(id_usuario)
        ON DELETE CASCADE,

    CONSTRAINT chk_usuario_nao_segue_ele_mesmo
        CHECK (id_usuario_seguidor <> id_usuario_seguido)
);
