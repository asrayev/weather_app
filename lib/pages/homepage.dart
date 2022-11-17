import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:weather_app/core/constants/mycolors.dart';
import 'package:weather_app/core/constants/myfonts.dart';
import 'package:weather_app/data/weather_model.dart';
import 'package:weather_app/pages/searchpage.dart';
import 'package:weather_app/pages/widgets/homewidgets/Hourlybuilder.dart';
import 'package:weather_app/pages/widgets/homewidgets/Weeklybuilder.dart';
import '../core/constants/myicons.dart';
import '../core/constants/myimages.dart';
import '../data/models/helper/lat_lon.dart';
import '../data/repository/app_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoaded = false;
  LatLong? latLong;
  @override
  void initState() {
    _init();
    super.initState();
  }
  _init() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData _locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled){
      serviceEnabled = await location.requestService();
      if (!serviceEnabled){
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    if (_locationData.latitude != null) {
      setState(() {
        isLoaded = true;
      });
      latLong = LatLong(
        lat: _locationData.latitude!,
        long: _locationData.longitude!,
      );
    }

  }

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
           child: Stack(
             children: [
               Container(
                 width: MediaQuery.of(context).size.width,
                 child: Column(
                   children: [
                     FutureBuilder<WeatherMainModel>(
                         future: AppRepository.getWeatherMainData("Tashkent"),


                         builder:  (context, AsyncSnapshot<WeatherMainModel> snapshot){
                           if(snapshot.connectionState == ConnectionState.waiting){
                             return const Center(
                               child: CircularProgressIndicator.adaptive(),
                             );
                           }

                           if (snapshot.hasData){
                             var data = snapshot.data!;
                             return Container(
                               child: Column(
                                 children: [
                                   SizedBox(height: 80,),
                                   Text(data.name, style: GoogleFonts.jost(color: Colors.white, fontSize: 40) ),

                                   Text("${data.mainInMain.temp.ceil().toString()}°", style: GoogleFonts.quicksand(color: Colors.white, fontSize: 80),),
                                   Text(data.weatherModel[0].description,style: GoogleFonts.prompt(color: Colors.white70, fontWeight: FontWeight.bold, fontSize: 20),),
                                   Text("H:${data.coordModel.lat.ceil()}°   L:${data.coordModel.lon.ceil()}°", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 20),)
                                 ],
                               ),
                             );
                           }
                           if(snapshot.hasError){
                             return Center(child: Text("Snapshot error"),);
                           }
                           else return Center(child: Text("ERROR"));

                         }),

                   ],
                 ),
               ),
               Align(
               alignment: Alignment.bottomCenter,
               child: Stack(
                 children: [
                   Container(height: MediaQuery.of(context).size.height * 0.36,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(45.r),
                     gradient: LinearGradient(
                       colors: [
                         MyColor.C_2E335A.withOpacity(0.9),
                         MyColor.C_1C1B33.withOpacity(0.9),
                          MyColor.C_612FAB.withOpacity(0.5),
                       ]
                     ),

                     border: Border.all(color: Colors.white, width: 1.w)
                   ),
                     child: Column(
                       children: [
                         DefaultTabController(length: 2, child: Column(
                           children: [
                             const TabBar(indicatorWeight: 1,
                                    indicatorColor: MyColor.C_612FAB,
                                    labelStyle: TextStyle(fontSize: 16),
                                 tabs: [
                                   Tab(text: "Hourly Forecast",),
                                   Tab(text: "Weekly Forecast",),

                                 ]),
                             Container(
                               padding: EdgeInsets.all(4).r,
                               width: MediaQuery.of(context).size.width,
                               height: MediaQuery.of(context).size.height * 0.2,
                               child: TabBarView(
                                   children: [
                                     HourlyBuilder(),
                                     WeeklyBuilder()

                                   ]),)
                           ],
                         ))
                       ],
                     )

                   ),
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
                             InkWell(
                                 onTap: ((){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));

                                 }),

                                 child: SvgPicture.asset(MyIcons.nbar_location)),

                             Image.asset(MyImages.nbar_add),

                             SvgPicture.asset(MyIcons.nbar_category)
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
             ),]
           ),
         ),
    );
  }
}
