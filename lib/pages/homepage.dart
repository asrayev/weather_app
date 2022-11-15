import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../core/constants/myicons.dart';
import '../core/constants/myimages.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           height: MediaQuery.of(context).size.height,
           width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(

              image: DecorationImage(
                  image: AssetImage(MyImages.fon, ),fit: BoxFit.cover)
            ),
           child: Align(
             alignment: Alignment.bottomCenter,
             child: Stack(
               children: [
                 Container(height: MediaQuery.of(context).size.height * 0.36,
                 color: Colors.blue,),
                 Positioned(
                   bottom: -19,
                   child: Container(
                     height: 110.h,
                     width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(MyImages.navigationbar, ),
                       fit: BoxFit.cover
                      ),

                    ),
                     child: Padding(
                       padding: const EdgeInsets.only(right: 30, left: 30),
                       child: Row(

                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                           SvgPicture.asset(MyIcons.nbar_location),

                           Image.asset(MyImages.nbar_add),

                           SvgPicture.asset(MyIcons.nbar_category)
                         ],
                       ),
                     ),
                   ),
                 ),
               ],
             ),
           ),
         ),
    );
  }
}
