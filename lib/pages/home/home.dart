import 'dart:math';
import 'package:beauty/pages/home/popularDesigner.dart';
import 'package:beauty/pages/home/popularShop.dart';
import 'package:beauty/pages/home/styleBook.dart';
import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/searchBar.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Home extends HookConsumerWidget {
  const Home({Key? key}) : super(key: key);

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
  int _selectedIndex = 0;
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: TopLayer(),
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
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}

class TopLayer extends HookConsumerWidget {
  const TopLayer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: context.beautyTheme.mainColor,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.notifications,
            color: context.beautyTheme.whiteColor,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: context.beautyTheme.whiteColor,
          ),
        ),
      ],
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
          padding: EdgeInsets.only(top: 230), //search bar 하단부터 패딩
        ),
        // SliverMainInfo(),
        SliverMainIcon(),
        SliverRecommendStyle(),
        SliverPopularShop(),
        SliverPopularDesigner(),
      ],
    );
  }
}

class BottomLayer extends HookConsumerWidget {
  const BottomLayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ColoredBox(
      color: context.beautyTheme.mainColor,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainTitle(),
          MainSearchBar(),
        ],
      ),
    );
  }
}

class SliverMainTitle extends HookConsumerWidget {
  const SliverMainTitle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverToBoxAdapter(
      child: MainTitle(),
    );
  }
}

class MainTitle extends HookConsumerWidget {
  const MainTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = MediaQuery.of(context).padding;
    return Padding(
      padding: EdgeInsets.only(top: padding.top),
      child: Padding(
        //메인텍스트 상단 패딩
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
        child: Row(
          children: [
            DefaultTextStyle(
              style: TextStyle(
                fontSize: 24,
                color: context.beautyTheme.whiteColor,
                fontWeight: FontWeight.w800,
                height: 1.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "원하는 스타일을 초특가",
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        decoration: BoxDecoration(
                          color: context.beautyTheme.pointColor,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          child: Text(
                            "견적 서비스",
                            style: TextStyle(
                              fontSize: 28,
                            ),
                          ),
                        ),
                      ),
                      const Text(
                        "로 받아보세요!",
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const ClickHere(),
          ],
        ),
      ),
    );
  }
}

class ClickHere extends HookConsumerWidget {
  const ClickHere({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          //
        },
        child: Image.asset("assets/image/test1.png"),
      ),
    );
  }
}

class SliverMainSearchBar extends HookConsumerWidget {
  const SliverMainSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverToBoxAdapter(
      child: MainSearchBar(),
    );
  }
}

class MainInfo extends HookConsumerWidget {
  final int _selectedIndex = 0;
  const MainInfo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
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
        height: 130.0,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  "임수진님, 반갑습니다!\n원하는 헤어스타일을 찾아보세요.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    height: 1.6,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => StyleBook(
                            selectedIndex: _selectedIndex,
                            onItemTapped: (index) {})),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "스타일북 보러가기",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Icon(
                        Icons.chevron_right,
                        size: 26,
                        color: context.beautyTheme.pointColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SliverMainIcon extends HookConsumerWidget {
  const SliverMainIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const SliverToBoxAdapter(
      child: Stack(
        children: [
          MainIcon(),
          MainInfo(),
        ],
      ),
    );
  }
}

class MainIcon extends HookConsumerWidget {
  final int _selectedIndex = 0;
  const MainIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        60,
        170,
        60,
        50,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButtonColumn(
            iconData: Icons.thumb_up_off_alt,
            label: "스타일 추천",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => StyleBook(
                      selectedIndex: _selectedIndex,
                      onItemTapped: (index) {})));
            },
          ),
          IconButtonColumn(
            iconData: Icons.storefront,
            label: "인기 헤어샵",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PopularShop(
                      selectedIndex: _selectedIndex,
                      onItemTapped: (index) {})));
            },
          ),
          IconButtonColumn(
            iconData: Icons.content_cut,
            label: "인기 디자이너",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PopularDesigner(
                      selectedIndex: _selectedIndex,
                      onItemTapped: (index) {})));
            },
          ),
        ],
      ),
    );
  }
}

class IconButtonColumn extends HookConsumerWidget {
  final IconData iconData;
  final String label;
  final VoidCallback? onTap;

  const IconButtonColumn({
    Key? key,
    required this.iconData,
    required this.label,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(
            iconData,
            color: context.beautyTheme.basicBlack,
            size: 26,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              label,
              style: const TextStyle(fontSize: 16),
            ),
          )
        ],
      ),
    );
  }
}

class ButtonPanal extends HookConsumerWidget {
  const ButtonPanal({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Padding(
      padding: EdgeInsets.all(60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: Icon(Icons.thumb_up_off_alt),
            onPressed: null,
          ),
          IconButton(
            icon: Icon(Icons.thumb_up_off_alt),
            onPressed: null,
          ),
        ],
      ),
    );
  }
}

class SliverRecommendStyle extends HookConsumerWidget {
  const SliverRecommendStyle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverMainAxisGroup(slivers: [
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(
            "뷰티인포 디자이너들의 스타일 추천",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(5),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 320,
            maxCrossAxisExtent: 280,
          ),
          itemCount: 4,
          itemBuilder: (context, index) {
            return const MainItemTile();
          },
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 100,
          ),
          child: SizedBox(
            child: FilledButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                context.beautyTheme.mainColor,
              )),
              child: const Text(
                "더보기",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class MainItemTile extends StatelessWidget {
  const MainItemTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
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
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                    "assets/image/test.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                    child: Text(
                      "임수진 디자이너",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
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
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  "더컴퍼니헤어",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Text("#중단발허쉬컷"),
            ],
          ),
        ),
      ),
    );
  }
}

class SliverPopularShop extends HookConsumerWidget {
  const SliverPopularShop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverMainAxisGroup(slivers: [
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(
            "인기 헤어샵 둘러보기",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(5),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 200,
            maxCrossAxisExtent: 600,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const PopularShopTile();
          },
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: 100,
          ),
          child: SizedBox(
            child: FilledButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                context.beautyTheme.mainColor,
              )),
              child: const Text(
                "더보기",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class PopularShopTile extends StatelessWidget {
  const PopularShopTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        5,
      ),
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
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.asset(
                "assets/image/test.png",
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "현재 위치로부터 2.26km",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.fromLTRB(0, 6, 15, 20),
                    child: Text(
                      "더컴퍼니 헤어샵",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      "영업중",
                      style: TextStyle(
                        fontSize: 16,
                      ),
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
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          "리뷰 10건",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
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

class SliverPopularDesigner extends HookConsumerWidget {
  const SliverPopularDesigner({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverMainAxisGroup(slivers: [
      const SliverToBoxAdapter(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Text(
            "인기 디자이너 추천",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
      SliverPadding(
        padding: const EdgeInsets.all(5),
        sliver: SliverGrid.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            mainAxisExtent: 140,
            maxCrossAxisExtent: 600,
          ),
          itemCount: 3,
          itemBuilder: (context, index) {
            return const PopularDesignerTile();
          },
        ),
      ),
      SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(100, 20, 100, 40),
          child: SizedBox(
            child: FilledButton(
              onPressed: null,
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(
                context.beautyTheme.mainColor,
              )),
              child: const Text(
                "더보기",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      )
    ]);
  }
}

class PopularDesignerTile extends StatelessWidget {
  const PopularDesignerTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        10,
      ),
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
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
    );
  }
}
