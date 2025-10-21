import 'package:flutter/material.dart';
import 'package:untitled10/core/widget/TextField.dart';

import '../../../../core/constants/spaces.dart';

class AddressInputSection extends StatelessWidget {
   AddressInputSection({super.key});
  final TextEditingController nameController=TextEditingController();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController phoneController=TextEditingController();
final TextEditingController addressController=TextEditingController();
final TextEditingController cityController=TextEditingController();
final TextEditingController floorController=TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Form(child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          SmallSpace(),
          FormBox(labeled:'الأسم كامل', controller: nameController,isFilled: true,),
          SmallSpace(),
          FormBox(labeled: 'البريد الإلكتروني', isFilled: true,controller: emailController),
          SmallSpace(),
          FormBox(labeled: 'رقم الهاتف', controller: phoneController,isFilled: true,),
          SmallSpace(),
          FormBox(labeled: 'العنوان', controller: addressController,isFilled: true,),
          SmallSpace(),
          FormBox(labeled:'المدينه' , controller: cityController,isFilled: true,),
          SmallSpace(),
          FormBox(labeled: 'رقم الطابق , رقم الشقه ..', controller: floorController,isFilled: true,),

        ],
      ),
    )) ;
  }
}
