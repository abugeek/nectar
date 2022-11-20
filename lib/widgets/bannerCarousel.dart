/* import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

import '../models/listOfItems.dart';

class BannerCarouselWidget extends StatelessWidget {
  const BannerCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      banners: listBanners,
      customizedIndicators: const IndicatorModel.animation(
        width: 5,
        height: 5,
        spaceBetween: 2,
        widthAnimation: 25,
      ),
      height: 120,
      width: double.infinity,
      activeColor: Theme.of(context).primaryColor,
      disableColor: Colors.grey,
      animation: true,
      indicatorBottom: false,
    );
  }
}
 */