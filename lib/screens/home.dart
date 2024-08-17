import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:gardening_shop/data/logos.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../models/models.dart';
import '../utilities/utilities.dart';
import '../data/app_data.dart';

part 'home/promo_banner.dart';
part 'home/main_categories.dart';
part 'home/home_appbar.dart';
part 'home/bottom_details.dart';
part 'home/copyright_bar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final vertScroll = ScrollController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Scrollbar(
        controller: vertScroll,
        thumbVisibility: true,
        trackVisibility: true,
        child: NestedScrollView(
          controller: vertScroll,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: HomeAppBar(
                  screenSize: size,
                ),
              ),
            ];
          },
          body: Builder(
            builder: (context) {
              return CustomScrollView(
                slivers: [
                  SliverPinnedOverlapInjector(
                    handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                        context),
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: PromoBanner(
                            mainItems: SampleData.mainPromos,
                            sideItems: SampleData.sidePromos,
                          ),
                        ),
                        Flexible(
                          child: MainCategories(
                            list: SampleData.mainCategories,
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                  Deals(
                    identifier: 'Sale',
                    title: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Image.asset(
                        'assets/icons/png/sale.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                    fancyTitle: true,
                    sticky: false,
                    items: SampleData.onSaleProducts,
                  ),
                  Deals(
                    identifier: 'Top Products',
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow.shade700,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Top Products'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    items: SampleData.topProducts,
                  ),
                  Deals(
                    identifier: 'Newest',
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.new_releases_rounded,
                          color: Colors.blue.shade300,
                        ),
                        const SizedBox(width: 10),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Newest'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    items: SampleData.newProducts,
                  ),
                  Deals(
                    identifier: 'Trending',
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(MdiIcons.fire, color: Colors.red.shade500),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Trending'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    items: SampleData.trendingProducts,
                  ),
                  Deals(
                    identifier: 'Daily Discover',
                    itemView: ItemView.grid,
                    items: SampleData.discoverProducts,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.spa_rounded, color: Colors.green.shade300),
                        Flexible(
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              'Daily Discover'.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SliverToBoxAdapter(child: BottomDetails()),
                  SliverToBoxAdapter(child: CopyrightBar(size: size)),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
