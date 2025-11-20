const admin = require("firebase-admin/app");
admin.initializeApp();

const createDriverUser = require("./create_driver_user.js");
exports.createDriverUser = createDriverUser.createDriverUser;
const calculateTotalFare = require("./calculate_total_fare.js");
exports.calculateTotalFare = calculateTotalFare.calculateTotalFare;
