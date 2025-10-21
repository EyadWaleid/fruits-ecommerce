import 'package:flutter/material.dart';
import 'package:untitled10/core/constants/spaces.dart';
import 'package:untitled10/core/widget/appButton.dart';
import 'package:untitled10/core/widget/custome_appbar.dart';
import 'package:untitled10/core/widget/custome_divider.dart';
import 'package:untitled10/features/check_out/persentation/widget/check_out_progress.dart';

import '../../../../core/utlis/app_colours.dart';
import 'checkout_body_view.dart';

class CheckOutBody extends StatefulWidget {
  const CheckOutBody({super.key});

  @override
  State<CheckOutBody> createState() => _CheckOutBodyState();
}

class _CheckOutBodyState extends State<CheckOutBody> {
  late PageController controller;
  @override
  void initState() {
    controller =PageController();
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          CustomeAppbar(context: context, title: 'الشحن', notification: false),
         CheckOutProgress(),
          Expanded(child: CheckOutBodyView(controller: controller)),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AppButton(label: 'التالي', function: (){
              controller.nextPage(duration: Duration(seconds: 1), curve: Curves.easeIn);
            },),
          ),
          SmallSpace(),

        ],
      ),
    );
  }
}



