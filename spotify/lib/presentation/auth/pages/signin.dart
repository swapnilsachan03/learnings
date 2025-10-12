import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/primary_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signup.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 40)),
      bottomNavigationBar: _signupHintText(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 32),
            _usernameEmailField(context),
            SizedBox(height: 16),
            _passwordField(context),
            SizedBox(height: 36),
            PrimaryButton(onPressed: () {}, title: "Sign in"),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      "Sign in",
      style: TextStyle(
        fontVariations: [FontVariation("wght", 700)],
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _usernameEmailField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter username or email",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Enter password",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _signupHintText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Not a member?",
            style: TextStyle(
              fontVariations: [FontVariation("wght", 500)],
              fontSize: 14,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const SignUpPage(),
                ),
              );
            },
            child: Text(
              "Register now",
              style: TextStyle(
                color: Colors.blueAccent,
                fontVariations: [FontVariation("wght", 600)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
