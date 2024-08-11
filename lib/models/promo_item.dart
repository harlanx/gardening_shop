abstract class PromoItem {
  final String image;
  final String url;
  PromoItem({required this.image, required this.url});
}

class MainPromoItem extends PromoItem {
  MainPromoItem({
    required super.image,
    required super.url,
  });
}

class SidePromoItem extends PromoItem {
  SidePromoItem({
    required super.image,
    required super.url,
  });
}
