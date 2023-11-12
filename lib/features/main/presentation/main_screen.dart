import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/magveto_scaffold.dart';
import 'package:magveto/features/main/presentation/home_section.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MagvetoScaffold(
      child: SingleChildScrollView(
        child: Column(
          children: [
            HomeSection(),
            HomeSection(),
          ],
        ),
      ),
    );
  }
}
