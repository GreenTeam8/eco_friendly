import 'package:flutter/material.dart';

import '/size_config.dart';
import '/view/home/home_widgets/web/body/banner_web.dart';
import 'home_widgets/drawer_section.dart';
import '/constants.dart';
import '/responsive.dart';
import '/view/home/home_widgets/mobile/product_card_mobile.dart';
import 'home_widgets/web/body/custom_appBar_web.dart';
import 'home_widgets/web/body/product_card_web.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double width = SizeConfig.screenWidth!;
    double height = SizeConfig.screenHeight!;

    return Scaffold(
      appBar: Responsive.isWeb(context)
          ? null
          : AppBar(
              centerTitle: true,
              title: Image.asset('assets/images/eco-logo.png',
                  fit: BoxFit.contain, width: 150, height: 150),
              leading: IconButton(
                  onPressed: () {
                  },
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
              ? Padding(
                  padding: EdgeInsets.all(height * 0.01),
                  child: Column(
                    children: [
                      const CustomAppBarWeb(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: DrawerSection()),
                          Expanded(
                            flex: 7,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const BannerCardWeb(),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Text(
                                  'Products',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                const ProductCardWeb(),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ///Mobile UI
              : Column(
                  children: const [
                    ProductCardMobile(),
                  ],
                ),
        ),
      ),
    );
  }
}

