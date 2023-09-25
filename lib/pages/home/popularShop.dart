import 'package:beauty/pages/detail/hairShopDetail.dart';
import 'package:beauty/pages/home/home.dart';
import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/searchBar.dart';
import 'package:beauty/widget/sort.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PopularShop extends StatelessWidget {
  const PopularShop({
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
      body: const ShopMainLayer(),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: null,
        label: const Text(
          "지도보기",
          style: TextStyle(fontSize: 16),
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

class ShopMainLayer extends StatelessWidget {
  const ShopMainLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ShopSort(),
        const SubSearchBar(),
        Expanded(child: PopularShopList()),
      ],
    );
  }
}

class ShopSort extends StatelessWidget {
  const ShopSort({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "인기 헤어샵",
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
        return PopularShopItem();
      },
    );
  }
}

class PopularShopItem extends StatelessWidget {
  PopularShopItem({Key? key}) : super(key: key);

  final List<String> imageList = [
    "assets/image/test.png",
    "assets/image/test.png",
  ];

  Widget _buildMiddle() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 280.0,
        autoPlay: false,
        viewportFraction: 0.9,
        enableInfiniteScroll: false,
        padEnds: false,
      ),
      items: imageList.map((imagePath) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: 400,
              margin: const EdgeInsets.only(right: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.cover,
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
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const HairShopDetail(),
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
          child: Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMiddle(),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "현재 위치로부터 2.32km",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[500],
                    ),
                  ),
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 190,
                      ),
                      child: Text(
                        "더컴퍼니 합성점",
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
                    vertical: 15,
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
                        "영업중",
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
