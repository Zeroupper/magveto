import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:magveto_web/base/extensions/extensions.dart';

class ContactUsSection extends StatelessWidget {
  final _formKey = GlobalKey();

  ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 64.0),
      width: 1600,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24.0),
            child: Text(
              'Elérhetőség',
              style: context.theme().textTheme.displayMedium,
            ),
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Teljes név'),
                        ),
                        const Gap(12.0),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Email cím'),
                        ),
                        const Gap(12.0),
                        TextFormField(
                          decoration: const InputDecoration(hintText: 'Tárgy'),
                        ),
                        const Gap(12.0),
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Ide írd az üzeneted!',
                          ),
                          minLines: 5,
                          maxLines: 12,
                        ),
                        const Gap(24.0),
                        FilledButton(
                          style: const ButtonStyle().big(theme),
                          onPressed: () {},
                          child: const Text('Üzenet küldése'),
                        ),
                        const Gap(64.0),
                      ],
                    ),
                  ),
                  if (context.isDesktop())
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 32.0,
                          horizontal: 32.0,
                        ),
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: <Color>[
                                theme.colorScheme.inverseSurface,
                                theme.colorScheme.inverseSurface.withOpacity(0.6),
                                theme.colorScheme.inverseSurface.withOpacity(0.1),
                              ],
                              stops: const [
                                0.1,
                                0.7,
                                1,
                              ],
                              tileMode: TileMode.mirror,
                            ).createShader(bounds);
                          },
                          child: SvgPicture.asset(
                            'assets/icons/contact_us.svg',
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
