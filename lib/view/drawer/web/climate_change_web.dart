// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:eco_friendly/controller/climate_change_controller.dart';
// import 'package:eco_friendly/helpers/constants.dart';
// import 'package:eco_friendly/helpers/responsive.dart';
// import 'package:eco_friendly/helpers/size_config.dart';
// import 'package:eco_friendly/view/home/mobile/climate_change/climate_change_mobile.dart';
// import 'package:eco_friendly/view/home/mobile/climate_change/climate_change_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:lottie/lottie.dart';
// import 'package:provider/provider.dart';
//
// class ClimateChangeWeb extends StatefulWidget {
//   const ClimateChangeWeb({Key? key}) : super(key: key);
//
//   @override
//   State<ClimateChangeWeb> createState() => _ClimateChangeWebState();
// }
//
// class _ClimateChangeWebState extends State<ClimateChangeWeb> {
//   Future? _climateChange;
//
//   Future _obtainDetailFuture (){
//     return Provider.of<ClimateChangeController>(context, listen: false).fetchClimateChange();
//   }
//
//   @override
//   void initState() {
//     _climateChange = _obtainDetailFuture();
//     super.initState();
//   }
//   // bool _isInit = true;
//   // void didChangeDependencies() {
//   //   if (_isInit) {
//   //     Provider.of<ClimateChangeController>(context).fetchClimateChange();
//   //     _isInit = false;
//   //   }
//   //
//   //   // TODO: implement didChangeDependencies
//   //   super.didChangeDependencies();
//   // }
//   @override
//   Widget build(BuildContext context) {
//     SizeConfig().init(context);
//     double width = SizeConfig.screenWidth!;
//     double height = SizeConfig.screenHeight!;
//     final ClimateChangeData = Provider.of<ClimateChangeController>(context);
//     final climateChange = ClimateChangeData.getClimateChangeList;
//           return Scaffold(
//             // backgroundColor:kPC10,
//             // appBar: AppBar(
//             //   backgroundColor: kPC,
//             //   leading: Icon(
//             //     Icons.ice_skating,
//             //   ),
//             // ),
//             body: SafeArea(
//               child: SingleChildScrollView(
//                 child:Responsive.isWeb(context)
//                     ?Container(
//                   child: Padding(
//                     padding: EdgeInsets.all(height * 0.020),
//                     child: Column(
//                       children: [
//                         Row(
//                           children: [
//                             SizedBox(
//                               width: width*0.010,
//                             ),
//                             Expanded(
//                               flex: 8,
//                               child: Column(
//                                 children: [
//                                     Container(
//                                       width: width,
//                                       height: height*0.65,
//                                       decoration: BoxDecoration(
//                                           image: DecorationImage(
//                                             image: AssetImage(
//                                               "assets/images/ball.jpg",
//                                             ),
//                                             fit: BoxFit.fill,
//                                           ),
//                                           // borderRadius: BorderRadius.circular(50),
//                                           color: kPrimaryColor
//                                       ),
//                                     ),
//                                   Container(
//                                     width: width,
//                                     height: height*0.60,
//                                     decoration: BoxDecoration(
//                                       image: DecorationImage(image: AssetImage( "assets/images/landing.png",),
//                                         fit: BoxFit.fill,
//                                       ),
//                                     ),
//                                     child:  Row(
//                                       children: [
//                                         Expanded(
//                                           flex: 3,
//                                           child:  SingleChildScrollView(
//                                             child: Column(
//                                               mainAxisAlignment: MainAxisAlignment.start,
//                                               crossAxisAlignment: CrossAxisAlignment.start,
//                                               children: [
//                                                 Container(
//                                                   padding: EdgeInsets.all(width*0.020),
//                                                   width: width*0.50,
//                                                   child: Text(
//                                                     "Climate change refers to the long-term warming of the planet and the impacts this warming is having on the environment and on human communities. "
//                                                         "The Earth's climate is naturally variable,"
//                                                         " but over the past century, the average global temperature has been increasing at an unprecedented rate, primarily due to the burning of fossil fuels such as coal, oil, and natural gas, "
//                                                         "which releases large amounts of carbon dioxide and other greenhouse gases into the atmosphere. These gases trap heat from the sun and cause the Earth's temperature to rise, leading to a range of impacts, including more frequent and severe heatwaves, droughts, and storms, as well as rising sea levels and changes in the distribution and behavior of plants and animals."
//                                                         "The evidence for climate change is overwhelming and includes observations of rising temperatures, melting glaciers and Arctic sea ice, and more frequent and severe extreme weather events. The scientific community is virtually unanimous in its agreement that human activity is the primary cause of climate change, and that urgent action is needed to address this issue. This includes reducing greenhouse gas emissions, adapting to the changes that are already happening, and developing strategies to mitigate the worst impacts of climate change.",
//                                                     style: Theme.of(context).textTheme.bodyText2!.copyWith(
//                                                       color: Colors.black,
//                                                       fontSize: 20,
//                                                     ),
//                                                     textAlign: TextAlign.justify,
//
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 3,
//                                           child: Column(
//                                             children: [
//                                               Padding(
//                                                 padding: EdgeInsets.all(width*0.020),
//                                                 child: Container(
//                                                   width: width,
//                                                   height: height*0.40,
//                                                   decoration: BoxDecoration(
//                                                     borderRadius: BorderRadius.circular(30),
//                                                     border: Border.all(
//                                                       color:kPrimaryColor,
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   Divider(
//                                     color: Colors.green,
//                                   ),
//                                   Container(
//                                     width: width,
//                                     height: height*0.60,
//                                     child: Row(
//                                       children: [
//                                         Expanded(
//                                           flex: 2,
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 width: width,
//                                                 height: height*0.40 ,
//                                                 decoration: BoxDecoration(
//                                                   borderRadius: BorderRadius.circular(30),
//                                                   border: Border.all(
//                                                     color:kPrimaryColor,
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Expanded(
//                                           flex: 8,
//                                           child: Column(
//                                             children: [
//                                               Container(
//                                                 width: width,
//                                                 height: height*0.40,
//                                                 padding: EdgeInsets.only(top: height*0.080),
//                                                 child: CarouselSlider.builder(
//                                                   itemCount: ClimateChangeData.getClimateChangeList.length,
//                                                   itemBuilder: (context, index,real) {
//                                                     return ChangeNotifierProvider.value(
//                                                         value: climateChange[index],
//                                                         child: ClimateChangeWidget(index: index));
//                                                   },
//                                                   options: CarouselOptions(
//                                                     autoPlay: false,
//                                                     reverse: true,
//                                                     enlargeCenterPage: true,
//                                                     enableInfiniteScroll: false,
//                                                     autoPlayInterval: const Duration(milliseconds: 200),
//                                                     viewportFraction: 0.3,
//                                                     enlargeStrategy: CenterPageEnlargeStrategy.scale,
//                                                     enlargeFactor: 0.6,
//                                                     initialPage: 4,
//                                                   ),
//                                                 ),
//
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 )
//                     : Column(
//                   children: [
//                     FutureBuilder(
//                         future: _climateChange,
//                         builder: (context, snapshot) {
//                           if(snapshot.connectionState == ConnectionState.waiting){
//                             return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
//                           }else{
//                             return ClimateChangeMobile();
//                           }
//                         }),
//                   ],
//                 ),
//               ),
//     ),
//
//   );
//   }
// }
