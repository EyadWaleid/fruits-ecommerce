import 'package:flutter/material.dart';

import '../../../../core/utlis/app_colours.dart';

class ActiveProgressItem extends StatelessWidget {
  const ActiveProgressItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;

    return Row(
      children: [
        CircleAvatar(
          backgroundColor: AppColours.primaryColour,
          radius: 11.5,
          child: Icon(Icons.check, color: Colors.white),
        ),
        Text(
          text,
          style: theme.bodySmall!.copyWith(
            color: AppColours.primaryColour,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
