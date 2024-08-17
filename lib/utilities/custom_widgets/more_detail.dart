import 'package:flutter/material.dart';

class MoreDetail extends StatelessWidget {
  final String title;
  final String detail;
  const MoreDetail({
    super.key,
    required this.title,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          SelectableText(
            title,
            style: TextStyle(
              color: Colors.grey.shade900,
              fontSize: 20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SelectableText(
            detail,
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
