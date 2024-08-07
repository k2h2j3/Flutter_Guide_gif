import 'package:flutter/material.dart';
import 'package:guide_gif/const/color.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppbarSkip extends StatelessWidget implements PreferredSizeWidget {
  const AppbarSkip({super.key});

  void skipTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstRun', false);
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: BACKGROUND_COLOR,
    );
  }
}