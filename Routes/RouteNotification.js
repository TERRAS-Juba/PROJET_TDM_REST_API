const express = require("express");
const routerEvalaution = express.Router();
const serviceNotification = require("../Services/ServiceNotification");

//Declaration des routes du service Evaluation
routerEvalaution.post(
  "/envoyer_notification/",
  serviceNotification.sendNotification
);

module.exports = routerEvalaution;
