import 'package:flutter/material.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/bottom_navigation_bar/active_item.dart';
import 'package:untitled10/features/check_out/persentation/widget/active_item.dart';
import 'package:untitled10/features/check_out/persentation/widget/inactive_item.dart';

class StepItem extends StatelessWidget {
  const StepItem({super.key,required this.index,required this.text,required this.isActive});
 final  String index , text;
 final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(firstChild: ActiveProgressItem(text: text),
        secondChild: InActiveProgressItem(text: text, number: index),
        crossFadeState: isActive?CrossFadeState.showFirst:CrossFadeState.showSecond,
        duration: const Duration(microseconds: 300));
  }
}
