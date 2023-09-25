import 'package:beauty/theme/theme.dart';
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
          const Text(
            "바이올렛 브라운과 에쉬핑크의 만남\n너무 예쁜 컬로조합으로 염색시술 진행해 드렸습니다.",
            style: TextStyle(
              fontSize: 16,
              height: 1.4,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("#어깨선아래"),
                Text("#염색"),
              ],
            ),
          ),
          Row(
            children: [
              Row(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: context.beautyTheme.pointColor,
                  ),
                  const Text(" 찜하기"),
                ],
              ),
              const Row(
                children: [
                  Icon(Icons.share),
                  Text(" 공유하기"),
                ],
              ),
            ],
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
            height: 400.0,
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
