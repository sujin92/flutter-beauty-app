import 'package:flutter/material.dart';

class MessageRow extends StatelessWidget {
  final String message;
  final bool isUser;
  final String time;
  final bool isLeftAlign;

  const MessageRow({
    Key? key,
    required this.message,
    required this.isUser,
    required this.time,
    required this.isLeftAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isLeftAlign ? MainAxisAlignment.start : MainAxisAlignment.end,
      children: [
        if (isLeftAlign) const Icon(Icons.account_circle),
        if (!isLeftAlign) Text(time),
        MessageBubble(message: message, isUser: isUser),
        if (isLeftAlign) Text(time),
        if (!isLeftAlign) const Icon(Icons.account_circle),
      ],
    );
  }
}

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const MessageBubble({Key? key, required this.message, required this.isUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isUser ? const Color(0xFF633581) : Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
          bottomRight: isUser ? Radius.zero : const Radius.circular(12),
        ),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
