import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forecast/view/ForecastUI.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:forecast/view/SignUp.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUp(),
    );
  }
}
