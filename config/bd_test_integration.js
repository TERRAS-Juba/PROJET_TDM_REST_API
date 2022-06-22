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
  user: "dovsksxwglnxdf",
  host: "ec2-54-76-43-89.eu-west-1.compute.amazonaws.com",
  database: "d3vj2jdd55lhaf",
  password: "416dc753d9d1db383dec8e8ff7fdfdc14ffa7b1c8147a88860c1346cfd6adad1",
  port: 5432,
});
module.exports = poolTestIntegration;