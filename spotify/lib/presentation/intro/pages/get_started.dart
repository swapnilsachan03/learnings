import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spotify/common/widgets/button/primary_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.getStartedBg),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 80),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: SvgPicture.asset(AppVectors.logo),
                ),
                Spacer(),
                Text(
                  "Enjoy listening to music\nanywhere you go",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontVariations: [FontVariation("wght", 700)],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Experience unlimited music streaming with access to millions of songs from various artists and genres. No credit card required.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 16,
                    fontVariations: [FontVariation("wght", 500)],
                  ),
                ),
                SizedBox(height: 20),
                PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ChooseModePage();
                        },
                      ),
                    );
                  },
                  title: "Get started",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
