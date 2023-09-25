import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/infoMap.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HairShopLocation extends StatelessWidget {
  const HairShopLocation({Key? key}) : super(key: key);

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
              "정보",
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
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "주소",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 2,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("경남 창원시 마산회원구 봉암북21길"),
                ),
                const SizedBox(height: 200, child: MapSample()),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 5,
                  height: 30,
                ),
                const Text(
                  "상세정보",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                Divider(
                  color: Colors.grey.shade100,
                  thickness: 2,
                  height: 20,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 35),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "영업시간",
                            style: TextStyle(height: 2),
                          ),
                          Text(
                            "휴무",
                            style: TextStyle(height: 2),
                          ),
                          Text(
                            "경력사항",
                            style: TextStyle(height: 2),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "11:00 ~ 21:00",
                          style: TextStyle(height: 2),
                        ),
                        Text(
                          "매주 월요일",
                          style: TextStyle(height: 2),
                        ),
                        Text(
                          "없음",
                          style: TextStyle(height: 2),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
