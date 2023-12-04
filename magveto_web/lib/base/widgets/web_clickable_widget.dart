import 'package:flutter/material.dart';

typedef HoverableWidgetBuilder = Widget Function(BuildContext context, bool isHovered);

class WebClickableWidget extends StatefulWidget {
  final VoidCallback onTap;
final HoverableWidgetBuilder builder;

  const WebClickableWidget({super.key, required this.onTap, required this.builder});

  @override
  State<WebClickableWidget> createState() => _WebClickableWidgetState();
}

class _WebClickableWidgetState extends State<WebClickableWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: widget.builder(context, isHovered),
      ),
    );
  }
}
