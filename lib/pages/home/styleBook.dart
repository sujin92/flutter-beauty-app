import 'package:beauty/theme/theme.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/searchBar.dart';
import 'package:beauty/widget/styleTab.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:flutter/material.dart';

class StyleBook extends StatelessWidget {
  const StyleBook({
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
      body: const SafeArea(
        bottom: false,
        child: StyleMainLayer(),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class StyleMainLayer extends StatelessWidget {
  const StyleMainLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const BookStyleTab(),
        const SubSearchBar(),
        Expanded(child: PopularDisignerList()),
      ],
    );
  }
}

class BookStyleTab extends StatelessWidget {
  const BookStyleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "스타일북",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          StyleTab(),
        ],
      ),
    );
  }
}

class PopularDisignerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: 300,
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 20,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const PopularDisignerItem();
        },
      ),
    );
  }
}

class PopularDisignerItem extends StatelessWidget {
  const PopularDisignerItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Container(
        height: 400,
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
                    padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
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
                padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                child: Text(
                  "더컴퍼니헤어",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text("#중단발허쉬컷"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
