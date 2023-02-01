import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home.dart';

void main() {
  runApp(MainPage());
}



class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
     theme: ThemeData(primaryColor: Colors.white),
     
     
      
    );
  }
}