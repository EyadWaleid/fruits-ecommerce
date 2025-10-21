import 'package:flutter/material.dart';
import 'package:untitled10/features/check_out/persentation/widget/address_input_section.dart';
import 'package:untitled10/features/check_out/persentation/widget/shiping_widget.dart';
import 'package:untitled10/features/check_out/persentation/widget/shipipng_section.dart';

import '../../../../core/constants/spaces.dart';
import '../widget/check_out_progress.dart';

class CheckOutBodyView extends StatelessWidget {
  const CheckOutBodyView({
    super.key,
    required this.controller,
  });

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller:controller,
      itemCount: getNames().length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder:(context, index) {
        return getWidgets()[index];

      }, );
  }
}
getWidgets(){
  return [
    ShipipngSection(),
    AddressInputSection()


  ];
}
