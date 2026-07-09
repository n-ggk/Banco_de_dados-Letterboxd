SELECT
    f.titulo,
    ROUND(AVG(r.nota), 2) AS media_avaliacao,
    COUNT(r.id_review) AS total_avaliacoes
FROM filmes f
JOIN filme_genero fg
    ON f.id_filme = fg.id_filme
JOIN generos g
    ON fg.id_genero = g.id_genero
JOIN reviews r
    ON f.id_filme = r.id_filme
WHERE g.nome = 'Filme de romance'
GROUP BY f.id_filme, f.titulo
ORDER BY media_avaliacao DESC, total_avaliacoes DESC
LIMIT 5;
