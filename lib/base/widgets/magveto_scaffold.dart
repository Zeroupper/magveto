import 'package:flutter/material.dart';
import 'package:magveto/base/widgets/web_menu_bar.dart';

class MagvetoScaffold extends StatelessWidget {
  final Widget child;
  
  const MagvetoScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            child,
            WebMenuBar(),
          ],
        ),
      ),
    );
  }
}
