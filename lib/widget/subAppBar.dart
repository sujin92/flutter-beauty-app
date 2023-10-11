import 'package:beauty/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SubAppBar extends HookConsumerWidget {
  const SubAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: context.beautyTheme.whiteColor,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.notifications,
            color: context.beautyTheme.basicBlack,
          ),
        ),
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.menu,
            color: context.beautyTheme.basicBlack,
          ),
        ),
      ],
    );
  }
}

class DetailAppBar extends HookConsumerWidget {
  const DetailAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.home,
            color: context.beautyTheme.basicBlack,
          ),
        ),
      ],
    );
  }
}

class MessageAppBar extends HookConsumerWidget {
  const MessageAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      title: const Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "임수진 디자이너",
          style: TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      actions: [
        IconButton(
          onPressed: null,
          icon: Icon(
            Icons.more_vert,
            color: context.beautyTheme.basicBlack,
          ),
        ),
      ],
    );
  }
}
