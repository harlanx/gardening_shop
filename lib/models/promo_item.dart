abstract class PromoItem {
  final String image;
  final String url;
  PromoItem({required this.image, required this.url});
}

class MainPromoItem extends PromoItem {
  MainPromoItem({
    required String image,
    required String url,
  }) : super(image: image, url: url);
}

class SidePromoItem extends PromoItem {
  SidePromoItem({
    required String image,
    required String url,
  }) : super(image: image, url: url);
}