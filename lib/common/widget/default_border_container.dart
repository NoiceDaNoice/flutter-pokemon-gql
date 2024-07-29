import 'package:flutter/material.dart';

import '../theme.dart';

class CustomDefaultBorderContainer extends StatelessWidget {
  final Widget child;
  const CustomDefaultBorderContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(
            defaultRounded,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: child,
      ),
    );
  }
}
