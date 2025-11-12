const admin = require("firebase-admin/app");
admin.initializeApp();

const createDriverUser = require("./create_driver_user.js");
exports.createDriverUser = createDriverUser.createDriverUser;
