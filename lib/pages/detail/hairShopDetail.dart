import 'dart:math';
import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/hairShopLocation.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/styleDesigner.dart';
import 'package:beauty/widget/styleImageBox.dart';
import 'package:beauty/widget/styleMenu.dart';
import 'package:beauty/widget/styleReview.dart';
import 'package:beauty/widget/styleTab.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:beauty/widget/infoMap.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HairShopDetail extends HookConsumerWidget {
  const HairShopDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  final scrollController = ScrollController();
  final _maxTop = 300.0;
  var _top = 300.0;

  void _changed() {
    _top = max(0, _maxTop - scrollController.offset);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_changed);
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.removeListener(_changed);
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: DetailAppBar(),
      ),
      body: Stack(
        children: [
          const BottomLayer(),
          Positioned(
            left: 0,
            right: 0,
            top: _top,
            bottom: 0,
            child: Container(color: Colors.white),
          ),
          CenterLayer(scrollController: scrollController),
        ],
      ),
      bottomNavigationBar: const ReservationNavigationBar(),
    );
  }
}

class CenterLayer extends HookConsumerWidget {
  final ScrollController scrollController;
  const CenterLayer({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CustomScrollView(
      controller: scrollController,
      slivers: const [
        SliverPadding(
          padding: EdgeInsets.only(top: 190),
        ),
        SliverShopMainInfo(),
        SliverDetailInfo(),
      ],
    );
  }
}

class BottomLayer extends HookConsumerWidget {
  const BottomLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: context.beautyTheme.whiteColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          HairShopImage(),
        ],
      ),
    );
  }
}

class HairShopImage extends StatefulWidget {
  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<HairShopImage> {
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
          options: CarouselOptions(
            height: 200.0,
            enlargeCenterPage: true,
            autoPlay: true,
            enableInfiniteScroll: true,
            viewportFraction: 1,
          ),
          items: images.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                  ),
                  child: Image.asset(
                    item,
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
      ],
    );
  }
}

class SliverShopMainInfo extends HookConsumerWidget {
  const SliverShopMainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverToBoxAdapter(
      child: Stack(
        children: [
          HairShopInfo(),
        ],
      ),
    );
  }
}

class HairShopInfo extends HookConsumerWidget {
  const HairShopInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: context.beautyTheme.whiteColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: const Color(0xff7f7f7f).withAlpha(40),
            offset: const Offset(5, 5),
          ),
        ],
      ),
      width: 600,
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "컴퍼니샵 합성점",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: context.beautyTheme.pointColor,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: context.beautyTheme.pointColor,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: context.beautyTheme.pointColor,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: context.beautyTheme.pointColor,
                        size: 20,
                      ),
                      Icon(
                        Icons.star,
                        color: context.beautyTheme.pointColor,
                        size: 20,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "5.0",
                          style: TextStyle(fontSize: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const Text(
              "영업시간\n매일 10:00 ~ 22:00",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "다양한 교육과정과 충분한 경력이 있습니다.",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "더보기",
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
            ),
            const MainIconInfo(),
          ],
        ),
      ),
    );
  }
}

class MainIconInfo extends StatelessWidget {
  const MainIconInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              children: [
                Icon(
                  Icons.favorite_border,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("찜"),
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.grey.shade300,
              width: 1,
              thickness: 1,
            ),
            const Column(
              children: [
                Icon(
                  Icons.location_on,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("위치"),
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.grey.shade300,
              width: 1,
              thickness: 1,
            ),
            const Column(
              children: [
                Icon(
                  Icons.call,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("전화"),
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.grey.shade300,
              width: 1,
              thickness: 1,
            ),
            const Column(
              children: [
                Icon(
                  Icons.share,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text("공유"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SliverDetailInfo extends HookConsumerWidget {
  const SliverDetailInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverMainAxisGroup(slivers: [
      SliverToBoxAdapter(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(20),
              child: StyleMenuTab(),
            ),
            const StyleMenu(),
            const StyleDesigner(),
            Icon(
              Icons.expand_more,
              size: 38,
              color: Colors.grey.shade300,
            ),
            const StyleImageBox(),
            Icon(
              Icons.expand_more,
              size: 38,
              color: Colors.grey.shade300,
            ),
            StyleReview(),
            Icon(
              Icons.expand_more,
              size: 38,
              color: Colors.grey.shade300,
            ),
            const HairShopLocation(),
          ],
        ),
      ),
    ]);
  }
}
