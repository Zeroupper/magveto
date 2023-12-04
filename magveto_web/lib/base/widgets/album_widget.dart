import 'package:flutter/material.dart';
import 'package:magveto_web/base/domain/album.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/web_clickable_widget.dart';

class AlbumWidget extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumWidget({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return WebClickableWidget(
      onTap: onTap,
      builder: (_, isHovered) => Container(
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
                    album.images.first,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4.0, top: 12.0, bottom: 24.0),
              child: Text(
                album.name,
                style: theme.textTheme.titleMedium.withMedium(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
