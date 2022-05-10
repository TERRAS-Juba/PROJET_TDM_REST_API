const express = require("express");
const routerParking = express.Router();
const serviceParking = require("../Services/ServiceParking");

//Declaration des routes du service Parking
routerParking.get("/parking/get_parkings/", serviceParking.getParkings);
module.exports = routerParking;
