import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:image/image.dart' as img;

class LogoPicker extends StatefulWidget {
  const LogoPicker({
    super.key,
    required this.source,
    required this.point,
    required this.size,
    this.color,
  });

  final String source;
  final Point point;
  final Size size;
  final Color? color;

  @override
  State<LogoPicker> createState() => _LogoPickerState();
}

class _LogoPickerState extends State<LogoPicker> {
  late final Future<MemoryImage> _future;

  @override
  void initState() {
    super.initState();
    _future = ImageEx.assetCropped(
      widget.source,
      widget.point,
      widget.size,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: FutureBuilder<MemoryImage>(
        future: _future,
        builder: (contex, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            final image = snapshot.data as MemoryImage;
            return MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () {},
                child: Image(
                  image: image,
                  color: widget.color,
                  colorBlendMode: widget.color != null ? BlendMode.srcIn : null,
                ),
              ),
            );
          }
          // return Text(snapshot.error.toString());
          return const FlutterLogo(
            size: 25,
            style: FlutterLogoStyle.horizontal,
          );
        },
      ),
    );
  }
}

extension ImageEx on Image {
  static Future<MemoryImage> assetCropped(
    String source,
    Point point,
    Size size,
  ) async {
    // Flutter web doesn't support dart:io so we manually load the asset
    // Make sure to call WidgetsFlutterBinding.ensureInitialized(); in main method to use rootBundle.
    final bytes = (await rootBundle.load(source)).buffer.asUint8List();

    final decoded = img.PngDecoder().decode(bytes);
    if (decoded == null) return Future.error('Cannot decode image file');

    final cropped = img.copyCrop(
      decoded,
      x: point.x.toInt(),
      y: point.y.toInt(),
      width: size.width.toInt(),
      height: size.height.toInt(),
    );

    // Have to re-encode using this package to make it to work
    // Not sure why it doesn't work when directly accessing getBytes();
    final encoded = img.encodePng(cropped, level: 1, singleFrame: true);

    final result = MemoryImage(encoded);

    return result;
  }
}
