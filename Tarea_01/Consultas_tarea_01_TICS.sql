-- CONSULTA 01
SELECT J.rut_jugador, J.correo_jugador, J.apodo_jugador, J.id_pro
FROM JUGADOR J
WHERE J.id_pro IS NOT NULL
ORDER BY J.rut_jugador DESC;

-- CONSULTA 02
SELECT tipo_trampa, COUNT(*) AS cantidad
FROM TRAMPA
GROUP BY tipo_trampa
ORDER BY COUNT(*) DESC
LIMIT 1;

-- CONSULTA 03
SELECT MAX(monto_transaccion) AS transaccion_mas_alta
FROM TRANSACCION
WHERE YEAR(fecha_transaccion) = YEAR(CURRENT_DATE());

-- CONSULTA 04
SELECT apodo_jugador
FROM JUGADOR
WHERE NOT EXISTS (
    SELECT 1
    FROM CUENTA
    WHERE CUENTA.rut_jugador = JUGADOR.rut_jugador
);

-- CONSULTA 05
WITH total_jugadores AS (
    SELECT COUNT(*) AS total FROM JUGADOR
),
jugadores_trampa AS (
    SELECT COUNT(*) AS trampa
    FROM TRAMPA
    INNER JOIN JUGADOR ON TRAMPA.rut_jugador = JUGADOR.rut_jugador
    WHERE JUGADOR.rut_jugador LIKE '20%' AND TRAMPA.tipo_trampa = 'contar cartas'
)
SELECT (jugadores_trampa.trampa * 100.0 / total_jugadores.total) AS porcentaje
FROM total_jugadores, jugadores_trampa;

-- CONSULTA 06
SELECT J.apodo_jugador
FROM JUGADOR J
JOIN REGISTRO R ON J.rut_jugador = R.rut_jugador
JOIN HABITACION H ON R.numero_habitacion = H.numero_habitacion
ORDER BY H.nro_camas DESC
LIMIT 1;

-- CONSULTA 07
SELECT
    (SELECT MAX(jackpot) FROM SIN_CRUPIER WHERE nombre_juego = 'roamoneas 777') *
    (SELECT MAX(monto_transaccion) AS segundo_monto_mas_alto
            FROM TRANSACCION
            WHERE monto_transaccion < (SELECT MAX(monto_transaccion) FROM TRANSACCION)
    ) *
    (SELECT MAX(premio) FROM TORNEO) AS multiplicacion;

-- CONSULTA 08
SELECT rut_jugador
FROM (
    SELECT ganador_torneo AS rut_jugador, COUNT(*) AS cantidad_ganados
    FROM TORNEO
    WHERE ganador_torneo IN (
        SELECT rut_jugador
        FROM JUGADOR
        WHERE id_pro IS NULL
    ) AND rango = 'maestro'
    GROUP BY ganador_torneo
    ORDER BY cantidad_ganados DESC
    LIMIT 1
) AS subconsulta;

-- CONSULTA 09
SELECT D.nombre_director, D.apellido_director
FROM DIRECTOR D
JOIN CASINO C ON D.id_casino = C.id_casino
JOIN (
    SELECT id_casino, SUM(estrellas) AS total_estrellas
    FROM RESTAURANT
    GROUP BY id_casino
) AS TotalEstrellasPorCasino ON C.id_casino = TotalEstrellasPorCasino.id_casino
WHERE TotalEstrellasPorCasino.total_estrellas = (
    SELECT MAX(total_estrellas)
    FROM (
        SELECT SUM(estrellas) AS total_estrellas
        FROM RESTAURANT
        GROUP BY id_casino
    ) AS TotalEstrellasPorCasino
);


-- CONSULTA 10
SELECT
    MIN(premio) AS premio_mas_bajo,
    MIN(monto_transaccion) AS transaccion_mas_baja,
    MIN(dinero_actual) AS jackpot_mas_bajo,
    MAX(premio) AS premio_mas_alto,
    MAX(monto_transaccion) AS transaccion_mas_alta,
    MAX(dinero_actual) AS jackpot_mas_alto
FROM
    TORNEO, TRANSACCION, SIN_CRUPIER;

-- CONSULTA 11
SELECT
    (SELECT COUNT(*)
     FROM participan P
     JOIN TORNEO T ON P.nombre_torneo = T.nombre_torneo
     WHERE T.fecha_torneo BETWEEN '2024-01-01' AND '2024-12-31'
     AND T.rango LIKE '%masters%')
     /
    (SELECT COUNT(*)
     FROM JUGADOR
     WHERE correo_jugador LIKE '%.cl')
     AS ratio_jugadores_masters_cl;

-- CONSULTA 12
SELECT ubicacion
FROM (
    SELECT ubicacion, COUNT(*) AS cantidad_trampas
    FROM TRAMPA
    WHERE rut_jugador = (
        SELECT rut_jugador
        FROM JUGADOR
        WHERE apodo_jugador = 'El Trampas'
    ) AND link_video LIKE '%youtube%'
    GROUP BY ubicacion
) AS subconsulta
WHERE cantidad_trampas = (
    SELECT MAX(cantidad_trampas)
    FROM (
        SELECT COUNT(*) AS cantidad_trampas
        FROM TRAMPA
        WHERE rut_jugador = (
            SELECT rut_jugador
            FROM JUGADOR
            WHERE apodo_jugador = 'El Trampas'
        ) AND link_video LIKE '%youtube%'
        GROUP BY ubicacion
    ) AS max_subconsulta
);


-- CONSULTA 13
WITH MaxInstanciasJugador AS (
    SELECT beneficiado AS rut_jugador, COUNT(*) AS cantidad_instancias
    FROM INSTANCIA
    GROUP BY beneficiado
    ORDER BY COUNT(*) DESC
    LIMIT 1
)
SELECT C.rut_jugador, SUM(T.monto_transaccion) AS suma_transacciones
FROM TRANSACCION T
JOIN CUENTA C ON T.id_cuenta = C.id_cuenta
JOIN MaxInstanciasJugador MIJ ON C.rut_jugador = MIJ.rut_jugador
GROUP BY C.rut_jugador;

-- CONSULTA 14
SELECT tipo_comida, SUM(estrellas) AS suma_estrellas
FROM RESTAURANT
GROUP BY tipo_comida
ORDER BY suma_estrellas ASC;

-- CONSULTA 15
SELECT C.rut_jugador, T.monto_transaccion
FROM TRANSACCION T
JOIN CUENTA C ON T.id_cuenta = C.id_cuenta
JOIN REGISTRO R ON C.rut_jugador = R.rut_jugador
ORDER BY R.fecha_ingreso DESC
LIMIT 1;


