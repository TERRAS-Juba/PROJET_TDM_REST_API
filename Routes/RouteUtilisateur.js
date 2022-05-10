const express = require("express");
const routerUtilisateur = express.Router();
const serviceUtilisateur = require("../Services/ServiceUtilisateur");

//Declaration des routes du service Parking
routerUtilisateur.post(
  "/utilisateur/connexion_utilisateur_email/",
  serviceUtilisateur.getUtilisateurByEmail
);
routerUtilisateur.post(
  "/utilisateur/connexion_utilisateur_numero_telephone/",
  serviceUtilisateur.getUtilisateurByNumeroTelephone
);
routerUtilisateur.post(
  "/utilisateur/ajouter_utilisateur/",
  serviceUtilisateur.addUtilisateur
);
routerUtilisateur.delete(
  "/utilisateur/supprimer_utilisateur_email/:email",
  serviceUtilisateur.deleteUtilisateurByEmail
);
module.exports = routerUtilisateur;
