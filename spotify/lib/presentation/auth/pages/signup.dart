import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spotify/common/widgets/appbar/app_bar.dart';
import 'package:spotify/common/widgets/button/primary_button.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppBar(title: SvgPicture.asset(AppVectors.logo, height: 40)),
      bottomNavigationBar: _signinHintText(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 32),
            _fullNameField(context),
            SizedBox(height: 16),
            _emailField(context),
            SizedBox(height: 16),
            _passwordField(context),
            SizedBox(height: 36),
            PrimaryButton(onPressed: () {}, title: "Create Account"),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return Text(
      "Register",
      style: TextStyle(
        fontVariations: [FontVariation("wght", 700)],
        fontSize: 24,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _fullNameField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your full name",
      ).applyDefaults(Theme.of(context).inputDecorationTheme),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Your email",
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

  Widget _signinHintText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
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
                  builder: (BuildContext context) => const SignInPage(),
                ),
              );
            },
            child: Text(
              "Sign in",
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
