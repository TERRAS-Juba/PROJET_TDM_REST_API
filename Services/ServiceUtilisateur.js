const ModelUtilisateur = require("../Models/ModelUtilisateur");
const log = require("../config/Logger");

// Fonctions du service Utilisateur
const getUtilisateurByEmail = async (request, response) => {
    await ModelUtilisateur.getUtilisateurByEmail(request, response);
};
const getUtilisateurByEmailWithoutPassword = async (request, response) => {
  await ModelUtilisateur.getUtilisateurByEmailWithoutPassword(request, response);
};
const getUtilisateurByNumeroTelephone = async (request, response) => {
    await ModelUtilisateur.getUtilisateurByNumeroTelephone(request, response);
};

const addUtilisateur = async (request, response) => {
    await ModelUtilisateur.addUtilisateur(request, response);
};

const deleteUtilisateurByEmail = async (request, response) => {
    await ModelUtilisateur.deleteUtilisateurByEmail(request, response);
};
// Modifier le device token d'un utilisateur
const updateDeviceTokenUtilisateur = async (request, response) => {
    await ModelUtilisateur.updateDeviceTokenUtilisateur(request, response);
};

//Exporter les fonctions du service Parking
module.exports = {
  getUtilisateurByEmailWithoutPassword,
  getUtilisateurByEmail,
  getUtilisateurByNumeroTelephone,
  addUtilisateur,
  updateDeviceTokenUtilisateur
};
