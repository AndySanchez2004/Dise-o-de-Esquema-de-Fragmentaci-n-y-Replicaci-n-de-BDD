-- 05_fragmentacion_mixta.sql
-- Fragmentación mixta de clientes:
-- 1) Corte horizontal por ciudad.
-- 2) Corte vertical por tipo de dato.

-- =========================================================
-- Ejecutar en pg-campus
-- Ciudad = Quevedo / Datos públicos
-- =========================================================

DROP TABLE IF EXISTS clientes_publicos_quevedo;

CREATE TABLE clientes_publicos_quevedo (
                                           cliente_id INTEGER PRIMARY KEY,
                                           nombre VARCHAR(80) NOT NULL,
                                           ciudad VARCHAR(40) NOT NULL
);

INSERT INTO clientes_publicos_quevedo VALUES
                                          (1, 'Maria Alvarado', 'Quevedo'),
                                          (3, 'Ana Vera', 'Quevedo');


-- =========================================================
-- Ejecutar en pg-babahoyo
-- Ciudad = Quevedo / Datos contacto
-- Ciudad = Babahoyo o Ventanas / Datos contacto
-- =========================================================

DROP TABLE IF EXISTS clientes_contacto_mixto;

CREATE TABLE clientes_contacto_mixto (
                                         cliente_id INTEGER PRIMARY KEY,
                                         email VARCHAR(120) NOT NULL,
                                         telefono VARCHAR(20)
);

INSERT INTO clientes_contacto_mixto VALUES
                                        (1, 'maria@uteq.edu.ec', '0991111111'),
                                        (2, 'luis@uteq.edu.ec', '0992222222'),
                                        (3, 'ana@uteq.edu.ec', '0993333333'),
                                        (4, 'jose@uteq.edu.ec', '0994444444'),
                                        (5, 'carla@uteq.edu.ec', '0995555555'),
                                        (6, 'pedro@uteq.edu.ec', '0996666666');


-- =========================================================
-- Ejecutar en pg-ventanas
-- Ciudad = Babahoyo o Ventanas / Datos públicos
-- =========================================================

DROP TABLE IF EXISTS clientes_publicos_babahoyo_ventanas;

CREATE TABLE clientes_publicos_babahoyo_ventanas (
                                                     cliente_id INTEGER PRIMARY KEY,
                                                     nombre VARCHAR(80) NOT NULL,
                                                     ciudad VARCHAR(40) NOT NULL
);

INSERT INTO clientes_publicos_babahoyo_ventanas VALUES
                                                    (2, 'Luis Cedeno', 'Babahoyo'),
                                                    (4, 'Jose Mendoza', 'Ventanas'),
                                                    (5, 'Carla Zambrano', 'Ventanas'),
                                                    (6, 'Pedro Suarez', 'Babahoyo');