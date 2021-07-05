import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PromoBanner extends StatefulWidget {
  final List<MainPromoItem> mainChildren;
  final List<SidePromoItem>? sideChildren;
  final double height;
  final double screenWidth;

  const PromoBanner({
    Key? key,
    required this.mainChildren,
    this.sideChildren,
    this.height = 100,
    required this.screenWidth,
  }) : super(key: key);

  @override
  _PromoBannerState createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final CarouselController _carouselController = CarouselController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: 250,
          maxWidth: 980,
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: widget.sideChildren != null && widget.screenWidth > 1000 ? 80 : 100,
                  child: CarouselSlider.builder(
                    key: Key('MainPromos'),
                    carouselController: _carouselController,
                    itemCount: widget.mainChildren.length,
                    options: CarouselOptions(
                      viewportFraction: 1.0,
                      initialPage: 0,
                      reverse: false,
                      enableInfiniteScroll: true,
                      scrollDirection: Axis.horizontal,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 8),
                      autoPlayAnimationDuration: Duration(milliseconds: 300),
                      autoPlayCurve: Curves.easeInOut,
                      onPageChanged: (index, _) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                    itemBuilder: (_, index, heroIndex) {
                      return InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(widget.mainChildren[index].image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        onTap: () {
                          print('Navigating to ${widget.mainChildren[index].url}');
                        },
                      );
                    },
                  ),
                ),
                if (widget.sideChildren != null && widget.screenWidth > 1000) ...[
                  SizedBox(width: 5),
                  Expanded(
                    flex: 20,
                    child: InkWell(
                      child: CarouselSlider.builder(
                        key: Key('SidePromos'),
                        itemCount: widget.sideChildren!.length,
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          initialPage: 0,
                          reverse: false,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.vertical,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 5),
                          autoPlayAnimationDuration: Duration(milliseconds: 300),
                          autoPlayCurve: Curves.easeInOut,
                        ),
                        itemBuilder: (context, index, heroIndex) {
                          return InkWell(
                            child: Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(widget.sideChildren![index].image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            onTap: () {
                              print('Navigating to ${widget.sideChildren![index].url}');
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ],
            ),
            Positioned(
              left: 10,
              bottom: 10,
              //alignment: Alignment.bottomLeft,
              child: AnimatedSmoothIndicator(
                activeIndex: _currentIndex,
                curve: Curves.easeInOut,
                duration: Duration(milliseconds: 300),
                count: widget.mainChildren.length,
                axisDirection: Axis.horizontal,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: Colors.white.withOpacity(0.8),
                  dotColor: Colors.grey.shade400.withOpacity(0.8),
                ),
                onDotClicked: (index) {
                  _carouselController.animateToPage(index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
