import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/web_clickable_widget.dart';
import 'package:magveto_web/features/magveto/domain/media.dart';

class MediaCard extends StatelessWidget {
  final double? width;
  final Media media;

  const MediaCard({super.key, required this.media, this.width});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: SizedBox(
        width: width,
        height: width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 48.0, horizontal: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SvgPicture.asset(
                    'assets/icons/cd.svg',
                    colorFilter: theme.colorScheme.onSecondaryContainer.toColorFilter(),
                    height: 100,
                    width: 100,
                  ),
                  const Gap(24.0),
                  Text(
                    media.artist != null ? '${media.artist} - ${media.name}' : media.name,
                    style: theme.textTheme.titleMedium?.withSemiBold(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.download,
                    size: 46,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: WebClickableWidget(
                    onTap: () {
                      print('Music download');
                    },
                    builder: (_, __) => SvgPicture.asset(
                      'assets/icons/musical_note.svg',
                      colorFilter: theme.colorScheme.primary.toColorFilter(),
                      height: 36,
                      width: 36,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
