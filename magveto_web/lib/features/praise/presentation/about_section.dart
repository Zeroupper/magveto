import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/adaptive_pageview.dart';
import 'package:magveto_web/base/widgets/flexible_content_image.dart';
import 'package:magveto_web/base/widgets/section.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({super.key});

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection> {
  late final _pages = <AdaptivePageViewItem>[
    AdaptivePageViewItem(
      name: 'Miről szól a dicsőítés?',
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.left,
        imagePath: 'assets/images/big_group.jpg',
        body:
            'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
        margin: const EdgeInsets.only(right: 16.0),
        bodyTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
    AdaptivePageViewItem(
      name: 'Programok',
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.left,
        imagePath: 'assets/images/big_group.jpg',
        body:
            'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
        margin: const EdgeInsets.only(right: 16.0),
        bodyTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
    AdaptivePageViewItem(
      name: 'Történet',
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.left,
        imagePath: 'assets/images/big_group.jpg',
        body:
            'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
        margin: const EdgeInsets.only(right: 16.0),
        bodyTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
    AdaptivePageViewItem(
      name: 'Tudnivalók',
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.left,
        imagePath: 'assets/images/big_group.jpg',
        body:
            'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
        margin: const EdgeInsets.only(right: 16.0),
        bodyTextStyle: Theme.of(context).textTheme.bodyMedium,
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Section(
      title: 'A dicsőítésről',
      child: AdaptivePageview(items: _pages),
    );
  }
}
