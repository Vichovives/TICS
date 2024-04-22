INSERT INTO tarea_01.CASINO (id_casino, nombre_casino, direccion_casino) 
VALUES ('1', 'Bellagio', '3600 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('2', 'Venetian', '3355 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('3', 'Caesars Palace', '3570 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('4', 'MGM Grand', '3799 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('5', 'Wynn Las Vegas', '3131 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('6', 'Luxor', '3900 S Las Vegas Blvd, Las Vegas, NV 89119'),
       ('7', 'The Mirage', '3400 S Las Vegas Blvd, Las Vegas, NV 89109'),
       ('8', 'Aria Resort & Casino', '3730 S Las Vegas Blvd, Las Vegas, NV 89158');

INSERT INTO tarea_01.DIRECTOR (nombre_director, apellido_director, rut_director, id_casino)
VALUES ('Juan', 'Martinez', '12345678-9', '1'),
       ('Maria', 'Gonzalez', '98765432-1', '2'),
       ('Pedro', 'Lopez', '56789123-4', '3'),
       ('Ana', 'Rodriguez', '34567891-2', '4'),
       ('Carlos', 'Perez', '78912345-6', '5'),
       ('Luisa', 'Gomez', '23456789-1', '6'),
       ('Roberto', 'Diaz', '45678912-3', '7'),
       ('Laura', 'Hernandez', '89123456-7', '8');

INSERT INTO tarea_01.JUGADOR (rut_jugador, correo_jugador, apodo_jugador, id_pro)
VALUES ('11111111-1', 'jugador1@example.com', 'PlayerUno', '1'),
       ('22222222-2', 'jugador2@example.com', 'PlayerDos', '2'),
       ('33333333-3', 'jugador3@example.com', 'PlayerTres', '3'),
       ('44444444-4', 'jugador4@example.com', 'PlayerCuatro', '4'),
       ('55555555-5', 'jugador5@example.com', 'PlayerCinco', '5'),
       ('66666666-6', 'jugador6@example.com', 'PlayerSeis', '6'),
       ('77777777-7', 'jugador7@example.com', 'PlayerSiete', '7'),
       ('88888888-8', 'jugador8@example.com', 'PlayerOcho', '8');

INSERT INTO tarea_01.CUENTA (id_cuenta, rut_jugador)
VALUES ('1', '11111111-1'),
       ('2', '22222222-2'),
       ('3', '33333333-3'),
       ('4', '44444444-4'),
       ('5', '55555555-5'),
       ('6', '66666666-6'),
       ('7', '77777777-7'),
       ('8', '88888888-8');

-- Transacciones para la cuenta 1
INSERT INTO tarea_01.TRANSACCION (monto_transaccion, nro_transaccion, fecha_transaccion, id_cuenta)
VALUES (100.00, 1, '2024-04-21', '1'),
       (150.00, 2, '2024-04-20', '1'),
       (200.00, 3, '2024-04-19', '1'),
       (75.00, 4, '2024-04-18', '1'),
       (50.00, 5, '2024-04-17', '1'),
       (120.00, 6, '2024-04-16', '1'),
       (80.00, 7, '2024-04-15', '1'),
       (90.00, 8, '2024-04-14', '1');

-- Transacciones para la cuenta 2
INSERT INTO tarea_01.TRANSACCION (monto_transaccion, nro_transaccion, fecha_transaccion, id_cuenta)
VALUES (200.00, 1, '2024-04-21', '2'),
       (250.00, 2, '2024-04-20', '2'),
       (300.00, 3, '2024-04-19', '2'),
       (175.00, 4, '2024-04-18', '2'),
       (150.00, 5, '2024-04-17', '2'),
       (220.00, 6, '2024-04-16', '2'),
       (180.00, 7, '2024-04-15', '2'),
       (190.00, 8, '2024-04-14', '2');

INSERT INTO tarea_01.JUEGO (nombre_juego)
VALUES ('Blackjack'),
       ('Ruleta'),
       ('Póker'),
       ('Baccarat'),
       ('Craps'),
       ('Punto y banca'),
       ('Texas Holdem'),
       ('Dado'),
       ('Máquinas tragamonedas'),
       ('Bingo'),
       ('Keno'),
       ('Lotería'),
       ('Sic Bo'),
       ('Bola 8'),
       ('Dominó'),
       ('Tute');

-- Juegos sin crupier
INSERT INTO tarea_01.SIN_CRUPIER (nombre_juego, dinero_actual, jackpot)
VALUES ('Máquinas tragamonedas', 5000.00, 1000.00),
       ('Bingo', 3000.00, 500.00),
       ('Keno', 2000.00, 300.00),
       ('Lotería', 4000.00, 800.00),
       ('Sic Bo', 2500.00, 400.00),
       ('Bola 8', 3500.00, 600.00),
       ('Dominó', 1500.00, 200.00),
       ('Tute', 1000.00, 100.00);

INSERT INTO tarea_01.CRUPIER (fecha_ingreso_crupier, apodo_crupier, rut_crupier)
VALUES ('2023-01-01', 'CrupierUno', '11148481-1'),
       ('2023-02-01', 'CrupierDos', '22492222-2'),
       ('2023-03-01', 'CrupierTres', '33333337-3'),
       ('2023-04-01', 'CrupierCuatro', '44459444-4'),
       ('2023-05-01', 'CrupierCinco', '55555995-5'),
       ('2023-06-01', 'CrupierSeis', '66666979-6'),
       ('2023-07-01', 'CrupierSiete', '77797777-7'),
       ('2023-08-01', 'CrupierOcho', '88882988-8');


-- Juegos con crupier

INSERT INTO tarea_01.CON_CRUPIER (nombre_juego, rut_crupier)
VALUES ('Blackjack', '11148481-1'),
       ('Ruleta', '22492222-2'),
       ('Póker', '33333337-3'),
       ('Baccarat', '44459444-4'),
       ('Craps', '55555995-5'),
       ('Punto y banca', '66666979-6'),
       ('Texas Holdem', '77797777-7'),
       ('Dado', '88882988-8');


INSERT INTO tarea_01.HOTEL (id_casino)
VALUES ('1'), ('2'), ('3'), ('4'), ('5'), ('6'), ('7'), ('8');


INSERT INTO tarea_01.REGISTRO (numero_habitacion, fecha_ingreso, fecha_salida, id_casino, rut_jugador)
VALUES
(101, '2024-04-22', '2024-04-24', '1', '11111111-1'),
(102, '2024-04-22', '2024-04-24', '2', '22222222-2'),
(103, '2024-04-22', '2024-04-24', '3', '33333333-3'),
(104, '2024-04-22', '2024-04-24', '4', '44444444-4'),
(105, '2024-04-22', '2024-04-24', '5', '55555555-5'),
(106, '2024-04-22', '2024-04-24', '6', '66666666-6'),
(107, '2024-04-22', '2024-04-24', '7', '77777777-7'),
(108, '2024-04-22', '2024-04-24', '8', '88888888-8');


INSERT INTO tarea_01.HABITACION (nro_camas, numero_habitacion, id_casino)
SELECT FLOOR(RAND() * 4) + 1, numero_habitacion, id_casino
FROM tarea_01.REGISTRO;

INSERT INTO tarea_01.CAMARA (fecha_creacion, ubicacion, id_casino)
VALUES
    ('2024-04-20', 'Sala VIP1', '2'),
    ('2024-04-21', 'Sala Principal1', '1'),
    ('2024-04-22', 'Sala Principal2', '3'),
    ('2024-04-23', 'Sala VIP4', '4'),
    ('2024-04-24', 'Sala VIP5', '5'),
    ('2024-04-25', 'Sala Principal6', '6'),
    ('2024-04-26', 'Sala Principal7', '7'),
    ('2024-04-27', 'Sala VIP8', '8');

INSERT INTO tarea_01.TRAMPA (fecha_trampa, link_video, tipo_trampa, ubicacion, id_casino, rut_jugador)
VALUES
    ('2024-04-20', 'https://www.youtube.com/watch?v=video1', 'hacer señas', 'Sala VIP1', '2', '11111111-1'),
    ('2024-04-21', 'https://www.youtube.com/watch?v=video2', 'colaboración con crupier', 'Sala Principal1', '1', '22222222-2'),
    ('2024-04-22', 'https://www.youtube.com/watch?v=video3', 'contar cartas', 'Sala Principal2', '3', '33333333-3'),
    ('2024-04-23', 'https://www.youtube.com/watch?v=video4', 'marcar cartas', 'Sala VIP4', '4', '44444444-4'),
    ('2024-04-24', 'https://www.youtube.com/watch?v=video5', 'usar dispositivos electrónicos', 'Sala VIP5', '5', '55555555-5'),
    ('2024-04-25', 'https://www.youtube.com/watch?v=video6', 'alterar apuestas', 'Sala Principal6', '6', '66666666-6'),
    ('2024-04-26', 'https://www.youtube.com/watch?v=video7', 'ocultar fichas', 'Sala Principal7', '7', '77777777-7'),
    ('2024-04-27', 'https://www.youtube.com/watch?v=video8', 'intercambio de fichas', 'Sala VIP8', '8', '88888888-8');


INSERT INTO tarea_01.trabajan (id_casino, rut_crupier)
VALUES
('1', '11148481-1'),
('2', '22492222-2'),
('3', '33333337-3'),
('4', '44459444-4'),
('5', '55555995-5'),
('6', '66666979-6'),
('7', '77797777-7'),
('8', '88882988-8');

INSERT INTO tarea_01.RESTAURANT (nombre_restaurant, tipo_comida, estrellas, id_casino)
VALUES
    ('Las Delicias', 'Comida mexicana', 1, '1'),
    ('La Trattoria', 'Comida italiana', 3, '2'),
    ('Sabor Oriental', 'Comida asiática', 2, '3'),
    ('El Fogón Criollo', 'Comida típica chilena', 0, '4'),
    ('Café París', 'Cafetería', 3, '5'),
    ('Parrilla Argentina', 'Carnes asadas', 2, '6'),
    ('Sushi Roll', 'Sushi', 2, '7'),
    ('Bistró Francés', 'Comida francesa', 0, '8');

INSERT INTO tarea_01.tiene (id_casino, rut_jugador)
VALUES
('1', '11111111-1'),
('2', '22222222-2'),
('3', '33333333-3'),
('4', '44444444-4'),
('5', '55555555-5'),
('6', '66666666-6'),
('7', '77777777-7'),
('8', '88888888-8');

