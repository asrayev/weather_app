import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/mycolors.dart';

class WeeklyBuilder extends StatefulWidget {
  const WeeklyBuilder({Key? key}) : super(key: key);

  @override
  State<WeeklyBuilder> createState() => _WeeklyBuilderState();
}

class _WeeklyBuilderState extends State<WeeklyBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.horizontal,
        itemBuilder:(context, index) {
          return Padding(
            padding: const EdgeInsets.all(6.6),
            child: Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: MyColor.C_3C355E.withOpacity(0.8),
                  border: Border.all(color: Colors.white.withOpacity(0.5), width: 0.7)
              ),
              child: Column(
                children: [
                  Text("")


                ],
              ),
            ),
          );
        },),
    );
  }
}

