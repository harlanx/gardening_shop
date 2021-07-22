import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:function_helpers/models/models.dart';

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
    return InkWell(
      onTap: () {},
      child: Card(
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
                    widget.product.images![0],
                    fit: BoxFit.cover,
                  ),
                  /* FractionallySizedBox(
                    alignment: Alignment.bottomRight,
                    heightFactor: 0.2,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${widget.product.rating}',
                          style: TextStyle(
                            color: Colors.white,
                            /* shadows: [
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(-2, -2),
                              ),
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(2, 2),
                              ),
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(-2, 2),
                              ),
                              Shadow(
                                color: Colors.black,
                                blurRadius: 5.0,
                                offset: Offset(2, -2),
                              ),
                            ], */
                          ),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                      ],
                    ),
                  ), */
                  if (widget.product.discount != null)
                    Align(
                      alignment: Alignment.topRight,
                      child: ClipOval(
                        child: Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 40,
                          color: Colors.green.shade700,
                          child: Text(
                            '${widget.product.discount!.toStringAsFixed(0)}%',
                            style: TextStyle(fontWeight: FontWeight.w800),
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
                                if (widget.product.discount != null)
                                  Text(
                                    '₱${widget.product.discountedPrice} ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                Text(
                                  '₱${widget.product.price}',
                                  style: TextStyle(
                                    color: widget.product.discount != null ? Colors.grey : Colors.black,
                                    fontWeight: FontWeight.w500,
                                    decoration: widget.product.discount != null ? TextDecoration.lineThrough : TextDecoration.none,
                                    decorationThickness: 2.0,
                                  ),
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
      ),
    );
  }
}
