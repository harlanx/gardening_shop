class Product {
  int id;
  String name;
  double pricing;
  double? oldPricing;
  int remaining;
  int sold;
  List<String> images;
  double rating;
  List<String> tags;
  Product({
    required this.id,
    required this.name,
    required this.pricing,
    this.oldPricing,
    required this.remaining,
    required this.sold,
    required this.images,
    required this.rating,
    required this.tags,
  });
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
