import 'package:flutter/material.dart';
import 'package:untitled10/features/best_selling/presentation/view/best_selling_view.dart';

import '../../../../../core/utlis/app_colours.dart';

class CustomeHeader extends StatelessWidget {
  const CustomeHeader({super.key,required this.header});
  final String header;


  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Row(
      children: [
        Text(header,style: theme.labelSmall!.copyWith(fontWeight: FontWeight.bold,color: Colors.black) ,),
        Spacer(),
        TextButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => BestSellingView(),));
        }, child: Text('المزيد',style: theme.labelSmall!.copyWith(color: AppColours.grey400),) )
      ],
    );
  }
}
