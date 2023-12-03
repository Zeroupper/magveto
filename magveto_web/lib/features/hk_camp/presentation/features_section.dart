import 'package:flutter/material.dart';
import 'package:magveto_web/base/widgets/feature_icon_text_widget.dart';

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    const features = <Widget>[
      FeatureIconTextWidget(
        fileName: 'child_friendly.svg',
        text: 'Gyerekbarát',
      ),
      FeatureIconTextWidget(
        fileName: 'catholic.svg',
        text: 'Katolikus',
      ),
      FeatureIconTextWidget(
        fileName: 'new_friends.svg',
        text: 'Új barátok',
      ),
      FeatureIconTextWidget(
        fileName: 'night_tour.svg',
        text: 'Esti túra',
      ),
      FeatureIconTextWidget(
        fileName: 'vigil.svg',
        text: 'Virrasztás',
      ),
    ];

    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 64.0),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: features,
      ),
    );
  }
}
