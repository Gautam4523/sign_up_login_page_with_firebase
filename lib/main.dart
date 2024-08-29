import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_firebase/screen/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCcbu1rFC8QzBA9AyIYQX6CcZuWH-Novk4",
      appId: "1:75720883039:android:f82e817c048084c24cd4ea",
      messagingSenderId: "75720883039",
      projectId: "new-firebase-a1646",
      storageBucket: "new-firebase-a1646.appspot.com",
    ),
  );
  // Dependencies.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]) //todo: Need to restrict orientation for ios app
      .then((_) {
    runApp(
        const Directionality(textDirection: TextDirection.rtl, child: MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
