part of '../../screens/home.dart';

class PromoBanner extends StatefulWidget {
  final List<MainPromoItem> mainItems;
  final List<SidePromoItem>? sideItems;

  const PromoBanner({
    super.key,
    required this.mainItems,
    this.sideItems,
  });

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final _horizControl = CarouselSliderController(),
      _vertControl = CarouselSliderController();
  int _horizIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      constraints: const BoxConstraints(maxHeight: 200),
      child: LayoutBuilder(builder: (context, constraints) {
        final w = constraints.maxWidth;
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                Widget child = Stack(
                  alignment: Alignment.bottomLeft,
                  children: [
                    Container(
                      height: (w >= 1000) ? double.infinity : null,
                      width: double.infinity,
                      constraints:
                          const BoxConstraints(minWidth: 600, maxWidth: 700),
                      child: CarouselSlider.builder(
                        key: const Key('MainPromos'),
                        carouselController: _horizControl,
                        itemCount: widget.mainItems.length,
                        disableGesture: true,
                        options: CarouselOptions(
                          viewportFraction: 1.0,
                          initialPage: 0,
                          reverse: false,
                          enableInfiniteScroll: true,
                          scrollDirection: Axis.horizontal,
                          disableCenter: true,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 15),
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 300),
                          autoPlayCurve: Curves.easeInOut,
                          onPageChanged: (index, _) {
                            setState(() {
                              _horizIndex = index;
                            });
                          },
                        ),
                        itemBuilder: (_, index, heroIndex) {
                          return InkWell(
                            child: Image.asset(
                              widget.mainItems[index].image,
                              fit: BoxFit.fill,
                            ),
                            onTap: () {
                              debugPrint(
                                  'Navigating to ${widget.mainItems[index].url}');
                            },
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30.0,
                        vertical: 5.0,
                      ),
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: AnimatedSmoothIndicator(
                          activeIndex: _horizIndex,
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 300),
                          count: widget.mainItems.length,
                          axisDirection: Axis.horizontal,
                          effect: ExpandingDotsEffect(
                            dotHeight: 10,
                            dotWidth: 10,
                            activeDotColor: Colors.white.withOpacity(0.8),
                            dotColor: Colors.grey.shade400.withOpacity(0.8),
                          ),
                          onDotClicked: (index) {
                            _horizControl.animateToPage(index);
                          },
                        ),
                      ),
                    ),
                  ],
                );
                if (w >= 800) {
                  return child;
                } else {
                  return Flexible(child: child);
                }
              },
            ),
            if (w >= 1000) ...[
              const SizedBox(width: 8),
              Flexible(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 160),
                  child: SizedBox.expand(
                    child: CarouselSlider.builder(
                      key: const Key('SidePromos'),
                      carouselController: _vertControl,
                      itemCount: widget.sideItems!.length,
                      disableGesture: true,
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        initialPage: 0,
                        reverse: false,
                        enableInfiniteScroll: true,
                        scrollDirection: Axis.vertical,
                        disableCenter: true,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 8),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 300),
                        autoPlayCurve: Curves.easeInOut,
                      ),
                      itemBuilder: (context, index, heroIndex) {
                        return InkWell(
                          child: Image.asset(
                            widget.sideItems![index].image,
                            fit: BoxFit.fill,
                          ),
                          onTap: () {
                            debugPrint(
                                'Navigating to ${widget.sideItems![index].url}');
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ]
          ],
        );
      }),
    );
  }
}
