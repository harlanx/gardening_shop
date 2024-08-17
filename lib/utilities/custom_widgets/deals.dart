import 'package:flutter/material.dart';

import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:function_helpers/models/models.dart';

import '../custom_widgets/custom_widgets.dart';
import '../../data/app_data.dart';

// Currently unused since we used sticky header package instead.
class HeaderDelegate extends SliverPersistentHeaderDelegate {
  HeaderDelegate({
    required this.title,
    required this.separatorColor,
    this.fancy = false,
  });

  final Color separatorColor;
  final Widget title;
  final bool fancy;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Border border;
    BorderRadius? borderRadius;
    if (fancy) {
      border = Border.all(
        color: separatorColor,
        width: 2.0,
      );
      borderRadius = const BorderRadius.all(Radius.circular(5));
    } else {
      border = Border(
        bottom: BorderSide(
          color: separatorColor,
          width: 2.0,
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: border,
        borderRadius: borderRadius,
      ),
      child: title,
    );
  }

  @override
  double get maxExtent => 100;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class Deals extends StatefulWidget {
  const Deals({
    super.key,
    required this.identifier,
    required this.title,
    required this.items,
    this.itemView = ItemView.row,
    this.fancyTitle = false,
    this.sticky = true,
  });

  final String identifier;

  ///Title of the deal
  final Widget title;

  ///List of product items
  final List<Product> items;

  ///Layout of the [ProductBox]. If itemView is set to [ItemView.grid] then height is ignored.
  final ItemView itemView;

  /// Decorates the [title] container with full border
  final bool fancyTitle;

  /// Pin [title] when user scrolls down
  final bool sticky;

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  Border? border;

  @override
  void initState() {
    super.initState();
    if (widget.fancyTitle) {
      border = Border.all(
        color: AppData.color,
        width: 5.0,
      );
    } else {
      border = const Border(
        bottom: BorderSide(
          color: AppData.color,
          width: 5.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverStickyHeader(
          sticky: widget.sticky,
          header: Center(
            child: Container(
              constraints: const BoxConstraints.tightFor(width: 1280),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                border: border,
              ),
              child: widget.title,
            ),
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                LayoutBuilder(
                  builder: (context, constraints) {
                    final w = constraints.maxWidth;
                    Size boxSize;
                    if (w > 800) {
                      boxSize = const Size(250, 300);
                    } else if (w >= 600 && w <= 800) {
                      boxSize = const Size(200, 250);
                    } else {
                      boxSize = const Size(180, 230);
                    }
                    return ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 1280),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        children: [
                          for (var item in widget.items)
                            ConstrainedBox(
                              constraints: BoxConstraints.tightFor(
                                width: boxSize.width,
                                height: boxSize.height,
                              ),
                              child: ProductBox(product: item),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: OutlinedButton(
                    onPressed: () {
                      debugPrint('Navigate to ${widget.identifier}');
                    },
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      foregroundColor: AppData.color,
                    ),
                    child: const Text('See More'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum ItemView {
  row,
  grid,
}
