
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class BrandingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
        child: Image.asset(
          (size.width < ThemeSizes.small)?
              "deso_ninja.png" : "deso_ninja_full_nobg.png",
            fit: BoxFit.contain,
        ),
    );
  }
}