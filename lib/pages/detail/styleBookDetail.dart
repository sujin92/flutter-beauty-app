import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StyleBookDetail extends StatelessWidget {
  const StyleBookDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DetailAppBar(),
      ),
      body: Column(
        children: [
          StyleDetailPage(),
        ],
      ),
      bottomNavigationBar: DesignerNavigationBar(),
    );
  }
}

class StyleDetailPage extends StatelessWidget {
  const StyleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, bottom: 10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Image.asset(
                  "assets/image/profileUser.png",
                  width: 50,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "임수진 디자이너",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text("더컴퍼니샵",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
        const TopImageLayer(),
      ],
    );
  }
}

class TopImageLayer extends HookConsumerWidget {
  const TopImageLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: context.beautyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          StyleImageContainer(),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "바이올렛 브라운과 에쉬핑크의 만남\n너무 예쁜 컬로조합으로 염색시술 진행해 드렸습니다.",
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Container(
                    height: 32,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "#어깨선아래",
                        style: TextStyle(
                          color: context.beautyTheme.basicBlack,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )),
                  ),
                ),
                Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "#염색",
                      style: TextStyle(
                        color: context.beautyTheme.basicBlack,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite_border,
                        color: context.beautyTheme.pointColor,
                      ),
                      const Text(
                        " 찜하기",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.share),
                    Text(
                      " 공유하기",
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StyleImageContainer extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<StyleImageContainer> {
  CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  List<String> images = [
    'assets/image/test.png',
    'assets/image/test.png',
    'assets/image/test.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 430.0,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: false,
            animateToClosest: false,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items: images.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: images.asMap().entries.map((entry) {
            int index = entry.key;
            return GestureDetector(
              onTap: () {
                _carouselController.animateToPage(index);
              },
              child: Container(
                width: 10,
                height: 10,
                margin: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentIndex == index
                      ? context.beautyTheme.pointColor
                      : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
