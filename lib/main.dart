import 'package:flutter/material.dart';
import 'package:unit_converter/MyHomePage.dart';
import 'package:unit_converter/cal_properties/Length.dart';
import 'package:unit_converter/cal_properties/age.dart';
import 'package:unit_converter/responsive/dimensions.dart';
import 'package:unit_converter/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
        fontFamily: "Google Sans Text, Roboto, sans-serif",
      ),
      home: Length(),
    );
  }
}


