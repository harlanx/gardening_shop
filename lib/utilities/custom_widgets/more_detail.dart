import 'package:flutter/material.dart';
import 'package:gardening_shop/utilities/constants.dart';

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
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: ShopCons.kMaxScreenWidth,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            SelectableText(
              title,
              style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 20,
                  fontWeight: FontWeight.w800),
            ),
            SelectableText(
              detail,
              style: TextStyle(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
