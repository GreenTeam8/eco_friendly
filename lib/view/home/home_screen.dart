import 'package:eco_friendly/constants.dart';
import 'package:eco_friendly/view/home/home_widgets/product_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


import 'home_widgets/search_widget.dart';

class HomeScreen extends StatefulWidget {

   HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text('Eco-Friendly', style: TextStyle(fontFamily: 'LilitaOne',fontWeight: FontWeight.bold, fontSize: 30,color: kPrimaryColor)),
        leading: IconButton(
          onPressed: (){},
          icon: SvgPicture.asset('assets/svg/menu.svg',color: kPrimaryColor,),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notification_important),
            color: kPrimaryColor,
            onPressed: (){}, )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Search(),
            ProductCard()
          ],
        ),
      ),
      );

  }
}
