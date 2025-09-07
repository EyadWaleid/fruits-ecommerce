import 'package:flutter/material.dart';

import '../utlis/app_colours.dart';
class FormBox extends StatelessWidget {
  String labeled;
  Widget? suffixIcon;
  bool? isObscured;
  bool?  isFilled;
  TextInputType? keyboardType;
  String? Function(String?)? validator;
  void Function()? onPressed ;
  TextEditingController controller;

  FormBox({super.key,this.onPressed,this.isFilled,required this.labeled,this.isObscured, this.validator,this.keyboardType,required this.controller,this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return   TextFormField(

      keyboardType: keyboardType??null,
      controller:controller ,
      maxLines: 1,
      obscureText: isObscured??false,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),

      style:Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.black,fontSize:16),
      decoration:  InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        //the style of label in the floating or in the form
        labelText:labeled,
        labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColours.grey400,fontWeight: FontWeight.bold),
        floatingLabelAlignment: FloatingLabelAlignment.start,
        floatingLabelStyle:   TextStyle(color:Colors.black,fontSize: 20),
        //the colour of the formBox
        fillColor: AppColours.fieldColour,
        filled: isFilled??false,


        //the status of the form box in the enable focus and error
        focusedBorder:UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
        enabledBorder: OutlineInputBorder(borderRadius:const BorderRadius.all(Radius.circular(4)),borderSide:BorderSide(color: AppColours.boardColour,width: 1,)),
        errorBorder: const OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(4)),borderSide: BorderSide(color: Colors.red) ),
        //the icons of the form box
        suffixIcon:IconButton(color:AppColours.grey400, onPressed:onPressed, icon:suffixIcon ??Icon(null) ),
      ),
      cursorColor: Colors.black,

      validator: validator??(value){

      },

    );
  }
}
