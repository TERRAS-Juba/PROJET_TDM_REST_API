const ModelParking = require("../Models/ModelParking");
const log = require("../config/Logger");

// Fonctions du service Parking
const getParkings = async (request, response) => {
  await ModelParking.getParkings(request, response);
};

const getParkingById = async (request, response) => {
  await ModelParking.getParkingById(request, response);
};

const addParking = async (request, response) => {
  await ModelParking.addParking(request, response);
};

const deleteParking = async (request, response) => {
  await ModelParking.deleteParking(request, response);
};

//Exporter les fonctions du service Parking
module.exports = {
  getParkings,
  getParkingById,
  addParking,
  deleteParking,
};
