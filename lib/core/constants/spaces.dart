import 'package:flutter/cupertino.dart';
//sizeBox with height 10
class SmallSpace extends StatelessWidget {
  const SmallSpace({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return SizedBox(
      height: h/45,
    );  }
}
class VerySmallSpace extends StatelessWidget {
  const VerySmallSpace({super.key});



  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return                  SizedBox(height: h*0.01,);
  }
}

class VerySmallSpaceWidth extends StatelessWidget {
  const VerySmallSpaceWidth({super.key});



  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return                  SizedBox(width: w*0.01,);
  }
}





//sizeBox with width 10
class SmallSpaceWidth extends StatelessWidget {
  const SmallSpaceWidth({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return SizedBox(
     width: w/45,
    );  }
}



//sizeBox with hieght 20
class MediumSpace extends StatelessWidget {
  const MediumSpace({super.key});

  @override

  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return SizedBox(
      height: h/25,
    );
  }
}
//sizeBox with width 20

class MediumSpaceWidth extends StatelessWidget {
  const MediumSpaceWidth({super.key});

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width  ;
    double h=MediaQuery.of(context).size.height  ;
    return SizedBox(
      width: h/25,
    );
  }
}

