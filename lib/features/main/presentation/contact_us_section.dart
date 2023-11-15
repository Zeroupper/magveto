import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:magveto/base/extensions/extensions.dart';

class ContactUsSection extends StatelessWidget {
  final _formKey = GlobalKey();

  ContactUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 1600,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Text(
                'Elérhetőség',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 64.0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 600,
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
                            decoration: const InputDecoration(hintText: 'Ide írd az üzeneted!'),
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
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 32.0),
                        child: Image.asset('assets/images/contact_us.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
