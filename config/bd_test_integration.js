const Pool = require("pg").Pool;

/*const poolTestIntegration = new Pool({
  user: "postgres",
  host: "localhost",
  database: "tdm",
  password: "AdministrateurAutotek2022*",
  port: 5432,
});
*/
const poolTestIntegration = new Pool({
  connectionString: process.env.DATABASE_URL,
  ssl: {
    rejectUnauthorized: false
  }
});
module.exports = poolTestIntegration;