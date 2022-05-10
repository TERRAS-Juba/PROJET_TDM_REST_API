// Declaration de variables
// Pool pour l'accés a la base de données
let pool = null;
if (process.env.NODE_ENV === "test_unitaire") {
  pool = require("../config/bd_test_unitaire");
} else {
  pool = require("../config/bd_test_integration");
}
module.exports = pool;
