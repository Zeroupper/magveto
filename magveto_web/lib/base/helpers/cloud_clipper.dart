import 'package:flutter/material.dart';
import 'package:magveto_web/base/enums/cloud_shape_type.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class CloudClipper extends CustomClipper<Path> {
  final CloudShapeType cloudShapeType;

  CloudClipper({super.reclip, required this.cloudShapeType});

  @override
  Path getClip(Size size) {
    Path cloudClip = createCloud(size);
    return cloudClip;
  }

  @override
  bool shouldReclip(oldClipper) => false;

  Path createCloud(Size size) => switch (cloudShapeType) {
        CloudShapeType.wide => getWideCloud(size),
        CloudShapeType.narrow => getNarrowCloud(size)
      };

  Path getNarrowCloud(Size size) {
    final originalSVGSize = CloudShapeType.narrow.originalSize(); // Size(311, 197)

    double scaleX = size.width / originalSVGSize.width;
    double scaleY = size.height / originalSVGSize.height;

    Path cloudShape = Path()
      ..moveTo(48 * scaleX, 58 * scaleY)
      ..cubicTo(
        48 * scaleX,
        58 * scaleY,
        48 * scaleX,
        32 * scaleY,
        71 * scaleX,
        21 * scaleY,
      )
      ..cubicTo(
        94 * scaleX,
        10 * scaleY,
        114 * scaleX,
        29 * scaleY,
        114 * scaleX,
        29 * scaleY,
      )
      ..cubicTo(
        114 * scaleX,
        29 * scaleY,
        119 * scaleX,
        -0.5 * scaleY,
        153 * scaleX,
        0,
      )
      ..cubicTo(
        187 * scaleX,
        0 * scaleY,
        192 * scaleX,
        32 * scaleY,
        192 * scaleX,
        32 * scaleY,
      )
      ..cubicTo(
        192 * scaleX,
        32 * scaleY,
        211 * scaleX,
        11 * scaleY,
        239 * scaleX,
        23 * scaleY,
      )
      ..cubicTo(
        266 * scaleX,
        34 * scaleY,
        262 * scaleX,
        64 * scaleY,
        262 * scaleX,
        64 * scaleY,
      )
      ..cubicTo(
        262 * scaleX,
        64 * scaleY,
        310 * scaleX,
        59 * scaleY,
        310 * scaleX,
        109 * scaleY,
      )
      ..cubicTo(
        310 * scaleX,
        159 * scaleY,
        249 * scaleX,
        135 * scaleY,
        249 * scaleX,
        135 * scaleY,
      )
      ..cubicTo(
        249 * scaleX,
        135 * scaleY,
        254 * scaleX,
        156 * scaleY,
        229 * scaleX,
        172 * scaleY,
      )
      ..cubicTo(
        204 * scaleX,
        189 * scaleY,
        180 * scaleX,
        165 * scaleY,
        180 * scaleX,
        165 * scaleY,
      )
      ..cubicTo(
        180 * scaleX,
        165 * scaleY,
        170 * scaleX,
        196 * scaleY,
        141 * scaleX,
        196 * scaleY,
      )
      ..cubicTo(
        113 * scaleX,
        197 * scaleY,
        102 * scaleX,
        165 * scaleY,
        102 * scaleX,
        165 * scaleY,
      )
      ..cubicTo(
        102 * scaleX,
        165 * scaleY,
        88 * scaleX,
        187 * scaleY,
        57 * scaleX,
        172 * scaleY,
      )
      ..cubicTo(
        26 * scaleX,
        157 * scaleY,
        34 * scaleX,
        135 * scaleY,
        34 * scaleX,
        135 * scaleY,
      )
      ..cubicTo(
        34 * scaleX,
        135 * scaleY,
        -3 * scaleX,
        135 * scaleY,
        0,
        94 * scaleY,
      )
      ..cubicTo(
        3 * scaleX,
        53 * scaleY,
        48 * scaleX,
        58 * scaleY,
        48 * scaleX,
        58 * scaleY,
      )
      ..close();

    return cloudShape;
  }
}

Path getWideCloud(Size size) {
  final originalSVGSize = CloudShapeType.wide.originalSize();

  double scaleX = size.width / originalSVGSize.width;
  double scaleY = size.height / originalSVGSize.height;

  Path cloudShape = Path()
    ..moveTo(0 * scaleX, 111 * scaleY)
    ..cubicTo(
      0 * scaleX,
      69 * scaleY,
      48 * scaleX,
      65 * scaleY,
      59 * scaleX,
      71 * scaleY,
    )
    ..lineTo(59 * scaleX, 71 * scaleY)
    ..cubicTo(
      52 * scaleX,
      42 * scaleY,
      84 * scaleX,
      28 * scaleY,
      84 * scaleX,
      28 * scaleY,
    )
    ..cubicTo(
      116 * scaleX,
      14 * scaleY,
      134 * scaleX,
      31 * scaleY,
      134 * scaleX,
      33 * scaleY,
    )
    ..lineTo(134 * scaleX, 33 * scaleY)
    ..cubicTo(
      137 * scaleX,
      1 * scaleY,
      176 * scaleX,
      0 * scaleY,
      176 * scaleX,
      0 * scaleY,
    )
    ..cubicTo(
      214 * scaleX,
      -1 * scaleY,
      221 * scaleX,
      31 * scaleY,
      221 * scaleX,
      31 * scaleY,
    )
    ..lineTo(221 * scaleX, 31 * scaleY)
    ..cubicTo(
      247 * scaleX,
      14 * scaleY,
      271 * scaleX,
      28 * scaleY,
      271 * scaleX,
      28 * scaleY,
    )
    ..cubicTo(
      295 * scaleX,
      42 * scaleY,
      293 * scaleX,
      71 * scaleY,
      293 * scaleX,
      71 * scaleY,
    )
    ..lineTo(293 * scaleX, 71 * scaleY)
    ..cubicTo(
      355 * scaleX,
      55 * scaleY,
      356 * scaleX,
      106 * scaleY,
      356 * scaleX,
      106 * scaleY,
    )
    ..cubicTo(
      356 * scaleX,
      157 * scaleY,
      316 * scaleX,
      157 * scaleY,
      316 * scaleX,
      157 * scaleY,
    )
    ..lineTo(316 * scaleX, 157 * scaleY)
    ..lineTo(38 * scaleX, 157 * scaleY)
    ..lineTo(38 * scaleX, 157 * scaleY)
    ..cubicTo(
      0 * scaleX,
      157 * scaleY,
      0 * scaleX,
      153 * scaleY,
      0 * scaleX,
      111 * scaleY,
    )
    ..close();

  return cloudShape;
}
