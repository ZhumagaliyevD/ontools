import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCdeYfTPP58KvKe9Mf3eXaaSO1N9EB_Mfg",
            authDomain: "ontools-c43b9.firebaseapp.com",
            projectId: "ontools-c43b9",
            storageBucket: "ontools-c43b9.appspot.com",
            messagingSenderId: "877737337331",
            appId: "1:877737337331:web:4d3146bebe006b275cb286"));
  } else {
    await Firebase.initializeApp();
  }
}
