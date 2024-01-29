import 'package:blood_donation/utility/const.dart';
import 'package:blood_donation/views/bdsplash.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        themeMode: ThemeMode.light,
        darkTheme: ThemeData(textTheme: TextTheme(),
          colorScheme: ColorScheme.fromSeed(seedColor: bdprimaryclr,brightness: Brightness.dark)
        ),
        theme: ThemeData(
        
          colorScheme: ColorScheme.fromSeed(seedColor: bdprimaryclr,),
          useMaterial3: true,
        ),
        home: BdsplashScreen());
  }
}
