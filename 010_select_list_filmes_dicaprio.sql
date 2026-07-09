SELECT
    f.titulo,
    ROUND(AVG(r.nota), 2) AS media_avaliacao,
    COUNT(r.id_review) AS total_avaliacoes
FROM filmes f
JOIN filme_ator fa
    ON f.id_filme = fa.id_filme
JOIN pessoas p
    ON fa.id_pessoa = p.id_pessoa
JOIN reviews r
    ON f.id_filme = r.id_filme
WHERE p.nome = 'Leonardo DiCaprio'
GROUP BY f.id_filme, f.titulo
ORDER BY media_avaliacao DESC, total_avaliacoes DESC
LIMIT 5;
