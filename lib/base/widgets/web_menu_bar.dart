import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

class WebMenuBar extends StatelessWidget {
  final TextStyle? mainMenuTextStyle;
  final TextStyle? subMenuTextStyle;

  const WebMenuBar({super.key, this.mainMenuTextStyle, this.subMenuTextStyle});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 64.0, vertical: 8.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            stops: const [0, 0.9],
            colors: [
              theme.colorScheme.surface,
              theme.colorScheme.surface.withOpacity(0.9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1600),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo/magveto_logo.png',
                      width: 80,
                      height: 80,
                    ),
                    const Gap(24.0),
                    MenuItem(
                      menuName: Text(
                        'Magvető',
                        style:
                            mainMenuTextStyle ?? theme.textTheme.headlineSmall,
                      ),
                      subMenuTextStyleItems: [
                        Text(
                          'Történetünk',
                          style:
                              subMenuTextStyle ?? theme.textTheme.headlineSmall,
                        ),
                        Text(
                          'Tagjaink',
                          style:
                              subMenuTextStyle ?? theme.textTheme.headlineSmall,
                        ),
                        Text(
                          'CD-k',
                          style:
                              subMenuTextStyle ?? theme.textTheme.headlineSmall,
                        ),
                        Text(
                          'Dalok / Kották',
                          style:
                              subMenuTextStyle ?? theme.textTheme.headlineSmall,
                        ),
                        Text(
                          'Képek',
                          style:
                              subMenuTextStyle ?? theme.textTheme.headlineSmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              MenuItem(
                menuName: Text(
                  'Homokkomáromi Imatábor',
                  style: mainMenuTextStyle ?? theme.textTheme.headlineSmall,
                ),
                subMenuTextStyleItems: [
                  Text(
                    'Az imatábor lényege',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Kezdetek',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Képek',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              MenuItem(
                menuName: Text(
                  'Felnőtt Imatábor',
                  style: mainMenuTextStyle ?? theme.textTheme.headlineSmall,
                ),
                subMenuTextStyleItems: [
                  Text(
                    'Mit jelent?',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Tagjaink',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Képek',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              MenuItem(
                menuName: Text(
                  'Dicsőítés',
                  style: mainMenuTextStyle ?? theme.textTheme.headlineSmall,
                ),
                subMenuTextStyleItems: [
                  Text(
                    'Elindult',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Képek',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                ],
              ),
              MenuItem(
                menuName: Text(
                  'Galléria',
                  style: mainMenuTextStyle ?? theme.textTheme.headlineSmall,
                ),
                subMenuTextStyleItems: [
                  Text(
                    'Passiójáték',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    '60 másodperc',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Betlehem',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                  Text(
                    'Régi emlékek',
                    style: subMenuTextStyle ?? theme.textTheme.headlineSmall,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class subMenuTextStyleItem extends HookWidget {
  final Widget child;
  final EdgeInsets padding;
  final VoidCallback onTap;

  const subMenuTextStyleItem({
    super.key,
    required this.child,
    required this.onTap,
    required this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    return Material(
      child: MouseRegion(
        onExit: (event) => isHovered.value = false,
        onEnter: (event) => isHovered.value = true,
        child: Container(
          color: isHovered.value ? Colors.black12 : Colors.transparent,
          padding: padding,
          child: child,
        ),
      ),
    );
  }
}

class MenuItem extends StatefulWidget {
  final Widget menuName;
  final Color? selectedColor;
  final List<Widget> subMenuTextStyleItems;
  final PopupMenuController _controller;

  MenuItem({
    super.key,
    required this.menuName,
    required this.subMenuTextStyleItems,
    PopupMenuController? controller,
    this.selectedColor,
  }) : _controller = controller ?? PopupMenuController(false);

  @override
  MenuItemState createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem> {
  final GlobalKey _menuKey = GlobalKey();

  void _showMenu(BuildContext context, RenderBox button) {
    widget._controller.openMenu(context, widget.subMenuTextStyleItems, button);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: ValueListenableBuilder(
        valueListenable: widget._controller,
        builder: (BuildContext context, isMenuOpen, Widget? child) =>
            MouseRegion(
          key: _menuKey,
          onEnter: (event) => _showMenu(
            context,
            _menuKey.currentContext?.findRenderObject() as RenderBox,
          ),
          onExit: (event) {
            if (widget._controller.overlayRect == null) return;
            if (!widget._controller.overlayRect!.contains(event.position)) {
              widget._controller.closeMenu();
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: widget.menuName,
          ),
        ),
      ),
    );
  }
}

class PopupMenuController extends ValueNotifier<bool> {
  OverlayEntry? _overlayEntry;
  Rect? overlayRect;
  GlobalKey overlayKey = GlobalKey();

  PopupMenuController(super.value);

  void openMenu(
    BuildContext context,
    List<Widget> subMenuTextStyleItems,
    RenderBox button,
  ) {
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    double menuWidth = 240.0;
    double availableWidth =
        MediaQuery.of(context).size.width - buttonPosition.dx;
    bool fitsRight = availableWidth >= menuWidth;

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        buttonPosition + Offset(0, button.size.height),
        buttonPosition +
            Offset(
              fitsRight ? menuWidth : availableWidth - menuWidth,
              button.size.height,
            ),
      ),
      Offset.zero & MediaQuery.of(context).size,
    );

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        key: overlayKey,
        top: position.top,
        left: position.left,
        width: menuWidth,
        child: Material(
          
          elevation: 4.0, // Optional: adds shadow for 3D effect
          borderRadius: BorderRadius.circular(10.0), //
          child: MouseRegion(
            onExit: (event) => closeMenu(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: subMenuTextStyleItems
                    .map(
                      (item) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        child: item,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
        ),
      ),
    );

    OverlayManager().showOverlay(_overlayEntry!, context);
    value = true;
    WidgetsBinding.instance.addPostFrameCallback(afterLayout);
  }

  void closeMenu() {
    if (value) {
      OverlayManager().removeOverlay(_overlayEntry!);
      _overlayEntry = null;
      value = false;
      overlayRect = null;
    }
  }

  void afterLayout(_) {
    final RenderBox? renderBox =
        overlayKey.currentContext?.findRenderObject() as RenderBox?;
    if (renderBox == null) return;
    final size = renderBox.size;
    final Offset position = renderBox.localToGlobal(Offset.zero);
    overlayRect = position & size;
  }
}

class OverlayManager {
  static final OverlayManager _instance = OverlayManager._internal();
  factory OverlayManager() => _instance;
  OverlayManager._internal();

  final List<OverlayEntry> _activeOverlays = [];

  void showOverlay(OverlayEntry overlayEntry, BuildContext context) {
    closeAllOverlays();
    _activeOverlays.add(overlayEntry);
    Overlay.of(context).insert(overlayEntry);
  }

  void closeAllOverlays() {
    for (var overlay in _activeOverlays) {
      overlay.remove();
    }
    _activeOverlays.clear();
  }

  void removeOverlay(OverlayEntry overlayEntry) {
    overlayEntry.remove();
    _activeOverlays.remove(overlayEntry);
  }
}
