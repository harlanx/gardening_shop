import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gardening_shop/models/models.dart';

class ProductBox extends StatefulWidget {
  final Product product;

  const ProductBox({
    Key? key,
    required this.product,
  }) : super(key: key);

  @override
  _ProductBoxState createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      child: Column(
        children: [
          Expanded(
            flex: 60,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  widget.product.images[0],
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          Expanded(
            flex: 40,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                children: [
                  Expanded(
                    flex: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.product.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 50,
                    child: Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                '₱${widget.product.pricing}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.start,
                              ),
                              if (widget.product.oldPricing != null)
                                Text(
                                  ' ₱${widget.product.oldPricing}',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                      decoration: widget.product.oldPricing != null ? TextDecoration.lineThrough : TextDecoration.none,
                                      decorationThickness: 2.0),
                                  textAlign: TextAlign.start,
                                ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Text(
                            '${widget.product.sold} Sold',
                            style: TextStyle(
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
    );
  }
}
