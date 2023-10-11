import 'package:beauty/pages/myPage/myPageHome.dart';
import 'package:beauty/pages/submenu/message.dart';
import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const MyBottomNavigationBar({
    required this.selectedIndex,
    required this.onItemTapped,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      unselectedItemColor: context.beautyTheme.basicBlack,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: '홈',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.menu_book),
          label: '스타일북',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: '내주변',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_available),
          label: '예약',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: '마이페이지',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: context.beautyTheme.pointColor,
      onTap: (index) {
        if (index == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MyPageHome(
                selectedIndex: selectedIndex,
                onItemTapped: (index) {},
              ),
            ),
          );
        } else {
          onItemTapped(index);
        }
      },
    );
  }
}

class ReservationNavigationBar extends StatelessWidget {
  const ReservationNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 70,
        child: Center(
          child: SizedBox(
            width: 400,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: context.beautyTheme.mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                '예약하기',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class DesignerNavigationBar extends StatelessWidget {
  const DesignerNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: 70,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Message()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.beautyTheme.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(width: 1, color: Colors.grey.shade300),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    '메세지',
                    style: TextStyle(
                        fontSize: 18, color: context.beautyTheme.basicBlack),
                  ),
                ),
              ),
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: context.beautyTheme.mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(
                          width: 1, color: context.beautyTheme.mainColor),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    '디자이너 자세히 보기',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
