const Pool = require("pg").Pool;

const poolTestIntegration = new Pool({
  user: "postgres",
  host: "localhost",
  database: "tdm",
  password: "AdministrateurAutotek2022*",
  port: 5432,
});

module.exports = poolTestIntegration;