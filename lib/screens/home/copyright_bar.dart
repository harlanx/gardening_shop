part of '../../screens/home.dart';

class CopyrightBar extends StatelessWidget {
  const CopyrightBar({
    super.key,
    required this.size,
  });
  final Size size;

  bool get _screenLarge {
    return size.width >= 800;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xFF443022),
        border: Border(
          top: BorderSide(
            color: AppData.color,
            width: 2.0,
          ),
        ),
      ),
      width: double.infinity,
      child: DefaultTextStyle(
        style: DefaultTextStyle.of(context).style.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
        child: Wrap(
          direction: Axis.horizontal,
          alignment:
              _screenLarge ? WrapAlignment.spaceBetween : WrapAlignment.center,
          spacing: 20,
          runSpacing: 5,
          children: [
            const SelectableText(
              '© Copyright 2024 Earthly. All Rights Reserved.',
              textAlign: TextAlign.center,
            ),
            InkWell(
              child: const Text('Privacy Policy'),
              onTap: () {
                debugPrint('Navigate to Privacy Policy');
              },
            ),
          ],
        ),
      ),
    );
  }
}
