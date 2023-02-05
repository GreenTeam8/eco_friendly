import 'package:eco_friendly/model/carousel.dart';
import 'package:flutter/material.dart';

class CarousellController with ChangeNotifier{

      List<Carousel> _carouselList = [
      Carousel(
     carouselImage:  "deforestation.jpg"
    ),
      Carousel(
      carouselImage:  "industry.jpg"
    ),
      Carousel(
      carouselImage:  "plasticWaste.jpg"
    ),
      Carousel(
      carouselImage:  "transportation.jpg"
    )
  ];

      List<Carousel> get carouselList => _carouselList;
}