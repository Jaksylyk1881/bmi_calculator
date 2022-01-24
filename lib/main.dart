import 'package:flutter/material.dart';
import 'screens/input_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
          appBarTheme: AppBarTheme(color: Color(0xff0A0D22),),
          scaffoldBackgroundColor: Color(0xff0A0D22)
      ),
      home: InputPage(),
    );
  }
}
