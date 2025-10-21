import 'package:flutter/material.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/features/check_out/persentation/widget/shiping_widget.dart';

class ShipipngSection extends StatelessWidget {
   ShipipngSection({super.key});
  ValueNotifier<bool>firstWidget=ValueNotifier(false);
  ValueNotifier<bool>secondWidget=ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SmallSpace(),
        SmallSpace(),
        ValueListenableBuilder(
          valueListenable: firstWidget,
          builder: (context, value, child) {
            return ShipingWidget(
              onTap: () {
                if(secondWidget.value==true){
                firstWidget.value=!firstWidget.value;
                secondWidget.value=false;}
                firstWidget.value=true ;
              }  ,isSelected: firstWidget.value, price: '40 جنيه', title: 'الدفع عند الاستلام', subTitle: 'التسليم من المكان',);
          }
        ),
        SmallSpace(),
        ValueListenableBuilder(
          valueListenable: secondWidget,
          builder: (context, value, child) {
            return ShipingWidget(
              onTap: () {
                if(firstWidget.value=true) {
                  secondWidget.value = !secondWidget.value;
                  firstWidget.value=false;
                }
                secondWidget.value=true;
              }, isSelected: secondWidget.value, price: 'مجاني', title: 'اشتري الان وادفع لاحقا', subTitle: 'يرجي تحديد طريقه الدفع');

          }
        )],
    );
  }
}
