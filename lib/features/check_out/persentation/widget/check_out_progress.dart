import 'package:flutter/material.dart';
import 'package:untitled10/features/Home_Screen/presentation/widget/bottom_navigation_bar/inactive_item,.dart';
import 'package:untitled10/features/check_out/persentation/widget/step_item.dart';



class CheckOutProgress extends StatelessWidget {
  const CheckOutProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getNames().length, (index) {
        return Expanded(
          child: StepItem(
            index: (index + 1).toString(),
            text: getNames()[index],
            isActive: false,
          ),
        );
      }),
    );
  }


}
List<String> getNames() {
  return ['الشحن', 'العنوان', 'الدفع', 'المراجعه'];
}