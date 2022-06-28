const ModelEvaluation = require("../Models/ModelEvaluation");
const log = require("../config/Logger");

// Fonctions du service Evaluation
const getEvaluationsByIdParking = async (request, response) => {
  await ModelEvaluation.getEvaluationsByIdParking(request, response);
};

const addEvaluation = async (request, response) => {
  await ModelEvaluation.addEvaluation(request, response);
};

const deleteEvaluation = async (request, response) => {
  await ModelEvaluation.deleteEvaluation(request, response);
};

//Exporter les fonctions du service Parking
module.exports = {
  getEvaluationsByIdParking,
  addEvaluation,
  deleteEvaluation,
};
