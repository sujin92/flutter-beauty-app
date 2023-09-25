import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';

class StyleTab extends StatelessWidget {
  const StyleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 18,
        color: context.beautyTheme.basicBlack,
        fontWeight: FontWeight.w500,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 30,
            width: 70,
            decoration: BoxDecoration(
              color: context.beautyTheme.mainColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
                child: Text(
              "전체",
              style: TextStyle(
                color: context.beautyTheme.whiteColor,
                fontWeight: FontWeight.w500,
              ),
            )),
          ),
          const Text("염색"),
          const Text("펌"),
          const Text("커트"),
          const Text("기타"),
        ],
      ),
    );
  }
}

class StyleMenuTab extends StatelessWidget {
  const StyleMenuTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        fontSize: 18,
        color: context.beautyTheme.basicBlack,
        fontWeight: FontWeight.w500,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
              child: Text(
            "홈",
            style: TextStyle(
              color: context.beautyTheme.pointColor,
              fontWeight: FontWeight.w500,
            ),
          )),
          const Text("메뉴"),
          const Text("디자이너"),
          const Text("스타일"),
          const Text("리뷰"),
          const Text("정보"),
        ],
      ),
    );
  }
}
