
import 'package:flutter/material.dart';

class BrandingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
        child: Image.asset(
            "deso_ninja_full_nobg.png",
            fit: BoxFit.contain,
        ),
    );
  }
}