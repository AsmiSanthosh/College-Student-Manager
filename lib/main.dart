import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sbc_college_app/screens/menu.dart';

void main()
{
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MenuSystem(),
    );
  }
}
