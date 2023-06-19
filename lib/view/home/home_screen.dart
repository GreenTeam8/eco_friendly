import 'package:eco_friendly/controller/category_controller.dart';

import 'package:eco_friendly/view/home/mobile/banner_card_mobile.dart';
import 'package:eco_friendly/view/home/web/body/event_category_card_web.dart';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:eco_friendly/controller/eventcategory_controller.dart';
import 'package:eco_friendly/view/home/mobile/ecategory_card_mobile.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';


import 'home_widgets/climateGoal_card_widget.dart';

import 'home_widgets/drawer_section.dart';
import 'mobile/category_card_mobile.dart';
import 'mobile/search_mobile.dart';

import 'web/body/banner_card_web.dart';
import 'web/body/custom_appBar_web.dart';
import 'web/body/category_card_web.dart';
import '../drawer/web/footer.dart';


class HomeScreen extends StatefulWidget {
  static const HOME_SCREEN_ROUTE_NAME = '/home_Screen';
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  Future? _categoryFuture;
  Future? _ecategoryFuture;

  Future _obtainProductsFuture (){
    return Provider.of<CategoryController>(context, listen: false).fetchCategories();
  }
  Future _obtainEventsFuture (){
    return Provider.of<ECategoryController>(context, listen: false).fetchEventCategories();
  }
  @override
  void initState() {
    _categoryFuture = _obtainProductsFuture();
    _ecategoryFuture = _obtainEventsFuture();
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (_isInit) {
  //     Provider.of<CategoryController>(context).fetchCategories();
  //     _isInit = false;
  //   }
  //
  //   // TODO: implement didChangeDependencies
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;
    final String url = 'https://drive.google.com/file/d/14pYr8ynzVaERxMaN1Pn2vb_rHfyMufg-/view?usp=sharing';
    final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey<ScaffoldState>();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: Drawer(elevation: 0,
          child: DrawerSection(),
        ),
        appBar: Responsive.isWeb(context)
            ? null
            : AppBar(
                centerTitle: true,
                title: Image.asset('assets/images/ecoIcon.png',
                    fit: BoxFit.fill, width: 50, height: 50),
                leading: Builder(
                  builder: (context)=> IconButton(
                    onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                    icon: const Icon(
                      Icons.dashboard,
                      color: mColor,
                      size: 25,
                    ),
                  ),
                ),
                actions: [
                  IconButton(
                icon: Icon(Icons.download, color: mColor, size: 30,),
                onPressed: () async {
                  // check url whether supported or not
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launch(url,
                      forceWebView: true,
                      enableDomStorage: true,
                      enableJavaScript: true,);
                  } else {
                    print('Url is not supported');
                  }
                })],
              ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Responsive.isWeb(context)
                ///Web UI
                ? Container(
                    padding: EdgeInsets.all(height * 0.01),
                    child: Column(
                      children: [
                        const CustomAppBarWeb(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(flex: 2, child: DrawerSection()),
                            Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const BannerCardWeb(),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  //ClimateGoal(),
                                  const CategoryCardWeb(),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  const EventCardWeb(),
                                  // Container(
                                  //   height: height* 0.40,
                                  //   color: Colors.red,
                                  //
                                  // )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        ///for footer
                       // FooterWeb(),
                        FooterWeb()
                      ],
                    ),
                  )

                ///Mobile UI
                : Column(
                    children: [
                      //SearchMobile(),
                      BannerCardMobile(),
                      //ClimateGoal(),
                      FutureBuilder(
                          future: _categoryFuture,
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
                            }else{
                              return CategoryCardMobile();
                            }
                          }),
                      FutureBuilder(
                          future: _ecategoryFuture,
                          builder: (context, snapshot) {
                            if(snapshot.connectionState == ConnectionState.waiting){
                              return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
                            }else{
                              return ECategoryCardMobile();
                            }
                          }),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
