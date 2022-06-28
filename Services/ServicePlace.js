const ModelPlace = require("../Models/ModelPlace");
const log = require("../config/Logger");

// Fonctions du service Place
const getPlaceLibre = async (request, response) => {
  await ModelPlace.getPlaceLibre(request, response);
};

const updateEtatPlace = async (request, response) => {
  await ModelPlace.updateEtatPlace(request, response);
};

//Exporter les fonctions du service Parking
module.exports = {
  getPlaceLibre,
  updateEtatPlace,
};
