import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tailor/account_creations/login_provider.dart';
import 'package:tailor/account_creations/sign_up.dart';
import 'package:tailor/screens/dashboard.dart';
import 'package:tailor/screens/phone_verification.dart';
import 'package:tailor/utils/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static final _formKey = GlobalKey<FormState>();
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final TextEditingController _emailController;
  late final TextEditingController _pwdController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwdController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    print(height);
    print(width);
    // final isKeyBoard = MediaQuery.of(context).viewInsets.bottom != 0;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(children: <Widget>[
          SizedBox(
            width: width,
            height: height * 0.4,
            child: const Image(
              fit: BoxFit.fill,
              image: AssetImage(
                'assets/images/logo.png',
              ),
            ),
          ),
          Form(
            key: Login._formKey,
            child: Column(
              children: [
                CommonWidgets.customTextFormField(
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.black),
                    // validator: (value) {
                    //   if (value == null || value.isEmpty) {
                    //     return 'Email Can\'t Be Empty';
                    //   } else if (!value.contains('@') || !value.contains('.')) {
                    //     return 'put valid email';
                    //   }
                    //   return null;
                    // },
                    controller: _emailController,
                    textInputType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.email_outlined)),
                Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: CommonWidgets.customTextFormField(
                        hintText: 'Password',
                        obscureText: true,
                        //    maxLength: 18,
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Password Can\'t Be Empty';
                        //   }
                        //   return null;
                        // },
                        controller: _pwdController,
                        prefixIcon: const Icon(Icons.password),
                        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                        textInputType: TextInputType.visiblePassword)),
                const Padding(
                  padding: EdgeInsets.only(left: 190, top: 5),
                  child: Text('Forgot Password',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                          color: Colors.blue)),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              children: [
                CommonWidgets.customBtn(
                    onPressed: () async {
                      if (!_emailController.text.contains('@') ||
                          !_emailController.text.contains('.') ||
                          _emailController.text.isEmpty ||
                          _pwdController.text.isEmpty) {
                        Fluttertoast.showToast(
                          msg: !_emailController.text.contains('@') ||
                                  !_emailController.text.contains('.') ||
                                  _emailController.text.isEmpty
                              ? 'Invalid or Empty Email'
                              : 'Password can\'t be Empty',
                          backgroundColor: Colors.black,
                          // fontSize: 16,
                          // textColor: Colors.white,
                          // toastLength: Toast.LENGTH_SHORT,
                          // gravity: ToastGravity.CENTER_RIGHT,
                        );
                      } else {
                        final status =
                            await LoginProvider.signInWithEmailAndPWD(
                                email: _emailController.text,
                                password: _pwdController.text);
                        LoginProvider.customSnackBar(
                            status: status, context: context);
                        if (status == 'Signed In Successfully') {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashBoard()));
                        } else {
                          return;
                        }
                      }
                      // if (Login._formKey.currentState!.validate()) {
                      //   final status =
                      //       await LoginProvider.signInWithEmailAndPWD(
                      //           email: _emailController.text,
                      //           password: _pwdController.text);
                      //   LoginProvider.customSnackBar(
                      //       status: status, context: context);
                      //   if (status == 'Signed In Successfully') {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => const DashBoard()));
                      //   } else {
                      //     return;
                      //   }
                      // }
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const DashBoard()));
                    },
                    name: 'Login',
                    height: height * 0.06,
                    width: width),
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: CommonWidgets.customBtn(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                      name: 'Register With Email',
                      height: height * 0.06,
                      width: width),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Text(
              'Continue With Social Accounts',
              style: SignUp.textStyle,
              textScaleFactor: 1.5,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, left: 50),
            child: Row(
              children: [
                CircleAvatar(
                    backgroundColor: Colors.green,
                    radius: 25,
                    child: IconButton(
                        onPressed: () async {
                          final status = await LoginProvider.signInWithGoogle();
                          LoginProvider.customSnackBar(
                              status: status, context: context);
                        },
                        icon: const Icon(FontAwesomeIcons.google,
                            color: Colors.white))),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: IconButton(
                    onPressed: () async {
                      final status = await LoginProvider.signInWithFacebook(
                          context: context);
                      LoginProvider.customSnackBar(
                          status: status, context: context);
                    },
                    iconSize: 50,
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.green,
                      size: 50,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                  child: IconButton(
                      onPressed: () async {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const PhoneNumberAuth()));
                      },
                      icon: const Icon(FontAwesomeIcons.phone,
                          color: Colors.white)),
                ),
              ],
            ),
          ),
        ]),
      )),
    ));
  }
}
