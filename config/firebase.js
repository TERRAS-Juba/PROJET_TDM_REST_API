// Variables Declarations
let admin = require("firebase-admin");
let serviceAccount = require("./projet-tdm-eaf20-firebase-adminsdk-kdrlt-6c290f229f.json");
const log = require("../config/Logger");

// FireBase admin SDK initialisation
admin.initializeApp({
  credential: admin.credential.cert(serviceAccount),
});
const messaging = admin.messaging();
// Export Firebase functions
module.exports = {
  messaging,
  admin,
};
