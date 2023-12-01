import 'dart:math';

import 'package:flutter/material.dart';
import 'package:magveto/base/enums/cloud_shape_type.dart';
import 'package:magveto/base/extensions/extensions.dart';
import 'package:magveto/base/helpers/clip_shadow_path.dart';
import 'package:magveto/base/helpers/cloud_clipper.dart';

class CloudWidget extends StatelessWidget {
  final CloudShapeType type;
  final Widget child;

  const CloudWidget({
    super.key,
    this.type = CloudShapeType.wide,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final maxWidth = type == CloudShapeType.wide
            ? min(constraints.maxWidth * 0.8, 700).toDouble()
            : min(constraints.maxWidth, 500).toDouble();

        return ClipShadowPath(
          clipper: CloudClipper(cloudShapeType: type),
          shadow: const Shadow(
            blurRadius: 14,
            offset: Offset(0, 4),
          ),
          child: Container(
            color: Colors.white,
            width: maxWidth,
            child: Padding(
              padding: type.toPadding(maxWidth),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
