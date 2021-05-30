import 'package:flutter/material.dart';
import "package:prov/screens/home.dart";
import 'package:provider/provider.dart';
import "package:prov/provider/user_notifier.dart";
import "package:prov/api/api.dart";

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserNotifier()),
      FutureProvider(
          create: (_) => getProfileUserName(), initialData: "Loading Name..."),
      StreamProvider(create: (_) => getSessionTime(), initialData: 0)
    ],
    child: MyApp(),
  ));
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
