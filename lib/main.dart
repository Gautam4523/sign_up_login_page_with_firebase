import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_firebase/screen/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCcbu1rFC8QzBA9AyIYQX6CcZuWH-Novk4",
      appId: "1:75720883039:android:f82e817c048084c24cd4ea",
      messagingSenderId: "75720883039",
      projectId: "new-firebase-a1646",
      storageBucket: "new-firebase-a1646.appspot.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}
