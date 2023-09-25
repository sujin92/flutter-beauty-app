import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';

class StyleMenu extends StatelessWidget {
  const StyleMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: 90,
            height: 30,
            decoration: BoxDecoration(
              color: context.beautyTheme.mainColor,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              "메뉴",
              style: TextStyle(
                  fontSize: 18,
                  color: context.beautyTheme.whiteColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        DefaultTextStyle(
          style: TextStyle(
            fontSize: 16,
            color: context.beautyTheme.basicBlack,
            height: 2,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "커트",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 2,
                  height: 2,
                ),
                const Row(
                  children: [
                    Text("남성컷"),
                    Text("22,000원"),
                  ],
                ),
                const Row(
                  children: [
                    Text("여성컷"),
                    Text("22,000원"),
                  ],
                ),
                const Row(
                  children: [
                    Text("프리미엄컷"),
                    Text("22,000원"),
                  ],
                ),
                const Row(
                  children: [
                    Text("컷+샴푸+드라이"),
                    Text("22,000원"),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 5,
                  height: 12,
                ),
                const Text(
                  "펌",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 2,
                  height: 14,
                ),
                const Row(
                  children: [
                    Text("베이직펌"),
                    Text("22,000원"),
                  ],
                ),
                const Row(
                  children: [
                    Text("다운펌"),
                    Text("22,000원"),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 5,
                  height: 12,
                ),
                const Text(
                  "염색",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 2,
                  height: 14,
                ),
                const Row(
                  children: [
                    Text("전체염색"),
                    Text("22,000원"),
                  ],
                ),
                const Row(
                  children: [
                    Text("시세이도 컬러"),
                    Text("22,000원"),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
