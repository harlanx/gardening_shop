part of '../../screens/home.dart';

class MainCategories extends StatefulWidget {
  final List<MainCategoriesProperties> list;
  const MainCategories({super.key, required this.list});

  @override
  State<MainCategories> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<MainCategories> {
  var hoveredTransformState = Matrix4.identity();
  Color hoveredColorState = Colors.grey;
  int hoveredIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        alignment: WrapAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: List.generate(
          widget.list.length,
          (index) => AnimatedContainer(
            transform: hoveredIndex == index
                ? hoveredTransformState
                : Matrix4.identity(),
            curve: Curves.easeOutCubic,
            duration: const Duration(milliseconds: 300),
            height: 120,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  flex: 80,
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: Container(
                      /* decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.solid,
                          width: 5.0,
                          color: Colors.red,
                        ),
                      ), */
                      padding: const EdgeInsets.all(50),
                      child: InkWell(
                        child: SvgPicture.asset(
                          widget.list[index].icon,
                          height: 100,
                          width: 100,
                          colorFilter: ColorFilter.mode(
                              hoveredIndex == index
                                  ? hoveredColorState
                                  : Colors.grey,
                              BlendMode.srcIn),
                        ),
                        onTap: () {
                          debugPrint(
                              'Category: ${widget.list[index].label} tapped!');
                        },
                        onHover: (isHovered) {
                          setState(() {
                            _updateHoverState(isHovered, index);
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: SelectableText(
                    widget.list[index].label,
                    style: TextStyle(
                      fontFamily: 'Itim',
                      color: hoveredIndex == index
                          ? hoveredColorState
                          : Colors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateHoverState(bool hovered, int index) {
    hoveredIndex = index;
    if (hovered) {
      hoveredColorState = const Color(0xFF669933);
      hoveredTransformState = Matrix4.identity()
        ..scale(1.1)
        ..translate(-4.5, -4.5, 0);
    } else {
      hoveredColorState = Colors.grey;
      hoveredTransformState = Matrix4.identity();
    }
  }
}
