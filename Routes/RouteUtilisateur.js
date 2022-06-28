const express = require("express");
const routerUtilisateur = express.Router();
const serviceUtilisateur = require("../Services/ServiceUtilisateur");

//Declaration des routes du service Parking
routerUtilisateur.post(
  "/utilisateur/connexion_utilisateur_email/",
  serviceUtilisateur.getUtilisateurByEmail
);
routerUtilisateur.post(
  "/utilisateur/get_utilisateur_email/",
  serviceUtilisateur.getUtilisateurByEmailWithoutPassword
);
routerUtilisateur.post(
  "/utilisateur/connexion_utilisateur_numero_telephone/",
  serviceUtilisateur.getUtilisateurByNumeroTelephone
);
routerUtilisateur.post(
  "/utilisateur/ajouter_utilisateur/",
  serviceUtilisateur.addUtilisateur
);
routerUtilisateur.post(
  "/utilisateur/update_utilisateur_device_token/",
  serviceUtilisateur.updateDeviceTokenUtilisateur
);
module.exports = routerUtilisateur;
