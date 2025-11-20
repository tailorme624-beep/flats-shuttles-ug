import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCYDwGjby_bSI9n8arXNhBHGkTodsBUcgM",
            authDomain: "flatsshuttles-gr3bc7.firebaseapp.com",
            projectId: "flatsshuttles-gr3bc7",
            storageBucket: "flatsshuttles-gr3bc7.firebasestorage.app",
            messagingSenderId: "287778657945",
            appId: "1:287778657945:web:b124d19dce7190009eca08",
            measurementId: "G-M4FFNJTGZT"));
  } else {
    await Firebase.initializeApp();
  }
}
