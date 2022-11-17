import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/mycolors.dart';

class HourlyBuilder extends StatefulWidget {
  const HourlyBuilder({Key? key}) : super(key: key);

  @override
  State<HourlyBuilder> createState() => _HourlyBuilderState();
}

class _HourlyBuilderState extends State<HourlyBuilder> {
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
                    SizedBox(height: 15,),
                    Text("${index+1} AM", style: TextStyle(color: Colors.white),),
                    SizedBox(height: 20,),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),

                    ),
                    SizedBox(height: 20,),
                    Text("19°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),),

                    
                    
                  ],
                ),
              ),
            );
          },),
      );
    }
  }

