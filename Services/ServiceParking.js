const ModelParking = require("../Models/ModelParking");
const log = require("../config/Logger");

// Fonctions du service Parking
const getParkings = async (request, response) => {
  try {
    await ModelParking.getParkings(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

//Exporter les fonctions du service Parking
module.exports = {
  getParkings
};
