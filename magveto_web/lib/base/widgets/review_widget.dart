import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/domain/review.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class ReviewWidget extends StatelessWidget {
  final Review review;

  const ReviewWidget({
    super.key,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.format_quote_rounded,
          color: theme.primaryColor,
          size: 32,
        ),
        const Gap(24.0),
        Text(
          review.text,
          style: theme.textTheme.bodyMedium!,
          textAlign: TextAlign.justify,
        ),
        const Gap(16.0),
        RichText(
          text: TextSpan(
            style: theme.textTheme.bodyMedium,
            children: <TextSpan>[
              TextSpan(
                text: review.reviewer,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text: ', ${review.createdAt.toyyyyMMMMFormat()}',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        if (review.description != null)
          Text(
            review.description!,
            style: theme.textTheme.bodySmall,
          ),
      ],
    );
  }
}
