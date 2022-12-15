import 'package:eco_friendly/controller/category_controller.dart';
import 'package:eco_friendly/view/home/mobile/banner_card_mobile.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../zhelpers/constants.dart';
import '../../zhelpers/responsive.dart';
import '../../zhelpers/size_config.dart';
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

  @override
  void didChangeDependencies() {
    if (_isInit) {
      Provider.of<CategoryController>(context).fetchCategories();
      _isInit = false;
    }

    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Scaffold(
      appBar: Responsive.isWeb(context)
          ? null
          : AppBar(
              centerTitle: true,
              title: Image.asset('assets/images/eco-logo.png',
                  fit: BoxFit.contain, width: 150, height: 150),
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.menu,
                  color: kPC,
                  size: 30,
                ),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_active),
                  color: kPC,
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
                                const ProductCardWeb(),
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
                      // Container(
                      //   color: kPC,
                      //   height: height * 0.4,
                      // )
                    ],
                  ),
                )

              ///Mobile UI
              : Column(
                  children: [
                    SearchMobile(),
                    BannerCardMobile(),
                    CategoryCardMobile(),
                    EventHomeCard()
                  ],
                ),
        ),
      ),
    );
  }
}
