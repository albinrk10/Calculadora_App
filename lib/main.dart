import 'package:flutter/material.dart';

import 'config/config.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme(selectedColor: 2).theme(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routerConfig: appRouter,
    );
  }
}