import 'package:flutter/material.dart';
import 'home/views/home_view.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      home: HomeView(),
    ),
  );
}
