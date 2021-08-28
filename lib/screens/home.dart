import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gardening_shop/data/sample_data.dart';
import 'package:gardening_shop/models/models.dart';
import 'package:gardening_shop/utilities/custom_widgets/custom_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
part 'home/promo_banner.dart';
part 'home/main_categories.dart';
part 'home/home_appbar.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(sizeWidth: _size.width),
      body: Scrollbar(
        controller: _scrollController,
        interactive: true,
        thickness: 12.0,
        radius: Radius.zero,
        child: SingleChildScrollView(
          controller: _scrollController,
        padding: EdgeInsets.only(top: 20),
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PromoBanner(
              screenWidth: _size.width,
              mainChildren: SampleData.mainPromos,
              sideChildren: SampleData.sidePromos,
            ),
            SizedBox(height: 10),
            MainCategories(
              list: SampleData.mainCategories,
            ),
            SizedBox(height: 20),
            Deals(
              titleAlignment: Alignment.center,
              height: 450,
              itemWidth: 250,
              items: SampleData.onSaleProducts,
              title: Image.asset(
                'assets/icons/png/sale.png',
                height: 80,
              ),
            ),
            SizedBox(height: 20),
            Deals(
              title: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade700),
                  Text(
                    'Top Products',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              height: 250,
              items: SampleData.topProducts,
            ),
            SizedBox(height: 20),
            Deals(
              title: Row(
                children: [
                  Icon(Icons.new_releases_rounded, color: Colors.brown.shade300),
                  Text(
                    'Newest',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              height: 250,
              items: SampleData.newProducts,
            ),
            SizedBox(height: 20),
            Deals(
              title: Row(
                children: [
                  Icon(MdiIcons.fire, color: Colors.red.shade500),
                  Text(
                    'Trending',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              height: 250,
              items: SampleData.trendingProducts,
            ),
            SizedBox(height: 20),
            Deals(
              height: 261.5,
              itemWidth: 161.5,
              itemView: ItemView.grid,
              items: SampleData.discoverProducts,
              title: Row(
                children: [
                  Icon(Icons.spa_rounded, color: Colors.green.shade300),
                  Text(
                    'Daily Discover',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Color(0xFF443022),
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MoreDetail(
                    title: 'More Detail 1',
                    detail:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at consequat augue. Aenean vel velit orci. Integer pulvinar leo vel sem facilisis, sit amet consequat velit sagittis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc commodo euismod ipsum vitae convallis. Aenean fringilla turpis et est gravida semper non eu velit. Phasellus efficitur tristique lectus in luctus. Phasellus consequat, nibh id mollis rhoncus, elit nibh blandit purus, et dignissim urna est quis dolor. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Maecenas pharetra tempus augue eget lobortis. Sed placerat ante tellus. Duis porta sit amet tellus ac pellentesque.',
                  ),
                  MoreDetail(
                    title: 'More Detail 2',
                    detail:
                        'In ac nisi molestie leo porta aliquam at sed tellus. Duis venenatis lacinia nulla sed placerat. Duis fringilla erat a tellus elementum, vel pharetra lectus commodo. Pellentesque ac massa a lorem imperdiet eleifend. Phasellus purus velit, laoreet dapibus nisi quis, egestas molestie purus. Cras at dui id nibh maximus iaculis eget a orci. Sed non dolor nec lacus elementum efficitur. Nulla cursus, diam nec accumsan euismod, enim elit posuere turpis, ac varius mi turpis vitae ex. Sed quis mi euismod, malesuada ante a, tincidunt urna. Vestibulum sed dignissim urna. Sed elementum leo id nisl volutpat gravida. Donec sit amet risus vel ante rutrum rhoncus.',
                  ),
                  MoreDetail(
                    title: 'More Detail 3',
                    detail:
                        'Pellentesque convallis posuere velit, vitae vulputate ante dapibus vitae. Ut efficitur consequat lorem ultrices feugiat. Nulla facilisi. Duis tempor dignissim leo, sed interdum augue aliquam molestie. Praesent venenatis justo ac justo mattis, ac feugiat felis iaculis. Ut mollis mattis purus, quis sodales elit. Nam at nulla rutrum, sollicitudin lacus sit amet, sollicitudin leo.',
                  ),
                ],
              ),
            ),
          ],
          ),
        ),
      ),
    );
  }
}
