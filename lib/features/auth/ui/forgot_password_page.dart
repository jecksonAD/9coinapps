import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/services/auth.dart';
import 'package:ninecoin/features/auth/ui/login_page.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:ninecoin/utilities/dialogs/new_password_reset.dart';
import 'package:ninecoin/utilities/dialogs/password_reset.dart';

import '../../../utilities/dialogs/error_dialoge.dart';

class ForgotPasswordPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (context) => ForgotPasswordPage());
  }

  ForgotPasswordPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: CoinColors.black12,
            centerTitle: true,
            title: Text(
              "Forgot Password",
              style: CoinTextStyle.title1,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Reset Your Password",
                      style: CoinTextStyle.title1.copyWith(
                        color: CoinColors.orange,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        "Please enter your email address.You will receive a code to create a new  password via email.",
                        style: CoinTextStyle.title4,
                        textAlign: TextAlign.center),
                    const SizedBox(height: 20),
                    TextFormField(
                        controller: passController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "Your email address",
                        )),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          if (await showResetPasswordDialog(context)) {
                            forgetPass(email: passController.text)
                                .then((value) async {
                              if (await showNewPasswordResetDialog(
                                  context, false)) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginPage(
                                              isNewUser: false,
                                            )));
                              }
                            }).catchError((err) async {
                              await showErrorDialog(context, "Error", "$err");
                            });
                            // Navigator.push(context, LoginPage.route());
                          }
                        }
                        // }
                      },
                      child: Text(
                        "Reset Password",
                        style: CoinTextStyle.title2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
