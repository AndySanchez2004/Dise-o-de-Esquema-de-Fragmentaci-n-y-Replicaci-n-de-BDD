CREATE EXTENSION IF NOT EXISTS postgres_fdw;

CREATE SERVER srv_babahoyo
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'pg-babahoyo', dbname 'cafeteria', port '5432');

CREATE SERVER srv_ventanas
FOREIGN DATA WRAPPER postgres_fdw
OPTIONS (host 'pg-ventanas', dbname 'cafeteria', port '5432');

CREATE USER MAPPING FOR admin SERVER srv_babahoyo
OPTIONS (user 'admin', password 'admin123');

CREATE USER MAPPING FOR admin SERVER srv_ventanas
OPTIONS (user 'admin', password 'admin123');

CREATE FOREIGN TABLE pedidos_babahoyo (
    pedido_id INTEGER,
    cliente_id INTEGER,
    producto_id INTEGER,
    fecha DATE,
    monto NUMERIC(8,2),
    sede VARCHAR(20)
) SERVER srv_babahoyo OPTIONS (table_name 'pedidos');

CREATE FOREIGN TABLE pedidos_ventanas (
    pedido_id INTEGER,
    cliente_id INTEGER,
    producto_id INTEGER,
    fecha DATE,
    monto NUMERIC(8,2),
    sede VARCHAR(20)
) SERVER srv_ventanas OPTIONS (table_name 'pedidos');

CREATE VIEW pedidos_global AS
SELECT * FROM pedidos
UNION ALL
SELECT * FROM pedidos_babahoyo
UNION ALL
SELECT * FROM pedidos_ventanas;