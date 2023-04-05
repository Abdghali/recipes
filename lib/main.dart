import 'package:flutter/material.dart';
import 'package:recipes/views/home_page.dart';

import 'utils/app_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: AppColor.darkGreen, // Set the primary color
        accentColor: AppColor.orange, // Set the accent color
        backgroundColor: AppColor.saddleBrown, // Set the background color
        fontFamily: 'Roboto', // Set the default font family
        textTheme: const TextTheme(
          bodyText2: TextStyle(fontSize: 16.0), // Set the default font size
        ),
        // Set background color to dark green
      ),
      home: HomePage(),
    );
  }
}
