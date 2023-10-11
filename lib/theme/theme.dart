import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'theme.tailor.dart';

@tailor
class _$BeautyTheme {
  static List<Color> mainColor = const [
    Color(0xFF633581),
    Color(0xFF633581),
  ];
  static List<Color> pointColor = const [
    Color(0xFFFF1A8D),
    Color(0xFFFF1A8D),
  ];
  static List<Color> whiteColor = const [
    Color(0xFFFFFFFF),
    Color(0xFF000000),
  ];
  static List<Color> transGray = const [
    Color.fromARGB(190, 255, 255, 255),
    Color.fromARGB(190, 255, 255, 255),
  ];
  static List<Color> basicBlack = const [
    Color(0xFF333333),
    Color(0xFF333333),
  ];
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Image.asset(
                  "assets/image/profileUser.png",
                  width: 60,
                  height: 60,
                  fit: BoxFit.contain,
                ),
                Image.asset(
                  "assets/image/camerapng.png",
                  width: 25,
                  height: 25,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const Text(
              "임수진",
              style: TextStyle(
                height: 2,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
