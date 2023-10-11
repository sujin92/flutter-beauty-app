import 'package:beauty/pages/myPage/%20hairCondition.dart';
import 'package:beauty/pages/myPage/editProfile.dart';
import 'package:beauty/widget/navigationBar.dart';
import 'package:beauty/widget/subAppBar.dart';
import 'package:flutter/material.dart';

class MyPageHome extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyPageHome({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SubAppBar(),
      ),
      body: const SafeArea(
        bottom: false,
        child: MyPageMainLayer(),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: selectedIndex,
        onItemTapped: onItemTapped,
      ),
    );
  }
}

class MyPageMainLayer extends StatelessWidget {
  const MyPageMainLayer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MyPageTop(),
        MyPageMiddle(),
        MyPageBottom(),
      ],
    );
  }
}

class MyPageTop extends StatelessWidget {
  const MyPageTop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20),
            child: Text(
              "마이페이지",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.account_circle,
                      size: 60,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "임수진",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                  );
                },
                child: const Text(
                  "프로필 수정 >",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MyPageMiddle extends StatelessWidget {
  const MyPageMiddle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Container(
        color: Colors.grey.shade200,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HairCondition(),
                    ),
                  );
                },
                child: const Column(
                  children: [
                    Icon(
                      Icons.description,
                      size: 32,
                    ),
                    Text(
                      "모발 상태",
                      style: TextStyle(fontSize: 16, height: 2),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 80),
                child: Column(
                  children: [
                    Icon(
                      Icons.comment,
                      size: 32,
                    ),
                    Text(
                      "메세지",
                      style: TextStyle(fontSize: 16, height: 2),
                    ),
                  ],
                ),
              ),
              const Column(
                children: [
                  Icon(
                    Icons.favorite_border,
                    size: 32,
                  ),
                  Text(
                    "찜",
                    style: TextStyle(fontSize: 16, height: 2),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyPageBottom extends StatelessWidget {
  const MyPageBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "공지사항",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "고객센터 / FAQ",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "입점문의",
                  style: TextStyle(fontSize: 18),
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
