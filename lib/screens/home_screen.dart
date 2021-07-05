import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:gardening_shop/data/sample_data.dart';
import 'package:gardening_shop/utilities/custom_widgets/custom_widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _bodyScrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Size _browserSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: Scrollbar(
        controller: _bodyScrollController,
        isAlwaysShown: true,
        child: ListView(
          controller: _bodyScrollController,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: 20),
          scrollDirection: Axis.vertical,
          children: [
            PromoBanner(
              screenWidth: _browserSize.width,
              mainChildren: SampleData.mainPromos,
              sideChildren: SampleData.sidePromos,
            ),
            SizedBox(height: 10),
            MainCategories(
              list: SampleData.mainCategories,
            ),
            SizedBox(height: 20),
            Deals(
              title: Image.asset(
                'assets/icons/png/sale.png',
                height: 80,
              ),
              titleAlignment: Alignment.center,
              height: 450,
              itemWidth: 250,
              items: SampleData.onSaleProducts,
            ),
            SizedBox(height: 20),
            Deals(
              title: Row(
                children: [
                  Icon(Icons.star, color: Colors.yellow.shade300),
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
                  Icon(MdiIcons.fire, color: Colors.orange.shade500),
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
              height: 250,
              items: SampleData.discoverProducts,
            ),
          ],
        ),
      ),
    );
  }
}
