import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home_screen.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final GlobalKey<FormState> formKey =
      GlobalKey<FormState>(debugLabel: "From the login_controller");

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController conformPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign up with email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 250,
                  child: TextFormField(
                    onChanged: (value) {},
                    controller: emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter the Email'),
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 50,
                  width: 250,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.isEmpty) {
                        FocusScope.of(context).previousFocus();
                      }
                    },
                    controller: passwordController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.grey)),
                        labelText: 'Password',
                        labelStyle: TextStyle(color: Colors.white),
                        hintText: 'Enter the Password'),
                    textInputAction: TextInputAction.next,
                    autofocus: true,
                  ),
                ),
                SizedBox(height: 10),
                // Container(
                //   height: 50,
                //   width: 250,
                //   child: TextFormField(
                //     onChanged: (value) {
                //       if (value.isEmpty) {
                //         FocusScope.of(context).previousFocus();
                //       }
                //     },
                //     controller: conformPasswordController,
                //     decoration: InputDecoration(
                //       border: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //       ),
                //       enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20),
                //         borderSide: BorderSide(color: Colors.white),
                //       ),
                //       focusedBorder: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(20),
                //           borderSide: BorderSide(color: Colors.grey)),
                //       labelText: 'Conform Password',
                //       labelStyle: TextStyle(color: Colors.white),
                //     ),
                //     textInputAction: TextInputAction.next,
                //     autofocus: true,
                //   ),
                // ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: emailController.text,
                            password: passwordController.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(),
                          ));
                    }).onError(
                      (error, stackTrace) {
                        print('${error.toString()}');
                      },
                    );
                  },
                  child: Container(
                    height: 50,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),
                    child: Center(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
// import 'dart:html';
//
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:web_client/theme/color/colors.dart';
// import 'package:get/get.dart';
// import 'package:web_client/pages/signin/controller/wc_log_in_page_controller.dart';
// import 'package:web_client/util/text_utils/normal_text.dart';
//
// import '../../../component/wc_decorations.dart';
// import '../../../constant/app_images.dart';
// import '../../../constant/local_storage_string.dart';
// import '../../../constant/string_utils.dart';
// import '../../../responsive/wc_responsive_layout.dart';
// import '../../../router/wc_router.dart';
// import '../../../util/button_utils/button.dart';
// import '../../resetPassword/screens/wc_reset_password_page.dart';
// import '../../signup/screens/wc_sign_up_page.dart';
//
// class LogInPage extends StatefulWidget {
//   const LogInPage({Key? key}) : super(key: key);
//
//   @override
//   State<LogInPage> createState() => _LogInPageState();
// }
//
// class _LogInPageState extends State<LogInPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   final GlobalKey<FormState> formKey =
//   GlobalKey<FormState>(debugLabel: "From the login_controller");
//
//   final LogInPageController controller = Get.isRegistered<LogInPageController>()
//       ? Get.find<LogInPageController>()
//       : Get.put(LogInPageController());
//
//   bool _isEmailFilled = false, _isPasswordFilled = false;
//
//   String _email = '';
//   String _password = '';
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   void onEmailSaved(String? value) {
//     if (value != null) {
//       setState(() {
//         _email = value;
//       });
//     }
//   }
//
//   @override
//   void dispose() {
//     formKey.currentState?.dispose();
//     super.dispose();
//   }
//
//   void onPasswordSaved(String? value) {
//     if (value != null) {
//       setState(() {
//         _password = value;
//       });
//     }
//   }
//
//   Future<void> onAuthPressed(BuildContext context, bool isMobileView) async {
//     if (formKey.currentState!.validate()) {
//       formKey.currentState?.save();
//       controller.signInAuthWithEmailPassword(
//           _email, _password, context, isMobileView);
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ResponsiveLayout(
//       mobileBody: mobileView(),
//       tabletBody: tabletDesktopView(),
//       desktopBody: tabletDesktopView(),
//     );
//   }
//
//   Widget mobileView() {
//     return WillPopScope(
//         onWillPop: () async => true,
//         child: Scaffold(
//           backgroundColor: Colors.white,
//           body: SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     Image.asset(
//                       appThemeIcon,
//                       height: 184,
//                     ),
//                     const SizedBox(
//                       height: 30,
//                     ),
//                     /*Image.asset(
//                       appIcon,
//                       height: 55,
//                     ),*/
//                     Image.network(
//                       window.localStorage[LocalStorageString.hostLogo] ?? "",
//                       // width: 200,
//                       height: 60,
//                       // fit: BoxFit.contain,
//                     ),
//                     const SizedBox(
//                       height: 31,
//                     ),
//                     Container(
//                       decoration:
//                       customContainerDecorationAllSideCircularWithBorder(
//                           kLightRedColorShade, kLightRedColorShade),
//                       padding: const EdgeInsets.all(8),
//                       margin: const EdgeInsets.only(
//                           left: 20, right: 20, top: 10, bottom: 30),
//                       child: const NormalText(
//                           maxLine: 10,
//                           textColor: kWarningIconColor,
//                           textSize: 14,
//                           textFontWeight: FontWeight.w600,
//                           text: mobileBrowserErrorMessage),
//                     )
//                     /*const NormalText(
//                       text: welcome,
//                       textSize: 24,
//                       textFontWeight: FontWeight.w600,
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 24, horizontal: 17),
//                       child: formWidget(true),
//                     )*/
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
//
//   Widget tabletDesktopView() {
//     return WillPopScope(
//         onWillPop: () async => true,
//         child: Scaffold(
//           backgroundColor: kPrimaryHbk,
//           body: SafeArea(
//             child: Center(
//               child: SingleChildScrollView(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width,
//                   margin: EdgeInsets.only(
//                     bottom: MediaQuery.of(context).size.height * 0.13,
//                     top: MediaQuery.of(context).size.height * 0.13,
//                   ), // 122
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Image.network(
//                         window.localStorage[LocalStorageString.hostLogo] ?? "",
//                         // width: 200,
//                         height: 60,
//                         // fit: BoxFit.contain,
//                       ),
//                       const SizedBox(
//                         height: 58,
//                       ),
//                       Container(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 41, vertical: 48),
//                         width: 424,
//                         decoration: containerCurvedBorderDecoration,
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             const NormalText(
//                               text: welcome,
//                               textSize: 24,
//                               textFontWeight: FontWeight.w600,
//                             ),
//                             const SizedBox(
//                               height: 8.0,
//                             ),
//                             const NormalText(
//                               text: todayIsFullOfOpportunities,
//                               textColor: kSecondaryGray900,
//                               textSize: 14,
//                             ),
//                             const SizedBox(
//                               height: 41,
//                             ),
//                             formWidget(false)
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ));
//   }
//
//   Widget formWidget(bool isMobileView) {
//     return Form(
//       key: formKey,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           TextFormField(
//             onChanged: (_) {
//               setState(() {});
//             },
//             controller: emailController,
//             decoration: emailDecoration,
//             textInputAction: TextInputAction.next,
//             autofocus: true,
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             onSaved: onEmailSaved,
//             validator: (value) {
//               if (value != null &&
//                   value.isNotEmpty &&
//                   GetUtils.isEmail(value)) {
//                 _isEmailFilled = true;
//
//                 return null;
//               } else {
//                 _isEmailFilled = false;
//
//                 if (value != null && value.isEmpty) {
//                   return pleaseEnterEmail;
//                 }
//
//                 return pleaseEnterValidEmail;
//               }
//             },
//           ),
//           const SizedBox(
//             height: 18.0,
//           ),
//           Obx(() => TextFormField(
//             onChanged: (val) {
//               setState(() {});
//             },
//             controller: passwordController,
//             obscureText: !controller.isPasswordHidden,
//             decoration: InputDecoration(
//                 label: const NormalText(
//                   text: password,
//                   textColor: kSecondaryGray900,
//                   textSize: 14,
//                   textFontWeight: FontWeight.w600,
//                 ),
//                 border: const OutlineInputBorder(
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//                 errorBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: errorTextFieldBorderColor),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: textFieldBorderColor),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8.0),
//                   ),
//                 ),
//                 enabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: textFieldBorderColor),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8),
//                   ),
//                 ),
//                 disabledBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: textFieldBorderColor),
//                   borderRadius: BorderRadius.all(
//                     Radius.circular(8),
//                   ),
//                 ),
//                 suffixIcon: IconButton(
//                   icon: Icon(
//                     controller.isPasswordHidden
//                         ? Icons.visibility_outlined
//                         : Icons.visibility_off_outlined,
//                     color: kEffectsShadow,
//                     size: 20,
//                   ),
//                   onPressed: () {
//                     controller.updateIsPasswordHidden();
//                   },
//                 )),
//             autovalidateMode: AutovalidateMode.onUserInteraction,
//             onSaved: onPasswordSaved,
//             textInputAction: TextInputAction.done,
//             validator: (value) {
//               if (value != null && value.isNotEmpty && value.length > 3) {
//                 //todo: need to check for validation.
//                 _isPasswordFilled = true;
//
//                 return null;
//               } else {
//                 _isPasswordFilled = false;
//
//                 if (value != null && value.isEmpty) {
//                   return pleaseEnterThePassword;
//                 }
//
//                 return pleaseEnterTheValidPassword;
//               }
//             },
//           )),
//           const SizedBox(
//             height: 18.0,
//           ),
//           Row(
//             mainAxisAlignment: isMobileView
//                 ? MainAxisAlignment.center
//                 : MainAxisAlignment.start,
//             children: [
//               const NormalText(
//                 text: forgotYourPassword,
//                 textSize: 14,
//                 textFontWeight: FontWeight.w400,
//               ),
//               const SizedBox(
//                 width: 3,
//               ),
//               InkWell(
//                 onTap: () async {
//                   if (isMobileView) {
//                     Get.to(const ResetPasswordPage(),
//                         transition: Transition.leftToRight);
//                   } else {
//                     context.go(resetPasswordRoutePath);
//                   }
//                 },
//                 child: Text(
//                   reset,
//                   style: GoogleFonts.inter(
//                       color: kEffectsBlackOpc,
//                       decoration: TextDecoration.underline,
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(
//             height: 24.0,
//           ),
//           Button(
//             buttonText: signIn,
//             isButtonEnabled: _isEmailFilled && _isPasswordFilled,
//             onPressed: () => onAuthPressed(context, isMobileView),
//           ),
//           const SizedBox(
//             height: 15.0,
//           ),
//           /*Row(
//             mainAxisAlignment: isMobileView
//                 ? MainAxisAlignment.center
//                 : MainAxisAlignment.start,
//             children: [
//               const NormalText(
//                 text: alreadyHaveALogistiqAccount,
//                 textSize: 14,
//                 textFontWeight: FontWeight.w400,
//               ),
//               const SizedBox(
//                 width: 3,
//               ),
//               InkWell(
//                 onTap: () async {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SignUpPage()),
//                   );
//                 },
//                 child: Text(
//                   signUp,
//                   style: GoogleFonts.inter(
//                       color: kEffectsBlackOpc,
//                       decoration: TextDecoration.underline,
//                       fontSize: 14.0,
//                       fontWeight: FontWeight.w400),
//                 ),
//               ),
//             ],
//           ),*/
//         ],
//       ),
//     );
//   }
// }
