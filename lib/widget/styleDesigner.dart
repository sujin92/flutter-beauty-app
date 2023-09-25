import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';

class StyleDesignerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return const StyleDesigner();
      },
    );
  }
}

class StyleDesigner extends StatelessWidget {
  const StyleDesigner({super.key});

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
              "디자이너",
              style: TextStyle(
                  fontSize: 18,
                  color: context.beautyTheme.whiteColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            decoration: BoxDecoration(
                color: context.beautyTheme.whiteColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 5,
                    color: const Color(0xff7f7f7f).withAlpha(40),
                    offset: const Offset(5, 5),
                  ),
                ]),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    bottomLeft: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    "assets/image/test.png",
                    width: 120,
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "더컴퍼니샵",
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 6, 15, 10),
                        child: Text(
                          "임수진 디자이너",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.favorite,
                            color: context.beautyTheme.pointColor,
                            size: 15,
                          ),
                          const Text(
                            "20",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              "리뷰 10건",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                          FilledButton(
                            onPressed: null,
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  context.beautyTheme.whiteColor),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                  side: BorderSide(
                                    color: context.beautyTheme.pointColor,
                                  ),
                                ),
                              ),
                            ),
                            child: Text(
                              "예약하기",
                              style: TextStyle(
                                fontSize: 16,
                                color: context.beautyTheme.basicBlack,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
