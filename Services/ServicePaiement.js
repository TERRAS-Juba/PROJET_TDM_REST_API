const ModelPaiement = require("../Models/ModelPaiement");
const log = require("../config/Logger");

const addPaiement = async (request, response) => {
  await ModelPaiement.addPaiement(request, response);
};

//Exporter les fonctions du service Parking
module.exports = {
  addPaiement,
};
