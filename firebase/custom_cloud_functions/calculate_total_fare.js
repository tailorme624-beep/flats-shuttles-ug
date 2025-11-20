/**
 * Firebase Cloud Function to calculate the total ride fare.
 * * The base fare covers the first 5.0 km. Any distance beyond 5.0 km
 * incurs an extra charge of UGX 3,500 per kilometer.
 */

// Initialize Firebase Admin SDK components
const functions = require("firebase-functions");
const admin = require("firebase-admin");

// IMPORTANT: Do not call admin.initializeApp() here if you are deploying
// multiple functions from the same index.js file, as it should be initialized
// only once in the main file's entry point (if not using automatic initialization).
// Assuming the environment initializes the Admin SDK automatically or it's handled elsewhere.

exports.calculateTotalFare = functions
  .region("us-central1")
  .https.onCall((data, context) => {
    // 1. Authentication Check (Optional, but recommended for production apps)
    // Ensures that the request is coming from a logged-in user.
    if (!context.auth) {
      throw new functions.https.HttpsError(
        "unauthenticated",
        "Authentication required to calculate fare.",
      );
    }

    // 2. Input Validation and Type Coercion
    const baseFare = data.baseFare;
    const distanceKm = data.distanceKm;

    if (typeof baseFare !== "number" || typeof distanceKm !== "number") {
      // Throw an error if inputs are missing or not numbers
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Both baseFare and distanceKm must be valid numbers.",
      );
    }

    // Ensure inputs are non-negative
    if (baseFare < 0 || distanceKm < 0) {
      throw new functions.https.HttpsError(
        "invalid-argument",
        "Base fare and distance cannot be negative.",
      );
    }

    // --- 3. FARE CALCULATION LOGIC (as requested) ---
    const FREE_DISTANCE_KM = 5.0;
    const SURCHARGE_PER_KM = 3500.0; // UGX 3,500 per extra kilometer
    let extraCost = 0.0;

    if (distanceKm > FREE_DISTANCE_KM) {
      // Calculate the distance traveled over the free 5km limit
      const chargeableDistance = distanceKm - FREE_DISTANCE_KM;

      // Calculate the total surcharge
      extraCost = chargeableDistance * SURCHARGE_PER_KM;
    }

    // Final calculated fare: Base Fare (covers 5km) + Extra Cost (for distance > 5km)
    const finalFare = baseFare + extraCost;

    // 4. Return the result back to FlutterFlow
    return {
      totalFare: finalFare,
      baseFare: baseFare, // Include inputs for transparency
      distanceKm: distanceKm,
      surchargeApplied: extraCost > 0, // Simple flag to indicate if extra charge was applied
    };
  });
