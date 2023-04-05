import 'package:flutter/material.dart';

import 'app_color.dart';

///AppStyle is a class that holds static constants for app-wide styles, such as app bar theme, color scheme, button theme, and text theme.
class AppStyle {
  ///The appBarTheme is a constant of type AppBarTheme that defines the appearance of the app bar in the app. It specifies the background color, foreground color, and text style of the title.
  static const appBarTheme = AppBarTheme(
    backgroundColor: AppColor.darkGreen,
    foregroundColor: Colors.white,
    titleTextStyle: TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.bold,
      fontSize: 20.0,
    ),
  );

  ///colorScheme is a static constant variable of ColorScheme type, which defines the color scheme for the app.
  static const colorScheme = ColorScheme.light(
    primary: AppColor.darkGreen,
    secondary: AppColor.orange,
  );

  ///is an buttonTheme that defines the default style for buttons in the app, including button color, padding, and shape.
  static final buttonTheme = ButtonThemeData(
    buttonColor: Colors.orange,
    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
  );

  ///The textTheme constant creates a TextTheme object that sets the default text style for the app.
  static const textTheme = TextTheme(
    bodyText2: TextStyle(fontSize: 16.0), // Set the default font size
  );
}
