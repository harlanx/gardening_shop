import 'package:flutter/material.dart';
import 'package:function_helpers/models/models.dart';

class ProductBox extends StatefulWidget {
  final Product product;

  const ProductBox({
    super.key,
    required this.product,
  });

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  late final discounted = widget.product.discount != null;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('Navigate to ${widget.product.name}');
      },
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(
            color: Colors.grey.shade400,
            width: 0.5,
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              flex: 60,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(
                    widget.product.images![0],
                    fit: BoxFit.cover,
                  ),
                  if (widget.product.discount != null)
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipOval(
                          child: Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 40,
                            color: Colors.green.shade700,
                            child: Text(
                              '${widget.product.discount!.toStringAsFixed(0)}%',
                              style:
                                  const TextStyle(fontWeight: FontWeight.w800),
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  children: [
                    Expanded(
                      flex: 50,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          widget.product.name,
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 50,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Flexible(
                                  child: Text(
                                    '₱${discounted ? widget.product.discountedPrice.ceil() : widget.product.price.ceil()}',
                                    textScaler: const TextScaler.linear(1.2),
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    maxLines: 1,
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                                if (discounted)
                                  Flexible(
                                    child: Text(
                                      '₱${widget.product.price.ceil()}',
                                      textScaler: const TextScaler.linear(0.9),
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500,
                                        decoration: TextDecoration.lineThrough,
                                        decorationThickness: 2.0,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      maxLines: 1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${widget.product.sold} Sold',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.end,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
