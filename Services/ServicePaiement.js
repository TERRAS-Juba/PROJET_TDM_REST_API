const ModelPaiement = require("../Models/ModelPaiement");
const log = require("../config/Logger");

const addPaiement = async (request, response) => {
  try {
    await ModelPaiement.addPaiement(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

//Exporter les fonctions du service Parking
module.exports = {
  addPaiement,
};
