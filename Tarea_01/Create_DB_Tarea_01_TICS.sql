CREATE TABLE CASINO
(
  id_casino VARCHAR(64) NOT NULL,
  nombre_casino VARCHAR(64) NOT NULL,
  direccion_casino VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_casino)
);

CREATE TABLE DIRECTOR
(
  nombre_director VARCHAR(64) NOT NULL,
  apellido_director VARCHAR(64) NOT NULL,
  rut_director VARCHAR(64) NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  PRIMARY KEY (rut_director, id_casino),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino)
);

CREATE TABLE JUGADOR
(
  rut_jugador VARCHAR(64) NOT NULL,
  correo_jugador VARCHAR(64) NOT NULL,
  apodo_jugador VARCHAR(64) NOT NULL,
  id_pro VARCHAR(64) NOT NULL,
  PRIMARY KEY (rut_jugador)
);

CREATE TABLE CUENTA
(
  id_cuenta VARCHAR(64) NOT NULL,
  rut_jugador VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_cuenta),
  FOREIGN KEY (rut_jugador) REFERENCES JUGADOR(rut_jugador)
);

CREATE TABLE TRANSACCION
(
  monto_transaccion FLOAT NOT NULL,
  nro_transaccion INT NOT NULL,
  fecha_transaccion DATE NOT NULL,
  id_cuenta VARCHAR(64) NOT NULL,
  PRIMARY KEY (nro_transaccion, id_cuenta),
  FOREIGN KEY (id_cuenta) REFERENCES CUENTA(id_cuenta)
);

CREATE TABLE JUEGO
(
  nombre_juego VARCHAR(64) NOT NULL,
  PRIMARY KEY (nombre_juego)
);

CREATE TABLE SIN_CRUPIER
(
  dinero_actual FLOAT NOT NULL,
  jackpot FLOAT NOT NULL,
  nombre_juego VARCHAR(64) NOT NULL,
  PRIMARY KEY (nombre_juego),
  FOREIGN KEY (nombre_juego) REFERENCES JUEGO(nombre_juego)
);

CREATE TABLE CRUPIER
(
  fecha_ingreso_crupier DATE NOT NULL,
  apodo_crupier VARCHAR(64) NOT NULL,
  rut_crupier VARCHAR(64) NOT NULL,
  PRIMARY KEY (rut_crupier)
);

CREATE TABLE CAMARA
(
  fecha_creacion DATE NOT NULL,
  ubicacion VARCHAR(64) NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  PRIMARY KEY (ubicacion, id_casino),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino)
);

CREATE TABLE TRAMPA
(
  fecha_trampa DATE NOT NULL,
  link_video VARCHAR(64) NOT NULL,
  tipo_trampa VARCHAR(64) NOT NULL,
  ubicacion VARCHAR(64) NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  rut_jugador VARCHAR(64) NOT NULL,
  PRIMARY KEY (link_video, ubicacion, id_casino, rut_jugador),
  FOREIGN KEY (ubicacion, id_casino) REFERENCES CAMARA(ubicacion, id_casino),
  FOREIGN KEY (rut_jugador) REFERENCES JUGADOR(rut_jugador)
);

CREATE TABLE RESTAURANT
(
  nombre_restaurant VARCHAR(64) NOT NULL,
  tipo_comida VARCHAR(64) NOT NULL,
  estrellas INT NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  PRIMARY KEY (nombre_restaurant, id_casino),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino)
);

CREATE TABLE HOTEL
(
  id_casino VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_casino),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino)
);

CREATE TABLE REGISTRO
(
  numero_habitacion INT NOT NULL,
  fecha_ingreso DATE NOT NULL,
  fecha_salida DATE NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  rut_jugador VARCHAR(64) NOT NULL,
  PRIMARY KEY (numero_habitacion, id_casino),
  FOREIGN KEY (id_casino) REFERENCES HOTEL(id_casino),
  FOREIGN KEY (rut_jugador) REFERENCES JUGADOR(rut_jugador),
  UNIQUE (fecha_ingreso),
  UNIQUE (fecha_salida)
);

CREATE TABLE HABITACION
(
  nro_camas INT NOT NULL,
  numero_habitacion INT NOT NULL,
  id_casino VARCHAR(64) NOT NULL,
  FOREIGN KEY (numero_habitacion, id_casino) REFERENCES REGISTRO(numero_habitacion, id_casino)
);

CREATE TABLE tiene
(
  id_casino VARCHAR(64) NOT NULL,
  rut_jugador VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_casino, rut_jugador),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino),
  FOREIGN KEY (rut_jugador) REFERENCES JUGADOR(rut_jugador)
);

CREATE TABLE trabajan
(
  id_casino VARCHAR(64) NOT NULL,
  rut_crupier VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_casino, rut_crupier),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino),
  FOREIGN KEY (rut_crupier) REFERENCES CRUPIER(rut_crupier)
);

CREATE TABLE tiene
(
  id_casino VARCHAR(64) NOT NULL,
  nombre_juego VARCHAR(64) NOT NULL,
  PRIMARY KEY (id_casino, nombre_juego),
  FOREIGN KEY (id_casino) REFERENCES CASINO(id_casino),
  FOREIGN KEY (nombre_juego) REFERENCES JUEGO(nombre_juego)
);

CREATE TABLE CON_CRUPIER
(
  nombre_juego VARCHAR(64) NOT NULL,
  rut_crupier VARCHAR(64) NOT NULL,
  PRIMARY KEY (nombre_juego),
  FOREIGN KEY (nombre_juego) REFERENCES JUEGO(nombre_juego),
  FOREIGN KEY (rut_crupier) REFERENCES CRUPIER(rut_crupier)
);

CREATE TABLE TORNEO
(
  nombre_torneo VARCHAR(64) NOT NULL,
  fecha_torneo DATE NOT NULL,
  cantidad_jugadores INT NOT NULL,
  premio FLOAT NOT NULL,
  rango VARCHAR(64) NOT NULL,
  ganador_torneo VARCHAR(64) NOT NULL,
  nombre_juego VARCHAR(64) NOT NULL,
  PRIMARY KEY (nombre_torneo),
  FOREIGN KEY (nombre_juego) REFERENCES CON_CRUPIER(nombre_juego),
  UNIQUE (fecha_torneo)
);

CREATE TABLE INSTANCIA
(
  fecha_instancia DATE NOT NULL,
  beneficiado VARCHAR(64) NOT NULL,
  nombre_torneo VARCHAR(64) NOT NULL,
  PRIMARY KEY (fecha_instancia, nombre_torneo),
  FOREIGN KEY (nombre_torneo) REFERENCES TORNEO(nombre_torneo),
  UNIQUE (beneficiado)
);

CREATE TABLE participan
(
  rut_jugador VARCHAR(64) NOT NULL,
  nombre_torneo VARCHAR(64) NOT NULL,
  PRIMARY KEY (rut_jugador, nombre_torneo),
  FOREIGN KEY (rut_jugador) REFERENCES JUGADOR(rut_jugador),
  FOREIGN KEY (nombre_torneo) REFERENCES TORNEO(nombre_torneo)
);