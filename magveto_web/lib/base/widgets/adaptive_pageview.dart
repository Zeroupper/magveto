import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/selectable_menu.dart';

class AdaptivePageview extends StatefulWidget {
  final List<AdaptivePageViewItem> items;
  const AdaptivePageview({super.key, required this.items});

  @override
  State<AdaptivePageview> createState() => _AdaptivePageviewState();
}

class _AdaptivePageviewState extends State<AdaptivePageview> {
  final _controller = PageController();
  late String selectedItem;

  @override
  void initState() {
    super.initState();
    selectedItem = widget.items[0].name;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsNameList = widget.items.map((item) => item.name).toList();
    final theme = Theme.of(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Gap(32.0),
        context.isDesktop()
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: SelectableMenu(
                  items: itemsNameList,
                  initialSelectedItem: itemsNameList.indexOf(selectedItem),
                  onSelectedItem: (index) {
                    selectedItem = itemsNameList.firstWhere((element) => element == selectedItem);
                    _controller.animateToPage(
                      index,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              )
            : DecoratedBox(
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 3.0,
                      color: theme.primaryColor,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                child: DropdownButton(
                  underline: const SizedBox(),
                  borderRadius: BorderRadius.circular(24.0),
                  iconSize: 40.0,
                  value: selectedItem,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 8.0,
                  ),
                  items: itemsNameList.map((headline) {
                    return DropdownMenuItem<String>(
                      value: headline,
                      child: Text(
                        headline,
                        style: theme.textTheme.headlineMedium,
                      ),
                    );
                  }).toList(),
                  onChanged: (newSelectedItem) {
                    if (newSelectedItem == null) return;
                    setState(() {
                      selectedItem = newSelectedItem;
                    });
                    _controller.animateToPage(
                      itemsNameList.indexOf(selectedItem),
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                ),
              ),
        Expanded(
          child: PageView(
            pageSnapping: false,
            controller: _controller,
            children: widget.items.map((item) => item.child).toList(),
          ),
        ),
      ],
    );
  }
}

class AdaptivePageViewItem {
  final String name;
  final Widget child;

  AdaptivePageViewItem({required this.name, required this.child});
}
