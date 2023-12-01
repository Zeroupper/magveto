import 'package:flutter/material.dart';

class SelectableMenu extends StatefulWidget {
  final void Function(int) onSelectedItem;
  final List<String> items;
  final int initialSelectedItem;
  const SelectableMenu({
    super.key,
    required this.onSelectedItem,
    required this.items,
    required this.initialSelectedItem,
  });

  @override
  State<SelectableMenu> createState() => _SelectableMenuState();
}

class _SelectableMenuState extends State<SelectableMenu> {
  int selectedIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedIndex = widget.initialSelectedItem;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: widget.items
          .map(
            (item) => Expanded(
              child: SelectableItem(
                name: item,
                isActive: widget.items.indexOf(item) == selectedIndex,
                onSelect: () {
                  setState(() {
                    selectedIndex = widget.items.indexOf(item);
                  });
                  widget.onSelectedItem(selectedIndex);
                },
              ),
            ),
          )
          .toList(),
    );
  }
}

class SelectableItem extends StatelessWidget {
  final bool isActive;
  final String name;
  final VoidCallback onSelect;

  const SelectableItem({
    super.key,
    this.isActive = false,
    required this.name,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onSelect,
        child: Column(
          children: [
            SelectionContainer.disabled(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  name,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Divider(
              thickness: isActive ? 4 : 1,
              color: isActive ? theme.colorScheme.primary : null,
            ),
          ],
        ),
      ),
    );
  }
}
