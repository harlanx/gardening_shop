import 'package:flutter/material.dart';

class MoreDetail extends StatelessWidget {
  final String title;
  final String detail;
  const MoreDetail({
    Key? key,
    required this.title,
    required this.detail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 980,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              title,
              style: TextStyle(color: Colors.grey.shade400, fontSize: 20, fontWeight: FontWeight.w800),
            ),
            SelectableText(
              detail,
              style: TextStyle(color: Colors.grey.shade400, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
