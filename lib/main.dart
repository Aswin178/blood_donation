import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/views/bdsplash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyA32Ue2q7nzqGKWccBRm1Ez27bmuTa-tvA",
          appId: "1:14323368883:android:e08e9e5dc7f4584d9741c6",
          messagingSenderId: "",
          projectId: "vitalflow-50fef"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(
            textTheme: TextTheme(),
            colorScheme: ColorScheme.fromSeed(
                seedColor: bdprimaryclr, brightness: Brightness.dark)),
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: bdprimaryclr,
          ),
          useMaterial3: true,
        ),
        home: BdsplashScreen());
  }
}
