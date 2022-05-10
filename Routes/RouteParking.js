const express = require("express");
const routerParking = express.Router();
const serviceParking = require("../Services/ServiceParking");

//Declaration des routes du service Parking
routerParking.get("/parking/liste_parkings/", serviceParking.getParkings);
routerParking.get("/parking/get_parking/:id", serviceParking.getParkingById);
routerParking.post("/parking/ajouter_parking/", serviceParking.addParking);
routerParking.delete("/parking/supprimer_parking/:id", serviceParking.deleteParking);
module.exports = routerParking;
