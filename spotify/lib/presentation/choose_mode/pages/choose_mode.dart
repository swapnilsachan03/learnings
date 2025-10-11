import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'package:spotify/common/widgets/button/primary_button.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/pages/auth_home.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';

enum ThemeButtonType { dark, light }

class ChooseModePage extends StatelessWidget {
  const ChooseModePage({super.key});

  static Color getThemeButtonBg(
    ThemeMode currentMode,
    ThemeButtonType buttonType,
  ) {
    final isSelected =
        (buttonType == ThemeButtonType.dark && currentMode == ThemeMode.dark) ||
        (buttonType == ThemeButtonType.light && currentMode == ThemeMode.light);

    return isSelected
        ? Color(0xffffffff).withValues(alpha: 0.5)
        : Color(0xff30393C).withValues(alpha: 0.5);
  }

  @override
  Widget build(BuildContext context) {
    var themeMode = context.watch<ThemeCubit>().state;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 80, horizontal: 40),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.chooseModeBg),
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
                  "Choose mode",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontVariations: [FontVariation("wght", 700)],
                  ),
                ),
                SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(
                              ThemeMode.dark,
                            );
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getThemeButtonBg(
                                    themeMode,
                                    ThemeButtonType.dark,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.moon,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Dark",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.grey,
                            fontVariations: [FontVariation("wght", 500)],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 40),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            context.read<ThemeCubit>().updateTheme(
                              ThemeMode.light,
                            );
                          },
                          child: ClipOval(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                              child: Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: getThemeButtonBg(
                                    themeMode,
                                    ThemeButtonType.light,
                                  ),
                                ),
                                child: SvgPicture.asset(
                                  AppVectors.sun,
                                  fit: BoxFit.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Text(
                          "Light",
                          style: TextStyle(
                            fontSize: 17,
                            color: AppColors.grey,
                            fontVariations: [FontVariation("wght", 500)],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                PrimaryButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const AuthHomePage(),
                      ),
                    );
                  },
                  title: "Continue",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
