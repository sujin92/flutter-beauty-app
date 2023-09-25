import 'dart:math';

import 'package:beauty/widget/navigationBar.dart';
import 'package:flutter/material.dart';

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
      bottomNavigationBar: MyBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      // 이 부분을 제거하거나 주석 처리합니다.
      // ...
    );
  }
}
