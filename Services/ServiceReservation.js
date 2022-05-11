const ModelReservation = require("../Models/ModelReservation");
const log = require("../config/Logger");

// Fonctions du service Reservation
const addReservation = async (request, response) => {
  try {
    await ModelReservation.addReservation(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const addPlaceParkingReservation = async (request, response) => {
  try {
    await ModelReservation.addPlaceParkingReservation(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const updateEtatReservation = async (request, response) => {
  try {
    await ModelReservation.updateEtatReservation(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const getReservationBetweenHeureDebutHeureFin = async (request, response) => {
  try {
    await ModelReservation.getReservationBetweenHeureDebutHeureFin(
      request,
      response
    );
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

//Exporter les fonctions du service Parking
module.exports = {
  addReservation,
  getReservationBetweenHeureDebutHeureFin,
  updateEtatReservation,
  addPlaceParkingReservation,
};
