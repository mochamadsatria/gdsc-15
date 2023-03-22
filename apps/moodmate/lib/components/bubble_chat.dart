import 'package:flutter/material.dart';

class BubbleChat extends StatefulWidget {
  final String text;
  final bool isMe;
  final String time;

  const BubbleChat({super.key, required this.text, required this.isMe, required this.time});

  @override
  State<BubbleChat> createState() => _BubbleChatState();
}

class _BubbleChatState extends State<BubbleChat> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
      widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: widget.isMe ? Colors.blue : Colors.grey[300],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text(
                widget.time,
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 5.0),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 16.0,
                  color: widget.isMe ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
