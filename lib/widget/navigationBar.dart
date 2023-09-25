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
      onTap: onItemTapped,
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
