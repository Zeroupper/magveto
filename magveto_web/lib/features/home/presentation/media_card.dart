import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/features/home/domain/media.dart';

class MediaCard extends StatelessWidget {
  final double width;
  final Media media;

  const MediaCard({super.key, required this.media, required this.width});

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
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.download,
                        size: 46,
                        color: theme.colorScheme.primary,
                      ),
                      const Gap(8.0),
                      GestureDetector(
                        onTap: () {
                          print('pdf sheet download');
                        },
                        child: SvgPicture.asset(
                          'assets/icons/musical_note.svg',
                          colorFilter: theme.colorScheme.primary.toColorFilter(),
                          height: 36,
                          width: 36,
                        ),
                      ),
                    ],
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
