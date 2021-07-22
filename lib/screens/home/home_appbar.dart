part of '../../screens/home.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  final double sizeWidth;
  const HomeAppBar({
    Key? key,
    required this.sizeWidth,
    this.preferredSize = const Size(double.infinity, 100),
  }) : super(key: key);

  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final TextEditingController _txtCtrl = TextEditingController();
  final FocusNode _txtFocus = FocusNode();
  final String _appName = 'Earthly';
  final Widget _appIcon = Image.asset(
    'assets/images/earthly.png',
    filterQuality: FilterQuality.medium,
    height: 24,
  );

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        color: Color(0xFF669933),
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 20,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Text('Sell on Earthly'),
                    onTap: () {},
                  ),
                  VerticalDivider(),
                  InkWell(
                    child: Text('Download App'),
                    onTap: () {},
                  ),
                  VerticalDivider(),
                  InkWell(
                    child: Text('Customer Care'),
                    onTap: () {},
                  ),
                  VerticalDivider(),
                  Row(
                    children: [
                      SelectableText('Follow our page'),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Tooltip(
                          message: 'Follow us on facebook',
                          child: InkWell(
                            child: Icon(MdiIcons.facebook),
                            onTap: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3.0),
                        child: Tooltip(
                          message: 'Follow us on twitter',
                          child: InkWell(
                            child: Icon(MdiIcons.twitter),
                            onTap: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 980),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
                        child: Row(
                          children: [
                            InkWell(
                              hoverColor: Colors.transparent,
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  _appIcon,
                                  widget.sizeWidth > 600
                                      ? Text(
                                          _appName.toUpperCase(),
                                          style: TextStyle(
                                            fontFamily: 'Righteous',
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: TextField(
                          controller: _txtCtrl,
                          focusNode: _txtFocus,
                          decoration: InputDecoration(
                            hintText: 'Search for your garden needs',
                            hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
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
                              duration: Duration(milliseconds: 500),
                              switchInCurve: Curves.linear,
                              switchOutCurve: Curves.linear,
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                              child: _txtCtrl.text.length <= 0
                                  ? IconButton(
                                    key: ValueKey('search'),
                                      icon: Icon(
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
                                    key: ValueKey('clear'),
                                      icon: Icon(
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
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                          ),
                          onChanged: (value) {
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          tooltip: 'My Cart',
                          icon: Icon(Icons.shopping_cart_outlined),
                          onPressed: () {},
                        ),
                        PopupMenuButton(
                          tooltip: 'Show Menu',
                          icon: Icon(Icons.menu_rounded),
                          offset: Offset(0, widget.preferredSize.height + -40),
                          itemBuilder: (context) {
                            return _menuChoices;
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PopupMenuItem> _menuChoices = [
    PopupMenuItem(
      value: 1,
      child: SizedBox(
        height: 20,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            FittedBox(
              fit: BoxFit.contain,
              child: Icon(Icons.person_rounded),
            ),
            Text('Account'),
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
              child: Icon(Icons.settings),
            ),
            Text('Settings'),
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
              child: Icon(Icons.logout_rounded),
            ),
            Text('Log out'),
          ],
        ),
      ),
    ),
  ];
}
