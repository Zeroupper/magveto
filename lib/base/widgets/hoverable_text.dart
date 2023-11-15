import 'package:flutter/material.dart';

class HoverableText extends StatefulWidget {
  final VoidCallback onTap;
  final TextStyle? style;
  final String text;

  const HoverableText({super.key, required this.onTap, required this.style, required this.text});

  @override
  HoverableTextState createState() => HoverableTextState();
}

class HoverableTextState extends State<HoverableText> {
  bool _isHovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: Text(
          widget.text,
          style: _isHovering
              ? widget.style?.copyWith(
                  decoration: TextDecoration.underline,
                )
              : widget.style,
        ),
      ),
    );
  }
}
