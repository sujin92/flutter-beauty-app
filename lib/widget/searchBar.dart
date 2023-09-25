import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainSearchBar extends HookConsumerWidget {
  const MainSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      //serch bar 상단 패딩
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
      child: TextField(
        style: const TextStyle(
          decoration: TextDecoration.none,
        ),
        decoration: InputDecoration(
          hintText: "디자이너, 샵, 주소, 스타일을 검색해 보세요.",
          hintStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.beautyTheme.transGray,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: context.beautyTheme.transGray,
          ),
          filled: true,
          fillColor: const Color.fromARGB(255, 69, 16, 102),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

class SubSearchBar extends HookConsumerWidget {
  const SubSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
        height: 85,
        child: TextField(
          style: const TextStyle(
            decoration: TextDecoration.none,
          ),
          decoration: InputDecoration(
            hintText: "검색어를 입력하세요.",
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.grey[500],
            ),
            prefixIcon: Icon(
              Icons.search,
              color: context.beautyTheme.mainColor,
            ),
            filled: true,
            fillColor: context.beautyTheme.whiteColor,
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30.0),
              borderSide: BorderSide(
                color: context.beautyTheme.mainColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
