import 'package:flutter/material.dart';
import 'package:ninecoin/colors/colors.dart';
import 'package:ninecoin/features/auth/ui/forgot_password_page.dart';
import 'package:ninecoin/features/auth/ui/signup_page.dart';
import 'package:ninecoin/features/home/ui/home_page.dart';
import 'package:ninecoin/features/home/ui/home_view.dart';
import 'package:ninecoin/typography/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utilities/dialogs/error_dialoge.dart';
import '../../../utilities/dialogs/successful_create.dart';
import '../../../utilities/dialogs/successful_login.dart';
import '../services/auth.dart';

class LoginPage extends StatefulWidget {
  final bool isNewUser;
  static Route route(bool isNewUser) {
    return MaterialPageRoute(
        builder: (context) => LoginPage(
              isNewUser: isNewUser,
            ));
  }

  const LoginPage({Key? key, required this.isNewUser}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void navigatePage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!widget.isNewUser) {
      if (prefs.containsKey('userId')) {
        // ignore: use_build_context_synchronously
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {}
    } else {}
  }

  @override
  void initState() {
    navigatePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool isLoading = false;
    final _formKey = GlobalKey<FormState>();

    return Container(
      color: CoinColors.fullBlack,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: CoinColors.black,
          body: Align(
            alignment: Alignment.bottomCenter,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Image(
                          height: 160,
                          image: AssetImage("assets/logos/login-logo.png")),
                      const SizedBox(height: 24),
                      TextFormField(
                        controller: email,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: CoinColors.black12,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: "Email",
                          hintStyle: TextStyle(
                              color: CoinColors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                          suffixIcon: Icon(
                            Icons.email_rounded,
                            color: CoinColors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: password,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: CoinColors.black12,
                          contentPadding: EdgeInsets.all(10.0),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: CoinColors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                          suffixIcon: Icon(
                            Icons.lock,
                            color: CoinColors.orange,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            isLoading = true;
                          });
                          loginUser(email: email.text, password: password.text)
                              .then((value) async {
                            setState(() {
                              isLoading = false;
                            });
                            if (await showSuccessfulLoginAccountDialog(
                                context)) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const HomePage()));
                            } else {}
                          }).catchError((err) async {
                            setState(() {
                              isLoading = false;
                            });
                            await showErrorDialog(context, "Error", "$err");
                          });
                        },
                        child: isLoading
                            ? const CircularProgressIndicator()
                            : Text(
                                "Login",
                                style: CoinTextStyle.title2,
                              ),
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(context, ForgotPasswordPage.route());
                          },
                          child: Text(
                            "Forgot Password",
                            style: CoinTextStyle.title2,
                          ),
                        ),
                      ),
                      const SizedBox(height: 50),
                      Center(
                        child: Text("We Are From",
                            style: CoinTextStyle.title3
                                .copyWith(color: Colors.grey)),
                      ),
                      const Center(
                        child: Text(
                          "Color Ins Salon",
                          style: TextStyle(
                            fontFamily: 'Vollkorn SemiBold',
                            color: CoinColors.blue26,
                            fontWeight: FontWeight.w400,
                            fontSize: 25,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Flexible(
                            child: Text(
                              "Don't have an account?",
                              style: CoinTextStyle.title2,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(context, SignupPage.route());
                            },
                            child: Text("Sign Up",
                                style: CoinTextStyle.orangeTitle2),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
