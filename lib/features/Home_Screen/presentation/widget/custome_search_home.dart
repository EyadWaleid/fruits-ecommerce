import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utlis/app_colours.dart';
import '../../../../core/utlis/generated/assets.dart';

class CustomeSearchHome extends StatelessWidget {
   CustomeSearchHome({super.key,required this.searchController});
  TextEditingController searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      shadowColor: Colors.black54,
      child: TextField(


        keyboardType: TextInputType.text,
        controller:searchController ,
        maxLines: 1,

        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),

        style:Theme.of(context).textTheme.titleSmall!.copyWith(color:Colors.black,fontSize:16),
        decoration:  InputDecoration(
          hintText: 'ابحث عن....',
          hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColours.grey400,fontWeight: FontWeight.bold),
          contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),

          focusedBorder:UnderlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.circular(15)),
          enabledBorder: OutlineInputBorder(borderSide:BorderSide.none),
          suffixIcon:IconButton(color:AppColours.grey400, onPressed:(){}, icon:Icon(Icons.filter_list_rounded) ),
          prefixIcon:Padding(
            padding: const EdgeInsets.all(10),

                child: SvgPicture.asset(Assets.svgSearchNormal,fit: BoxFit.fill,),
          ),


        ),
        cursorColor: Colors.black,


      ),
    );
  }
}
