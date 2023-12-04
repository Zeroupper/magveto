import 'package:flutter/material.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/helpers/section_helper.dart';
import 'package:magveto_web/base/widgets/flexible_content_image.dart';
import 'package:magveto_web/base/widgets/section.dart';
import 'package:magveto_web/base/widgets/teaser_text_widget.dart';

class GoalSection extends StatelessWidget {
  const GoalSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Section(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      title: SectionHelper.magveto().goal,
      child: FlexibleContentWidget(
        imagePosition: ImagePosition.left,
        imagePath: 'assets/images/big_group.jpg',
        margin: const EdgeInsets.only(right: 16.0),
        child: TeaserTextWidget(
          body:
              'Lorem ipsum dolor sit amet consectetur. Cursus imperdiet a mi suscipit lectus laoreet donec. Adipiscing quis purus mattis purus interdum. Rhoncus eu nunc nulla risus molestie ut porttitor dictumst. Tortor lorem semper sed consequat elit diam. Ultrices tempor maecenas parturient nibh consequat. Eget quam mattis vivamus eget eu amet magna sagittis.',
          bodyTextStyle: context.theme().textTheme.bodyMedium,
        ),
      ),
    );
  }
}
