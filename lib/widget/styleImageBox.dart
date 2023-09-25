import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';

class StyleImageBox extends StatelessWidget {
  const StyleImageBox({Key? key}) : super(key: key);

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
              "스타일",
              style: TextStyle(
                  fontSize: 18,
                  color: context.beautyTheme.whiteColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/image/test.png",
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/image/test.png",
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              Image.asset(
                "assets/image/test.png",
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
