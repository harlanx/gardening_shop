class Product {
  int id;
  String name;
  double pricing;

  /// Must be in range between 1 to 100;
  double? discount;
  int remaining;
  int sold;
  List<String> images;
  double rating;
  List<String> tags;
  Product({
    required this.id,
    required this.name,
    required this.pricing,
    this.discount,
    required this.remaining,
    required this.sold,
    required this.images,
    required this.rating,
    required this.tags,
  });

  double get discountedPrice {
    if (discount == null) {
      throw UnimplementedError('Cannot compute discounted price without the discount value provided');
    } else {
      if (discount! < 1 && discount! > 100) {
        throw RangeError.range(discount!, 1, 100, 'Discount must be in range between 1 to 100 only');
      }
      return double.parse((pricing - (pricing * (discount! / 100))).toStringAsFixed(2));
    }
  }
}

enum ProductCategory {
  containers,
  decorations,
  fertilizers,
  peticides,
  plants,
  seedlins,
  seeds,
  tools,
}
