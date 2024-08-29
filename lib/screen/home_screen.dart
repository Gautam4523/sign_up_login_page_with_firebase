import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          FirebaseAuth.instance.signOut().then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
          );
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xffcf0b92),
                Color(0xff9038c9),
                Color(0xff5e4dee),
              ],
            ),
          ),
          child: Center(
            child: Text(
              'Lgout',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
