import 'package:flutter/material.dart';
import 'package:function_helpers/models/models.dart';
import 'package:gardening_shop/utilities/constants.dart';
import 'product_box.dart';

class Deals extends StatefulWidget {
  ///Title of the deal
  final Widget title;

  ///Alignment of the deal
  final Alignment titleAlignment;

  ///List of product items
  final List<Product> items;

  ///Layout of the [ProductBox]. If itemView is set to [ItemView.grid] then height is ignored.
  final ItemView itemView;

  ///Height of the [Deals] box. If itemView is set to [ItemView.grid] then height is ignored.
  final double height;

  ///Width of the [ProductBox]
  final double itemWidth;

  ///Spacing between the [ProductBox]
  final double itemSpacing;

  const Deals({
    Key? key,
    required this.title,
    this.titleAlignment = Alignment.centerLeft,
    required this.items,
    this.itemView = ItemView.row,
    this.height = 100,
    this.itemWidth = 150,
    this.itemSpacing = 2,
  }) : super(key: key);

  @override
  _DealsState createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: widget.itemView == ItemView.row ? widget.height : double.infinity,
          maxWidth: ShopCons.kMaxScreenWidth,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              alignment: Alignment.bottomRight,
              children: [
                Align(
                  alignment: widget.titleAlignment,
                  child: widget.title,
                ),
                InkWell(
                  child: Text(
                    'See more >>',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: () {},
                ),
              ],
            ),
            if (widget.itemView == ItemView.row) ...[
              Flexible(
                child: ListView(
                  controller: ScrollController(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: widget.items
                      .map(
                        (e) => Container(
                          margin: EdgeInsets.symmetric(horizontal: widget.itemSpacing),
                          width: widget.itemWidth,
                          child: ProductBox(product: e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ] else ...[
              Wrap(
                alignment: WrapAlignment.start,
                spacing: widget.itemSpacing,
                runSpacing: widget.itemSpacing,
                children: widget.items
                    .map(
                      (e) => SizedBox(
                        height: widget.height,
                        width: widget.itemWidth,
                        child: ProductBox(product: e),
                      ),
                    )
                    .toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

enum ItemView {
  row,
  grid,
}
