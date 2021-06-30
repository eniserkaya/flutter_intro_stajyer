import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intro/screen/main_screen.dart';

void main() {
  runApp(EgitimApp());
}
class EgitimApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eğitim Uygulaması',
      home: MainScreen(),
    );
  }
}
