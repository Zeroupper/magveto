import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';
import 'package:magveto/base/domain/album.dart';
import 'package:magveto/base/widgets/album_widget.dart';
import 'package:magveto/base/widgets/footer.dart';
import 'package:magveto/base/widgets/magveto_scaffold.dart';
import 'package:magveto/base/widgets/photo_viewer.dart';
import 'package:magveto/base/widgets/section.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<Album> albums = [
    Album.mock(),
    Album.mock(name: loremIpsum(words: 24)),
    Album.mock(),
    Album.mock(),
    Album.mock(name: loremIpsum(words: 14)),
    Album.mock(),
    Album.mock(name: loremIpsum(words: 4)),
  ];

  @override
  Widget build(BuildContext context) {
    return MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Section(
              title: 'Galléria',
              padding:
                  const EdgeInsets.symmetric(horizontal: 32.0, vertical: 64.0),
              fit: SectionFit.loose,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: albums
                    .map(
                      (album) => AlbumWidget(
                        album: album,
                        onTap: () {
                          showImageViewer(album);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }

  void showImageViewer(Album data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          content: ImageViewer(images: data.images),
        );
      },
    );
  }
}
