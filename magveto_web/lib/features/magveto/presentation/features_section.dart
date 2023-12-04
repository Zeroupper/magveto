import 'package:flutter/material.dart';
import 'package:magveto_web/base/extensions/extensions.dart';
import 'package:magveto_web/base/widgets/feature_icon_text_widget.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final features = <Widget>[
      FeatureIconTextWidget(
        fileName: 'family_friendly.svg',
        text: 'Családbarát',
        style: context.theme().textTheme.headlineSmall?.withBold(),
      ),
      FeatureIconTextWidget(
        fileName: 'catholic.svg',
        text: 'Katolikus',
        style: context.theme().textTheme.headlineSmall?.withBold(),
      ),
      FeatureIconTextWidget(
        fileName: 'guitar.svg',
        text: 'Gitáros',
        style: context.theme().textTheme.headlineSmall?.withBold(),
      ),
      FeatureIconTextWidget(
        fileName: 'singing.svg',
        text: 'Dalos',
        style: context.theme().textTheme.headlineSmall?.withBold(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: features,
      ),
    );
  }
}
