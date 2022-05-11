// Declaration de variables
const pool = require("../config/config_pool");
const log = require("../config/Logger");

// Ajouter un paiement
const addPaiement = async (request, response) => {
  pool.query(
    `INSERT INTO public."Paiement"(id_paiement, montant, date_paiement)
	VALUES ($1, $2, $3);`,
    [request.body.id, request.body.montant, request.body.date_paiement],
    (error, results) => {
      if (error) {
        log.loggerConsole.error(error);
        log.loggerFile.error(error);
        response.sendStatus(500);
      } else {
        response.sendStatus(200);
      }
    }
  );
};

//Exporter les fonctions CRUD de la table parking
module.exports = {
  addPaiement,
};
