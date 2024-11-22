import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:new_firebase/controller/controller.dart';
import 'package:new_firebase/screen/forgot_page.dart';
import 'package:new_firebase/screen/home_screen.dart';
import 'package:new_firebase/screen/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/responsive_layout.dart';
import '../toast_util/toast.dart';
import '../util/decoration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> formKeyForLogin =
      GlobalKey<FormState>(debugLabel: "From the login_controller");
  final Controller controller = Get.put(Controller());

  String _email = '';
  String _password = '';

  void onEmailSaved(String? value) {
    if (value != null) {
      setState(() {
        _email = value;
      });
    }
  }

  void onPasswordSaved(String? value) {
    if (value != null) {
      setState(() {
        _password = value;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    formKeyForLogin.currentState?.reset();
  }

  @override
  void dispose() {
    super.dispose();
    formKeyForLogin.currentState?.dispose();
    controller.resetKey();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(
      mobileBody: mobileView(),
      desktopBody: desktopView(),
    );
  }

  Widget mobileView() {
    return Obx(
      () => Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(30),
              child: FormWidget(true),
            ),
          ),
        ),
      ),
    );
  }

  Widget desktopView() {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xffd0e5f9),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(30),
              child: FormWidget(false),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormWidget(bool isMobileView) {
    return Form(
      key: formKeyForLogin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Welcome!',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: controller.emailFieldKey,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
                  onSaved: onEmailSaved,
                  validator: (value) {
                    if (value != null &&
                        value.isNotEmpty &&
                        GetUtils.isEmail(value)) {
                      return null;
                    } else {
                      if (value != null && value.isEmpty) {
                        return 'Please Enter Email';
                      }
                      return 'please Enter Valid Email';
                    }
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.emailController,
                  decoration: emailDecoration,
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: controller.passFieldKey,
                  validator: (value) {
                    if (value != null && value.length > 3 && value.isNotEmpty) {
                      return null;
                    } else {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return 'Please enter valid password';
                    }
                  },
                  onSaved: onPasswordSaved,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isObscureText,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.passController,
                  decoration: passDecoration.copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.setIsObscureText(!controller.isObscureText);
                      },
                      icon: controller.isObscureText
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'Forgot your password?',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotPasswordScreen(),
                                ));
                          },
                          child: Text(
                            'Reset',
                            style: TextStyle(fontSize: 15, color: Colors.blue),
                          ),
                        ),
                        Container(
                          color: Colors.blue,
                          height: 0.6,
                          width: 40,
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xff86a6f8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                      ),
                    ),
                    onTap: () async {
                      formKeyForLogin.currentState!.validate();
                      SignIn(controller.emailController.text,
                          controller.passController.text);
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'You don\'t have account?',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.setIsObscureText(true);
                        controller.resetKey();
                        controller.setIsObscureForConform(true);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpPage(),
                            ));
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.blue, fontSize: 15),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  SignIn(String email, String pass) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controller.emailController.text,
          password: controller.passController.text);
      // if (controller.emailController.text.isEmpty) {
      //   showErrorToast(context, 'Please enter email');
      //   return;
      // }
      // if (!GetUtils.isEmail(controller.emailController.text)) {
      //   showErrorToast(context, 'Please enter valid email');
      //   return;
      // }
      // if (controller.passController.text.isEmpty) {
      //   showErrorToast(context, 'Please enter password');
      //   return;
      // }

      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
    } on FirebaseAuthException catch (e) {
      showErrorToast(context, '${e.message}');
    }
  }
}
