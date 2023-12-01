import 'package:flutter/material.dart';
import 'package:magveto/base/domain/album.dart';
import 'package:magveto/base/extensions/extensions.dart';

class AlbumWidget extends StatefulWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumWidget({super.key, required this.album, required this.onTap});

  @override
  _AlbumWidgetState createState() => _AlbumWidgetState();
}

class _AlbumWidgetState extends State<AlbumWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          margin: const EdgeInsets.all(12.0),
          width: 280,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isHovered ? 40.0 : 20.0),
                ),
                clipBehavior: Clip.hardEdge,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    transform: Matrix4.identity()..scale(isHovered ? 1.05 : 1),
                    transformAlignment: Alignment.center,
                    child: Image.asset(
                      widget.album.images.first,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 4.0, top: 12.0, bottom: 24.0),
                child: Text(
                  widget.album.name,
                  style: theme.textTheme.titleMedium.withMedium(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
