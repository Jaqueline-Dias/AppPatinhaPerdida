import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'src/app_patinha_perdida.dart';

void main() {
  runZonedGuarded(() async {
    const FirebaseOptions android = FirebaseOptions(
        apiKey: "AIzaSyAAJ1H_GCVxj5SBbLJqWvb4206Zer0wSZQ",
        appId: "1:1792714838:android:904e91a693a8fa32eb33f7",
        messagingSenderId: "1792714838",
        projectId: "app-patinha-perdida-e5e1a",
        storageBucket: "app-patinha-perdida-e5e1a.appspot.com");

    const FirebaseOptions ios = FirebaseOptions(
        apiKey: "AIzaSyDzjRISrBDlu7zNOtfkq2e0WEfmEpZiJV0",
        appId: "1:1792714838:ios:9e4232a54ba9eac9eb33f7",
        messagingSenderId: "1792714838",
        projectId: "app-patinha-perdida-e5e1a",
        storageBucket: "app-patinha-perdida-e5e1a.appspot.com");

    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: Platform.isAndroid ? android : ios);

    runApp(
      const PatinhaPerdidaApp(),
    );
  }, (error, stack) {
    log('Erro não tratado', error: error, stackTrace: stack);
    throw error;
  });
}
