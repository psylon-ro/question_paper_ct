import 'package:flutter/material.dart';
import 'package:question_paper_ct/Screens/opening_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dynamic TextFormFields',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Open(),
      debugShowCheckedModeBanner: false,
    );
  }
}
