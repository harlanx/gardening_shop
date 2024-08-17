part of '../../screens/home.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TextEditingController _txtCtrl = TextEditingController();
  final FocusNode _txtFocus = FocusNode();

  final _menuChoices = <PopupMenuItem>[
    PopupMenuItem(
      value: 1,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.person_rounded,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              'Account',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
    PopupMenuItem(
      value: 2,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.settings,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
    PopupMenuItem(
      value: 3,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Icon(
                Icons.logout_rounded,
                color: Colors.grey.shade700,
              ),
            ),
            const Text(
              'Log out',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return PinnedHeaderSliver(
      child: Container(
        color: AppData.color,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.screenSize.height >= 350 &&
                widget.screenSize.width >= 350)
              Wrap(
                spacing: 20,
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  InkWell(
                    child: const Text('Sell on Earthly'),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const Text('Download App'),
                    onTap: () {},
                  ),
                  InkWell(
                    child: const Text('Customer Care'),
                    onTap: () {},
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SelectableText('Follow Us:'),
                      Flexible(
                        child: Tooltip(
                          message: 'Follow us on facebook',
                          child: InkWell(
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Icon(MdiIcons.facebook),
                            ),
                            onTap: () {},
                          ),
                        ),
                      ),
                      const VerticalDivider(),
                      Flexible(
                        child: Tooltip(
                          message: 'Follow us on twitter',
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: InkWell(
                              child: Icon(MdiIcons.twitter),
                              onTap: () {},
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            LayoutBuilder(
              builder: (context, constraints) {
                final w = constraints.maxWidth;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Row(
                        children: [
                          InkWell(
                            hoverColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  AppData.icon,
                                  filterQuality: FilterQuality.medium,
                                  height: 32,
                                ),
                                if (w > 600) ...[
                                  const SizedBox(width: 10),
                                  Text(
                                    AppData.name.toUpperCase(),
                                    style: const TextStyle(
                                      fontFamily: 'Righteous',
                                    ),
                                  ),
                                ],
                                const SizedBox(width: 10),
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints.tightFor(width: 600),
                        child: TextField(
                          controller: _txtCtrl,
                          focusNode: _txtFocus,
                          decoration: InputDecoration(
                            hintText: 'Search for your garden needs',
                            hintStyle: const TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w300,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              switchInCurve: Curves.linear,
                              switchOutCurve: Curves.linear,
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: _txtCtrl.text.isEmpty
                                  ? IconButton(
                                      key: const ValueKey('search'),
                                      icon: const Icon(
                                        Icons.search,
                                        color: Color(0xFF669933),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _txtFocus.requestFocus();
                                        });
                                      },
                                    )
                                  : IconButton(
                                      key: const ValueKey('clear'),
                                      icon: const Icon(
                                        Icons.close,
                                        color: Color(0xFF669933),
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          _txtCtrl.clear();
                                        });
                                      },
                                    ),
                            ),
                          ),
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: IconButton(
                                tooltip: 'My Cart',
                                icon: const Icon(Icons.shopping_cart_outlined),
                                onPressed: () {},
                              ),
                            ),
                          ),
                          Flexible(
                            child: FittedBox(
                              fit: BoxFit.contain,
                              child: PopupMenuButton(
                                tooltip: 'Show Menu',
                                icon: const Icon(Icons.menu_rounded),
                                color: Colors.white,
                                itemBuilder: (context) {
                                  return _menuChoices;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
