const functions = require("firebase-functions");
const admin = require("firebase-admin");

// Ensure the Firebase Admin SDK is initialized once.
// In a typical FF setup, this is often done in the main index.js, but
// including it here as a comment ensures the function works if deployed alone.
// admin.initializeApp();

exports.createDriverUser = functions.https.onCall(async (data, context) => {
  // 1. **Authentication Check:** (Ensure an Admin is logged in, if this is an Admin action)
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "The function must be called by an authenticated user.",
    );
  }

  const { email, password, fullName, licenseNumber, vehicleReg, phoneNumber } =
    data;

  // 2. **Input Validation:** Check required fields
  if (!email || !password || !fullName || !licenseNumber || !phoneNumber) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Missing required driver information.",
    );
  }

  try {
    // 3. **Create User in Firebase Auth (Authentication Credentials)**
    const userRecord = await admin.auth().createUser({
      email: email,
      password: password,
      displayName: fullName,
      emailVerified: true,
    });

    const newUid = userRecord.uid;

    // 4. **Create Profile in Firestore (Profile Data & Role)**
    await admin.firestore().collection("users").doc(newUid).set({
      uid: newUid,
      email: email,
      display_name: fullName,
      phone_number: phoneNumber,
      role: "drivers", // *** CRITICAL FOR ROLE ENFORCEMENT ***
      is_verified: false, // Must be verified by Admin later
      availability_status: "offline", // Default status
      license_number: licenseNumber,
      vehicle_registration: vehicleReg,
      created_time: admin.firestore.FieldValue.serverTimestamp(),
      // Add other essential fields here if needed
    });

    // 5. **Return the UID:** Used by FlutterFlow to navigate/confirm.
    return { uid: newUid };
  } catch (error) {
    // Log error for debugging
    console.error("Error creating new driver user:", error);

    // Handle specific Firebase Auth errors
    if (error.code === "auth/email-already-in-use") {
      throw new functions.https.HttpsError(
        "already-exists",
        "The email address is already in use by another user.",
      );
    }

    throw new functions.https.HttpsError(
      "internal",
      error.message || "Failed to create user account.",
    );
  }
});
