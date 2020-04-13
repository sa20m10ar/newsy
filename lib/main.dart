import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/home.dart';
import 'pages/onBoarding.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool seen = prefs.getBool('seen');

  Widget _screen;
  if(seen == null || seen == false){
    _screen = OnBoarding();
  }else{
    _screen = HomePage();
  }

  runApp(MyApp(_screen));
}

class MyApp extends StatelessWidget {
   final Widget _screen ;

  MyApp(this._screen);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Newsy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
              ),
      home: this._screen,
    );
  }
}

