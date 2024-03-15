import 'package:flutter/material.dart';
import 'firstpage.dart';
import 'secondpage.dart';
import 'thirdpage.dart';
import 'loginpart.dart';
import 'ocr_page.dart'; // Import the new OCR page file

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.indigo[900],
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Change the length to 5 for the new tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigo[900],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Login", // Add a new tab for the login page
              ),
              Tab(
                text: "Original\nImage",
              ),
              Tab(
                text: "Scan\nImage",
              ),
              Tab(
                text: "Draw\nImage",
              ),
              Tab(
                text: "OCR", // Add a new tab for OCR
              ),
            ],
          ),
          title: Text(
            'Make PDF',
          ),
        ),
        body: TabBarView(
          children: [
            LoginPage(), // Add the login page as a new tab
            Firstpage(),
            Secondpage(),
            thirdpage(),
            OCRPage(), // Add the OCR page as a new tab
          ],
        ),
      ),
    );
  }
}
