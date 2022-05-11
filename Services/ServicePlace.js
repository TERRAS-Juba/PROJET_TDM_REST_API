const ModelPlace = require("../Models/ModelPlace");
const log = require("../config/Logger");

// Fonctions du service Place
const getPlaceLibre = async (request, response) => {
  try {
    await ModelPlace.getPlaceLibre(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const updateEtatPlace = async (request, response) => {
  try {
    await ModelPlace.updateEtatPlace(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

//Exporter les fonctions du service Parking
module.exports = {
  getPlaceLibre,
  updateEtatPlace,
};
