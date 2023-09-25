import 'package:beauty/theme/theme.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class StyleReview extends StatelessWidget {
  StyleReview({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/image/test.png",
    "assets/image/test.png",
    "assets/image/test.png",
    "assets/image/test.png",
  ];

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 130.0,
        autoPlay: false,
        viewportFraction: 0.3,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              margin: const EdgeInsets.only(left: 20),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }

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
              "리뷰",
              style: TextStyle(
                  fontSize: 18,
                  color: context.beautyTheme.whiteColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
        _buildMiddle(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Divider(
            color: Colors.grey.shade100,
            thickness: 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "여성컷+C컬펌",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "디자이너 임수진",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "너무 만족해요.\n컷 하고 다운펌까지 추가로 받았는데 디테일하고 세심하게 잘 잘라주세요!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    const Text("5.0")
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "김o진  2023.11.12",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade100,
                thickness: 2,
                height: 25,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    "여성컷+C컬펌",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      "디자이너 임수진",
                      style:
                          TextStyle(fontSize: 16, color: Colors.grey.shade600),
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "너무 만족해요.\n컷 하고 다운펌까지 추가로 받았는데 디테일하고 세심하게 잘 잘라주세요!",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    Icon(
                      Icons.star,
                      color: context.beautyTheme.pointColor,
                      size: 16,
                    ),
                    const Text("5.0")
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "김o진  2023.11.12",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.grey.shade100,
                thickness: 2,
                height: 25,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
