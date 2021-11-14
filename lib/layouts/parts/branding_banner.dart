
import 'package:carbon/themes/sizes.dart';
import 'package:flutter/material.dart';

class BrandingBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      // padding: EdgeInsets.symmetric(vertical: size.height * 0.002),
      alignment: Alignment.center,
        child: Image.asset(
          (size.width < ThemeSizes.small)?
              "images/deso_ninja.png" : "images/deso_ninja_full_nobg.png",
            fit: BoxFit.contain,
        ),
    );
  }
}