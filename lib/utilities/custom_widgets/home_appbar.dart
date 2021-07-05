import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  const HomeAppBar({
    Key? key,
    this.preferredSize = const Size(double.infinity, 100),
  }) : super(key: key);
  @override
  final Size preferredSize;

  @override
  _HomeAppBarState createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  final String _appName = 'Earthly';
  final Widget _appIcon = Icon(MdiIcons.sproutOutline);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: widget.preferredSize,
      child: Container(
        color: Color(0xFF26d270),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Flexible(
                    child: FittedBox(
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
                                  Text(
                                    _appName.toUpperCase(),
                                    style: TextStyle(
                                      fontFamily: 'Righteous',
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
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
                            ),
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Search',
                          icon: Icon(Icons.search),
                          onPressed: () {},
                        ),
                      ],
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