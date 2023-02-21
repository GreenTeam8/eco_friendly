import 'package:eco_friendly/controller/category_controller.dart';
import 'package:eco_friendly/view/drawer/web/footer.dart';
import 'package:eco_friendly/view/home/mobile/banner_card_mobile.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import '../../helpers/constants.dart';
import '../../helpers/responsive.dart';
import '../../helpers/size_config.dart';
import '../event/event_widgets/event_home_card.dart';
import 'home_widgets/drawer_section.dart';
import 'mobile/category_card_mobile.dart';
import 'mobile/search_mobile.dart';

import 'web/body/banner_card_web.dart';
import 'web/body/custom_appBar_web.dart';
import 'web/body/category_card_web.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isInit = true;

  Future? _categoryFuture;

  Future _obtainProductsFuture (){
    return Provider.of<CategoryController>(context, listen: false).fetchCategories();
  }

  @override
  void initState() {
    _categoryFuture = _obtainProductsFuture();
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
    final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey<ScaffoldState>();
    return Scaffold(
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
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: const Icon(
                    Icons.dashboard,
                    color: mColor,
                    size: 25,
                  ),
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_active),
                  color: mColor,
                  onPressed: () {},
                )
              ],
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
                                const CategoryCardWeb(),
                                EventHomeCard()
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      ///for footer
                      FooterWeb(),
                    ],
                  ),
                )

              ///Mobile UI
              : Column(
                  children: [
                    SearchMobile(),
                    BannerCardMobile(),
                    FutureBuilder(
                        future: _categoryFuture,
                        builder: (context, snapshot) {
                          if(snapshot.connectionState == ConnectionState.waiting){
                            return Center(child: Lottie.asset('assets/lottie/loading.json', height: height * 0.2),);
                          }else{
                            return CategoryCardMobile();
                          }
                        }),
                    EventHomeCard()
                  ],
                ),
        ),
      ),
    );
  }
}
