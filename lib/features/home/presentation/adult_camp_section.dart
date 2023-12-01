import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/flexible_content_image.dart';
import 'package:magveto/base/widgets/section.dart';

class AdultCampSection extends StatelessWidget {
  const AdultCampSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      title: 'Felnőtt imatábor',
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.bottom,
        imagePath: 'assets/images/big_group.jpg',
        body:
            'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
        headline: 'Mi az a felnőtt imatábor?',
        onReadMoreTap: () {},
        actionButton: ElevatedButton(
          child: const Text('Jelentkezés'),
          onPressed: () {},
        ),
      ),
    );
  }
}
