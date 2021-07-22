import 'package:function_helpers/function_helpers.dart' hide Product;
import 'package:gardening_shop/models/models.dart';

class SampleData {
  static final List<MainCategoriesProperties> mainCategories = [
    MainCategoriesProperties('Containers', 'assets/icons/svg/main_categories/containers_icon.svg'),
    MainCategoriesProperties('Decorations', 'assets/icons/svg/main_categories/decorations_icon.svg'),
    MainCategoriesProperties('Fertilizers', 'assets/icons/svg/main_categories/fertilizer_icon.svg'),
    MainCategoriesProperties('Pesticides', 'assets/icons/svg/main_categories/pesticides_icon.svg'),
    MainCategoriesProperties('Plants', 'assets/icons/svg/main_categories/plants_icon.svg'),
    MainCategoriesProperties('Seedlings', 'assets/icons/svg/main_categories/seedlings_icon.svg'),
    MainCategoriesProperties('Seeds', 'assets/icons/svg/main_categories/seeds_icon.svg'),
    MainCategoriesProperties('Soil', 'assets/icons/svg/main_categories/soil_icon.svg'),
    MainCategoriesProperties('Tools', 'assets/icons/svg/main_categories/tools_icon.svg'),
  ];

  static final List<MainPromoItem> mainPromos = [
    MainPromoItem(
      image: 'assets/images/promos/main_promos/summer_sale.jpg',
      url: 'Summer Sale',
    ),
    MainPromoItem(
      image: 'assets/images/promos/main_promos/garden_assitance.jpg',
      url: 'Garden Assistance',
    ),
    MainPromoItem(
      image: 'assets/images/promos/main_promos/garden_plan.jpg',
      url: 'Garden Planning',
    ),
    MainPromoItem(
      image: 'assets/images/promos/main_promos/grow_up_your_garden.jpg',
      url: 'Garden Motivation',
    ),
    MainPromoItem(
      image: 'assets/images/promos/main_promos/landscape_architect.jpg',
      url: 'Garden Landscape',
    ),
  ];

  static final List<SidePromoItem> sidePromos = [
    SidePromoItem(
      image: 'assets/images/promos/side_promos/planting_campaign.jpg',
      url: 'Planting Campaign',
    ),
    SidePromoItem(
      image: 'assets/images/promos/side_promos/pot_sale_clean.jpg',
      url: 'Indoor Pots Sale',
    ),
    SidePromoItem(
      image: 'assets/images/promos/side_promos/gardening_books.jpg',
      url: 'Gardening Books',
    ),
    SidePromoItem(
      image: 'assets/images/promos/side_promos/pots_sale_vertical.jpg',
      url: 'Outdoor Pots Sale',
    ),
    SidePromoItem(
      image: 'assets/images/promos/side_promos/garden_tools.jpg',
      url: 'Garden Tools',
    ),
  ];

  static final List<Product> onSaleProducts = List.generate(
    10,
    (index) => Product(
      id: RandomHelper.randRangeInt(1, 100),
      name: RandomHelper.randString(20),
      pricing: RandomHelper.randRangeDouble(250, 700),
      discount: RandomHelper.randRangeDouble(1, 40),
      remaining: RandomHelper.randRangeInt(5, 15),
      sold: RandomHelper.randRangeInt(20, 80),
      images: List.generate(3, (index) => RandomHelper.randSingleImage(sampleProductImages)),
      rating: RandomHelper.randRangeDouble(1, 5),
      tags: List.generate(10, (index) => RandomHelper.randString(10)),
    ),
  );
  static final List<Product> topProducts = List.generate(
    10,
    (index) => Product(
      id: RandomHelper.randRangeInt(1, 100),
      name: RandomHelper.randString(10),
      pricing: RandomHelper.randRangeDouble(250, 700),
      remaining: RandomHelper.randRangeInt(5, 15),
      sold: RandomHelper.randRangeInt(20, 80),
      images: List.generate(3, (index) => RandomHelper.randSingleImage(sampleProductImages)),
      rating: RandomHelper.randRangeDouble(1, 5),
      tags: List.generate(10, (index) => RandomHelper.randString(10)),
    ),
  );
  static final List<Product> newProducts = List.generate(
    10,
    (index) => Product(
      id: RandomHelper.randRangeInt(1, 100),
      name: RandomHelper.randString(10),
      pricing: RandomHelper.randRangeDouble(250, 700),
      remaining: RandomHelper.randRangeInt(5, 15),
      sold: RandomHelper.randRangeInt(20, 80),
      images: List.generate(3, (index) => RandomHelper.randSingleImage(sampleProductImages)),
      rating: RandomHelper.randRangeDouble(1, 5),
      tags: List.generate(10, (index) => RandomHelper.randString(10)),
    ),
  );
  static final List<Product> trendingProducts = List.generate(
    10,
    (index) => Product(
      id: RandomHelper.randRangeInt(1, 100),
      name: RandomHelper.randString(10),
      pricing: RandomHelper.randRangeDouble(250, 700),
      remaining: RandomHelper.randRangeInt(5, 15),
      sold: RandomHelper.randRangeInt(20, 80),
      images: List.generate(3, (index) => RandomHelper.randSingleImage(sampleProductImages)),
      rating: RandomHelper.randRangeDouble(1, 5),
      tags: List.generate(10, (index) => RandomHelper.randString(10)),
    ),
  );
  static final List<Product> discoverProducts = List.generate(
    10,
    (index) => Product(
      id: RandomHelper.randRangeInt(1, 100),
      name: RandomHelper.randString(10),
      pricing: RandomHelper.randRangeDouble(250, 700),
      remaining: RandomHelper.randRangeInt(5, 15),
      sold: RandomHelper.randRangeInt(20, 80),
      images: List.generate(3, (index) => RandomHelper.randSingleImage(sampleProductImages)),
      rating: RandomHelper.randRangeDouble(1, 5),
      tags: List.generate(10, (index) => RandomHelper.randString(10)),
    ),
  );
}

List<String> sampleProductImages = [
  'assets/images/products/fertilizer_1.jpg',
  'assets/images/products/fertilizer_2.jpg',
  'assets/images/products/garden_tools_1.jpg',
  'assets/images/products/garden_tools_2.jpg',
  'assets/images/products/garden_tools_3.jpg',
  'assets/images/products/pesticide_1.jpg',
  'assets/images/products/pesticide_2.jpg',
  'assets/images/products/pesticide_3.jpg',
  'assets/images/products/pesticide_4.jpg',
  'assets/images/products/plants_1.jpg',
  'assets/images/products/plants_2.jpg',
  'assets/images/products/plants_3.jpg',
  'assets/images/products/plants_4.jpg',
  'assets/images/products/pots_1.jpg',
  'assets/images/products/pots_2.jpg',
  'assets/images/products/pots_3.jpg',
  'assets/images/products/pots_4.jpg',
  'assets/images/products/seedlings_1.jpg',
  'assets/images/products/seedlings_2.jpg',
  'assets/images/products/seedlings_3.jpg',
  'assets/images/products/seeds_1.jpg',
  'assets/images/products/seeds_2.jpg',
];
