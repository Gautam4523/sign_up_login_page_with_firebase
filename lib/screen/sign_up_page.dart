import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_firebase/controller/controller.dart';
import 'package:new_firebase/screen/home_screen.dart';
import 'package:new_firebase/screen/login_page.dart';
import 'package:new_firebase/screen/sign_up_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../common/responsive_layout.dart';
import '../toast_util/toast.dart';
import '../util/decoration.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: "From the signUp_controller");
  final Controller controller = Get.put(Controller());

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    formKey.currentState?.reset();
  }

  void resetKey() {
    controller.emailFieldKey.currentState?.reset();
    controller.passFieldKey.currentState?.reset();
    controller.signUpConformPassFieldKey.currentState?.reset();
    controller.signUpPassFieldKey.currentState?.reset();
    controller.signUpEmailFieldKey.currentState?.reset();
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
              padding: EdgeInsets.all(30),
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
        backgroundColor: Color(0xffd0e5f9),
        body: Center(
          child: SingleChildScrollView(
            child: Container(
              height: 500,
              width: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(30),
              child: FormWidget(false),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormWidget(bool isMobileView) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'SignUp with email',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  key: controller.signUpEmailFieldKey,
                  textInputAction: TextInputAction.next,
                  autofocus: true,
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
                  key: controller.signUpPassFieldKey,
                  validator: (value) {
                    if (value != null && value.length > 3 && value.isNotEmpty) {
                      return null;
                    } else {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                      return 'Please enter strong password';
                    }
                  },
                  autofocus: true,
                  textInputAction: TextInputAction.next,
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
                TextFormField(
                  key: controller.signUpConformPassFieldKey,
                  validator: (value) {
                    if (value != null &&
                        value.length > 3 &&
                        value.isNotEmpty &&
                        value == controller.passController.text) {
                      return null;
                    } else {
                      if (value!.isEmpty) {
                        return 'Please enter conformPassword';
                      }
                      return 'Password does\'t match';
                    }
                  },
                  autofocus: true,
                  textInputAction: TextInputAction.done,
                  obscureText: controller.isObscureForConform,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: controller.conformPassController,
                  decoration: conformPassDecoration.copyWith(
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.setIsObscureForConform(
                            !controller.isObscureForConform);
                      },
                      icon: controller.isObscureForConform
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff85a5f8),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                  ),
                  onTap: () {
                    formKey.currentState!.validate();
                    if (controller.emailController.text.isEmpty) {
                      showErrorToast(context, 'Please enter email');
                      return;
                    }
                    if (!GetUtils.isEmail(controller.emailController.text)) {
                      showErrorToast(context, 'Please enter valid email');
                      return;
                    }
                    if (controller.passController.text.isEmpty) {
                      showErrorToast(context, 'Please enter password');
                      return;
                    }

                    if (controller.conformPassController.text.isEmpty) {
                      showErrorToast(context, 'Please enter ConformPassword');
                      return;
                    }
                    if (!(controller.passController.text ==
                        controller.conformPassController.text)) {
                      showErrorToast(context, 'Password does\'t match');
                    }

                    if (controller.passController.text ==
                            controller.conformPassController.text &&
                        controller.passController.text.length < 7) {
                      showErrorToast(context, 'Week password');
                      return;
                    }
                    if (controller.emailController.text.isNotEmpty &&
                        GetUtils.isEmail(controller.emailController.text) &&
                        controller.passController.text ==
                            controller.conformPassController.text) {
                      showSuccessToast(context, 'Account created successfully');

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: controller.emailController.text,
                              password: controller.passController.text)
                          .then((value) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ));
                      });
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      'You already have an account?',
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        resetKey();
                        controller.setIsObscureText(true);
                        controller.setIsObscureForConform(true);
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Sign In',
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
}
