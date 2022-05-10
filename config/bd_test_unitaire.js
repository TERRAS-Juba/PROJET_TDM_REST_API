const pg_mem = require("pg-mem");

const pg = pg_mem.newDb().adapters.createPg();

const pool = new pg.Pool();
pool.query(
  `
CREATE TABLE public.am (
  id_am character varying(28)  NOT NULL,
  nom character varying(50)  NOT NULL,
  prenom character varying(50)  NOT NULL,
  numero_telephone character varying(10)  NOT NULL,
  email character varying(50)  NOT NULL,
  mot_de_passe character varying(50)  NOT NULL,
  photo_am character varying(255)  NOT NULL,
  CONSTRAINT am_pkey PRIMARY KEY (id_am),
  CONSTRAINT am_email_key UNIQUE (email)
);`
);
module.exports = pool;
