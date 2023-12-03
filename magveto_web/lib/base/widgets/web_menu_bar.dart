import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/routes/routes.dart';

class WebMenuItem {
  final String name;
  final List<String> items;
  final TextStyle? menuTextStyle;
  final TextStyle? subMenuTextStyle;
  final VoidCallback onTap;

  WebMenuItem({
    required this.name,
    required this.items,
    required this.onTap,
    this.menuTextStyle,
    this.subMenuTextStyle,
  });
}

class WebMenuBar extends StatefulWidget {
  final List<WebMenuItem> menuItems;

  const WebMenuBar({super.key, required this.menuItems});

  @override
  State<WebMenuBar> createState() => _WebMenuBarState();
}

class _WebMenuBarState extends State<WebMenuBar> with SingleTickerProviderStateMixin {
  late bool isDesktop;

  late final AnimationController _animationController;
  OverlayEntry? _overlayEntryMenu;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (context.isDesktop()) {
      isDesktop = true;
    } else {
      isDesktop = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 1600,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        context.goNamed(HomeRoute.name);
                      },
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 12.0),
                            child: Image.asset(
                              'assets/logo/magveto_logo.png',
                              width: 80,
                              height: 80,
                            ),
                          ),
                          if (!isDesktop)
                            Text(
                              'Magvető',
                              style: theme.textTheme.headlineLarge,
                              textAlign: TextAlign.center,
                            ),
                        ],
                      ),
                    ),
                  ),
                  if (isDesktop)
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ...widget.menuItems.map(
                            (menuItem) => MenuItem(
                              menuName: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: Text(
                                  menuItem.name,
                                  style: menuItem.menuTextStyle ?? theme.textTheme.headlineSmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              onTap: menuItem.onTap,
                              items: menuItem.items
                                  .map(
                                    (item) => Text(
                                      item,
                                      style: menuItem.subMenuTextStyle ?? theme.textTheme.headlineSmall,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (!isDesktop)
                    IconButton(
                      onPressed: () {
                        showMenu();
                      },
                      icon: const Icon(
                        Icons.menu,
                        size: 40,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showMenu() {
    final theme = Theme.of(context);

    _overlayEntryMenu = OverlayEntry(
      builder: (context) => GestureDetector(
        onTap: onMenuClick,
        child: Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.inverseSurface.withOpacity(0.5),
            backgroundBlendMode: BlendMode.darken,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: AnimatedBuilder(
              animation: _animationController,
              builder: (context, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, -1),
                    end: Offset.zero,
                  ).animate(_animationController),
                  child: child,
                );
              },
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 32.0),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surface,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(20.0),
                        bottomLeft: Radius.circular(20.0),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...widget.menuItems.map(
                          (menuItem) => GestureDetector(
                            onTap: () {
                              menuItem.onTap();
                              OverlayManager().removeOverlay(_overlayEntryMenu!);
                            },
                            child: MouseRegion(
                              cursor: SystemMouseCursors.click,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  menuItem.name,
                                  style: Theme.of(context).textTheme.headlineMedium,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 32.0,
                    child: IconButton(
                      onPressed: onMenuClick,
                      icon: const Icon(
                        Icons.menu,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    if (_overlayEntryMenu == null) return;
    OverlayManager().showOverlay(_overlayEntryMenu!, context, allowBackgroundOverlay: true);
    _animationController.forward();
  }

  void onMenuClick() {
    _animationController.reverse().then((value) {
      if (_overlayEntryMenu == null) return;
      OverlayManager().removeOverlay(_overlayEntryMenu!);
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class MenuItem extends StatefulWidget {
  final Widget menuName;
  final VoidCallback onTap;
  final Color? selectedColor;
  final List<Widget> items;
  final MenuController _controller;

  MenuItem({
    super.key,
    required this.menuName,
    required this.items,
    MenuController? controller,
    this.selectedColor,
    required this.onTap,
  }) : _controller = controller ?? MenuController(false);

  @override
  MenuItemState createState() => MenuItemState();
}

class MenuItemState extends State<MenuItem> {
  final GlobalKey _menuKey = GlobalKey();

  void _showMenu(BuildContext context, RenderBox button) {
    widget._controller.openMenu(context, widget.items, button);
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: GestureDetector(
        onTap: widget.onTap,
        child: ValueListenableBuilder(
          valueListenable: widget._controller,
          builder: (BuildContext context, isMenuOpen, Widget? child) => MouseRegion(
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
            child: widget.menuName,
          ),
        ),
      ),
    );
  }
}

class MenuController extends ValueNotifier<bool> {
  OverlayEntry? _overlayEntry;
  Rect? overlayRect;
  GlobalKey overlayKey = GlobalKey();

  MenuController(super.value);

  void openMenu(
    BuildContext context,
    List<Widget> items,
    RenderBox button,
  ) {
    final Offset buttonPosition = button.localToGlobal(Offset.zero);

    double menuWidth = 240.0;
    double availableWidth = MediaQuery.of(context).size.width - buttonPosition.dx;
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
          elevation: 4.0,
          borderRadius: BorderRadius.circular(20.0), //
          child: MouseRegion(
            onExit: (event) => closeMenu(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: items
                    .map(
                      (item) => MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: item,
                        ),
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
    final RenderBox? renderBox = overlayKey.currentContext?.findRenderObject() as RenderBox?;
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

  void showOverlay(
    OverlayEntry overlayEntry,
    BuildContext context, {
    OverlayEntry? above,
    bool allowBackgroundOverlay = false,
  }) {
    if (!allowBackgroundOverlay) closeAllOverlays();
    _activeOverlays.add(overlayEntry);
    Overlay.of(context).insert(overlayEntry, above: above);
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
