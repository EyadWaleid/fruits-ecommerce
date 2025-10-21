import 'package:flutter/material.dart';

import '../utlis/app_colours.dart';

class CustomeDivider extends StatelessWidget {
  const CustomeDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(color: AppColours.divederColour,
      thickness: 1.5,


    );
  }
}
