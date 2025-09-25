import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled10/core/utlis/app_colours.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context).textTheme;
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFFF3F5F7),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            right: 0, child: IconButton(onPressed: () {

            }, icon: Icon(Icons.favorite_border)),
          ),
          Positioned.fill(
              child: Column(
            children: [
              SizedBox(height: 20,),
             SizedBox(width:114.sp,height:105.sp,child:Image.asset('assets/images/png/pineapple-cuate 1.png',)),
              ListTile(
                title: Text('اناناس',style: theme.bodySmall,),
                subtitle: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '20ج ',
                        style:theme.bodySmall!.copyWith(color: AppColours.primaryOrange),
                      ),

                      TextSpan(
                        text: '/',
                        style:theme.bodySmall!.copyWith(color: AppColours.primaryOrange),
                      ),

                      TextSpan(
                        text: ' الكيلو',
                        style: theme.bodySmall!.copyWith(color: AppColours.lightOrange),
                      ),

                    ],
                  ),
                  textAlign: TextAlign.right,
                ),
                trailing:CircleAvatar(
                  radius: 18.sp,
                  backgroundColor: AppColours.primaryColour,
                  child: FittedBox(child: IconButton(onPressed: (){}, icon: Icon(Icons.add),color: Colors.white,iconSize:25.sp,)),
                ),
              )
            ],
          )),
        ],
      ),
    );
  }
}
