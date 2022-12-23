import 'package:flutter/material.dart';
import 'package:semifinal/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Semi Final",
    theme: ThemeData(
      primarySwatch: Colors.amber
    ),
    home: const HomePage(),
  ));
}