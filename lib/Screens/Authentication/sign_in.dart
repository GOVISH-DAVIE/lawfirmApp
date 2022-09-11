import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hrm_employee/Screens/Authentication/sign_up.dart';
import 'package:hrm_employee/state/auth.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../GlobalComponents/button_global.dart';
import '../../constant.dart';
import '../Home/home_screen.dart';
import 'forgot_password.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController controller = TextEditingController();
  bool isChecked = false;

  TextEditingController _controllerUser = TextEditingController();
  TextEditingController _controllerPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<Auth>(
      builder: (context, authController, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Sign In',
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Sign In now to begin an amazing journey',
                style: kTextStyle.copyWith(color: Colors.white),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20.0),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20.0,
                    ),
                    SizedBox(
                      height: 60.0,
                      child: AppTextField(
                        textFieldType: TextFieldType.PHONE,
                        controller: _controllerUser,
                        enabled: true,
                        decoration: InputDecoration(
                          labelText: 'User Name',
                          hintText: 'User',
                          labelStyle: kTextStyle,
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                          border: const OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    AppTextField(
                      controller: _controllerPass,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: kTextStyle,
                        hintText: 'Enter password',
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: isChecked,
                            activeColor: kMainColor,
                            thumbColor: kGreyTextColor,
                            onChanged: (bool value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                        ),
                        Text(
                          'Save Me',
                          style: kTextStyle,
                        ),
                        const Spacer(),
                        Text(
                          'Forgot Password?',
                          style: kTextStyle,
                        ).onTap(() {
                          const ForgotPassword().launch(context);
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonGlobal(
                      buttontext: 'Sign In',
                      buttonDecoration:
                          kButtonDecoration.copyWith(color: kMainColor),
                      onPressed: () {
                        authController
                            .login(
                                pass: _controllerPass.text,
                                username: _controllerUser.text)
                            .then((value) {
                          const HomeScreen().launch(context);
                        });
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Don\'t have an account? ',
                            style: kTextStyle.copyWith(
                              color: kGreyTextColor,
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              'Sign Up',
                              style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold,
                                color: kMainColor,
                              ),
                            ).onTap(() {
                              const SignUp().launch(context);
                            }),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
