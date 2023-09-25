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
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DesignerDetail extends HookConsumerWidget {
  const DesignerDetail({Key? key}) : super(key: key);

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
  final _maxTop = 360.0;
  var _top = 360.0;

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
          padding: EdgeInsets.only(top: 335),
        ),
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
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DesignerMainInfo(),
        ],
      ),
    );
  }
}

class DesignerMainInfo extends StatelessWidget {
  const DesignerMainInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade100,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                  ),
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
                    const Text("임수진 디자이너",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        )),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: Text(
                        "더컴퍼니샵",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Row(
                children: [
                  Image.asset(
                    "assets/image/profileUser2.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Image.asset(
                      "assets/image/profileUser2.png",
                      width: 50,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Image.asset(
                    "assets/image/profileUser2.png",
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 5,
              ),
              child: Text(
                "#탈색전문  #옴브레염색",
                style: TextStyle(
                    fontSize: 16,
                    color: context.beautyTheme.mainColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const Text(
              "매주 월요일 휴무",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
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
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 185,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.favorite_border,
                          color: context.beautyTheme.pointColor,
                        ),
                        const Text(" 찜하기"),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 185,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade400),
                      color: Colors.white,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.share),
                        Text(" 공유하기"),
                      ],
                    ),
                  ),
                ],
              ),
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
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: context.beautyTheme.whiteColor,
                ),
                width: 600,
                height: 60,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: StyleMenuTab(),
                )),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
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
