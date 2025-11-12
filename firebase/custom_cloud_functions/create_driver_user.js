const functions = require("firebase-functions");
const admin = require("firebase-admin");

// NOTE: If you haven't initialized the Admin SDK elsewhere, uncomment the line below.
// admin.initializeApp();

exports.createDriverUser = functions.https.onCall(async (data, context) => {
  // 1. **Authentication Check:** Ensure only an authenticated user calls this.
  // OPTIONAL: You should add a check here to ensure the caller has an 'admin' role.
  if (!context.auth) {
    throw new functions.https.HttpsError(
      "unauthenticated",
      "The function must be called by an authenticated user.",
    );
  }

  const { email, password } = data;

  if (!email || !password) {
    throw new functions.https.HttpsError(
      "invalid-argument",
      "Email and password are required.",
    );
  }

  try {
    // 2. **Create User in Firebase Auth:** This securely creates the login credentials.
    const userRecord = await admin.auth().createUser({
      email: email,
      password: password,
      emailVerified: true, // Assuming you want to auto-verify admin-created accounts
    });

    const newUid = userRecord.uid;

    // 3. **Optional: Create basic Firestore Document (Alternative method)**
    // While FlutterFlow's second action is better for complex data,
    // you can create a simple base document here for safety.
    // await admin.firestore().collection('drivers').doc(newUid).set({
    //     uid: newUid,
    //     emailAddress: email,
    //     dateJoined: admin.firestore.FieldValue.serverTimestamp(),
    //     isActive: true,
    //     // You would fill the rest using FlutterFlow's 'Create Document' action.
    // });

    // 4. **Return the UID:** This is the critical piece of data needed by FlutterFlow.
    return { uid: newUid };
  } catch (error) {
    // Handle common Firebase Auth errors (e.g., email already exists)
    console.error("Error creating new driver user:", error);
    throw new functions.https.HttpsError(
      "internal",
      error.message || "Failed to create user.",
    );
  }
});
