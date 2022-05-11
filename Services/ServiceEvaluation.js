const ModelEvaluation = require("../Models/ModelEvaluation");
const log = require("../config/Logger");

// Fonctions du service Evaluation
const getEvaluationsByIdParking = async (request, response) => {
  try {
    await ModelEvaluation.getEvaluationsByIdParking(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const addEvaluation = async (request, response) => {
  try {
    await ModelEvaluation.addEvaluation(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

const deleteEvaluation = async (request, response) => {
  try {
    await ModelEvaluation.deleteEvaluation(request, response);
  } catch (error) {
    log.loggerConsole.error(error);
    log.loggerFile.error(error);
    response.sendStatus(500);
  }
};

//Exporter les fonctions du service Parking
module.exports = {
 getEvaluationsByIdParking,
 addEvaluation,
 deleteEvaluation
};
