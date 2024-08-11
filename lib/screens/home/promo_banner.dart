part of '../../screens/home.dart';

class PromoBanner extends StatefulWidget {
  final List<MainPromoItem> mainChildren;
  final List<SidePromoItem>? sideChildren;
  final double height;
  final double screenWidth;

  const PromoBanner({
    super.key,
    required this.mainChildren,
    this.sideChildren,
    this.height = 100,
    required this.screenWidth,
  });

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double maxW = ShopCons.kMaxScreenWidth;
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: maxW,
          maxHeight: widget.screenWidth > 1000 ? 300 : 350,
        ),
        child: AspectRatio(
          aspectRatio: widget.screenWidth > 1000 ? maxW / 300 : maxW / 350,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex:
                        widget.sideChildren != null && widget.screenWidth > 1000
                            ? 80
                            : 100,
                    child: CarouselSlider.builder(
                      key: const Key('MainPromos'),
                      carouselController: _carouselController,
                      itemCount: widget.mainChildren.length,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        initialPage: 0,
                        reverse: false,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 8),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 300),
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
                                image: AssetImage(
                                    widget.mainChildren[index].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          onTap: () {
                            debugPrint(
                                'Navigating to ${widget.mainChildren[index].url}');
                          },
                        );
                      },
                    ),
                  ),
                  if (widget.sideChildren != null &&
                      widget.screenWidth > 1000) ...[
                    const SizedBox(width: 5),
                    Expanded(
                      flex: 20,
                      child: InkWell(
                        child: CarouselSlider.builder(
                          key: const Key('SidePromos'),
                          itemCount: widget.sideChildren!.length,
                          options: CarouselOptions(
                            viewportFraction: 1.0,
                            initialPage: 0,
                            reverse: false,
                            enableInfiniteScroll: true,
                            scrollDirection: Axis.vertical,
                            autoPlay: true,
                            autoPlayInterval: const Duration(seconds: 5),
                            autoPlayAnimationDuration:
                                const Duration(milliseconds: 300),
                            autoPlayCurve: Curves.easeInOut,
                          ),
                          itemBuilder: (context, index, heroIndex) {
                            return InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        widget.sideChildren![index].image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                debugPrint(
                                    'Navigating to ${widget.sideChildren![index].url}');
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
                  duration: const Duration(milliseconds: 300),
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
      ),
    );
  }
}
