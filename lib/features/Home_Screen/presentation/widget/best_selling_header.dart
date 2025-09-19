import 'package:flutter/material.dart';

import '../../../../core/utlis/app_colours.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Row(
      children: [
        Text('الأكثر مبيعًا',style: theme.labelSmall!.copyWith(fontWeight: FontWeight.bold) ,),
        Spacer(),
        TextButton(onPressed: () {}, child: Text('المزيد',style: theme.labelSmall!.copyWith(color: AppColours.grey400),) )
      ],
    );
  }
}
