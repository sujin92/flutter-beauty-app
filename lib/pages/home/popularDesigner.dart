import 'package:beauty/pages/detail/designerDetail.dart';
import 'package:beauty/pages/home/popularShop.dart';
import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/sort.dart';
import 'package:beauty/widget/styleTab.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PopularDesigner extends StatelessWidget {
  const PopularDesigner({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  final int selectedIndex;
  final Function(int) onItemTapped;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SubAppBar(),
      ),
      body: const DisignMainLayer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: const Text(
          "지도보기",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        icon: const Icon(Icons.location_on),
        backgroundColor: context.beautyTheme.mainColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class DisignMainLayer extends StatelessWidget {
  const DisignMainLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DesignSort(),
        const Padding(
          padding: EdgeInsets.all(20),
          child: StyleTab(),
        ),
        Expanded(child: PopularShopList()),
      ],
    );
  }
}

class DesignSort extends StatelessWidget {
  const DesignSort({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "인기 디자이너",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
            SortList(),
          ],
        )
      ]),
    );
  }
}

class PopularShopList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return PopularDesignItem();
      },
    );
  }
}

class PopularDesignItem extends StatelessWidget {
  PopularDesignItem({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/image/test.png",
    "assets/image/test.png",
    "assets/image/test.png",
  ];

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 150.0,
        autoPlay: false,
        viewportFraction: 0.4,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 150,
              margin: const EdgeInsets.only(right: 10, left: 10),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const DesignerDetail(),
          ));
        },
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
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
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
                        Text(
                          "더컴퍼니샵",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey[500],
                          ),
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(right: 130),
                              child: Text(
                                "임수진 디자이너",
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
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
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 10,
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  right: 20,
                                ),
                                child: Text(
                                  "리뷰 10건",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Text(
                                "창원시 마산회원구 봉암북21길",
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            children: [
                              Icon(
                                Icons.fiber_manual_record,
                                size: 18,
                                color: context.beautyTheme.pointColor,
                              ),
                              const Text(
                                "근무중",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              _buildMiddle(),
            ],
          ),
        ),
      ),
    );
  }
}
