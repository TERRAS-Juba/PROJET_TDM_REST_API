const firebase = require("../config/firebase");
const log = require("../config/Logger");

// Service notification functions

//send notification
const sendNotification = async (request,response) => {
  let device_token = request.body.device_token;
  let title=request.body.title
  let description=request.body.description
  var payload = {
    notification: {
      title: title,
      body: description,
    },
  };
  var options = {
    priority: "high",
    timeToLive: 60 * 60 * 24,
  };
  await firebase.messaging
    .sendToDevice(device_token, payload, options)
    .then(function (res) {
      console.log("Successfully sent message:", res);
      response.sendStatus(200)
    })
    .catch(function (error) {
      console.log(error);
      log.loggerConsole.error(error);
      log.loggerFile.error(error);
      response.sendStatus(403)
    });
};

// Export functions
module.exports = {
  sendNotification,
};
