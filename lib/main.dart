import 'package:flutter/material.dart';
import 'package:forms_validation/themes/app_themes.dart';
import 'package:forms_validation/views/home.view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: AppTheme.lightTheme,
      home: const HomeView(),
    );
  }
}
