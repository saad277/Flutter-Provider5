import 'package:flutter/material.dart';
import "package:prov/screens/home.dart";
import 'package:provider/provider.dart';
import "package:prov/provider/user_notifier.dart";

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserNotifier()),]));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.green[400]),
          primaryColor: Colors.blue[600],
          backgroundColor: Colors.white),
      home: Home(),
    );
  }
}
