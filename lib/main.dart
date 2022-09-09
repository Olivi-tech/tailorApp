import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tailor/data_check.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyAqzjPgA8ErwTvUqwHHLWWLUcxaC5X7XAM",
            authDomain: "tailor-app-48212.firebaseapp.com",
            projectId: "tailor-app-48212",
            storageBucket: "tailor-app-48212.appspot.com",
            messagingSenderId: "32946753318",
            appId: "1:32946753318:web:e019b78f5d1b6ac5393be7",
            measurementId: "G-3ZF02BKDCV"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(MaterialApp(
      home: const DataCheck(),
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      )));
}
/// just checking via github///
