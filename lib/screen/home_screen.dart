import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../controller/controller.dart';
import 'login_page.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Controller controller = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () async {
          controller.resetKey();

          await FirebaseAuth.instance.signOut().then(
            (value) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage(),
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
