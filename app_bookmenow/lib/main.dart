import 'package:app_bookmenow/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "BookMeNow",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      // home: const HomePage(),
      home: HomePage(),
    ),
  );
}
