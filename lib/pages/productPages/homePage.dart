import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar/pages/productPages/productOverview.dart';
import 'package:nectar/widgets/bars/navigationBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _searchBoxController = TextEditingController();
  final _bannerPageController = PageController();
  int _currentBannerIndex = 0;
  final int _currentNavIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _homePageBody(),
      bottomNavigationBar: const BottomNavBar(),
    );
  }

  _homePageBody() {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 46.0, left: 24, right: 24),
          child: Column(
            children: [
              _homePageHeader(),
            ],
          ),
        ));
  }

  _homePageHeader() {
    return Column(
      children: [
        SvgPicture.asset(
          'assets/svg/logoColor.svg',
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/pinMap.svg'),
            const SizedBox(
              width: 6,
            ),
            const Text(
              'Tashkent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        _searchBox(),
        const SizedBox(
          height: 20,
        ),
        _adBanner(),
        const SizedBox(
          height: 30,
        ),
        _exclusOffer(),
        const SizedBox(
          height: 30,
        ),
        _bestSelling(),
        const SizedBox(
          height: 30,
        ),
        _groceries(),
      ],
    );
  }

  _searchBox() {
    return ClipRRect(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      borderRadius: BorderRadius.circular(15),
      child: TextField(
        controller: _searchBoxController,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: 'Search Store',
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          hintStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 8,
            ),
            child: SvgPicture.asset(
              'assets/svg/searchIcon.svg',
            ),
          ),
          border: InputBorder.none,
          fillColor: Colors.grey[200],
          filled: true,
        ),
      ),
    );
  }

  _adBanner() {
    return AspectRatio(
      aspectRatio: 16 / 5,
      child: Stack(
        children: [
          PageView(
            controller: _bannerPageController,
            onPageChanged: (int index) {
              setState(() {
                _currentBannerIndex = index;
              });
            },
            children: [
              _adItems(),
              _adItems(),
              _adItems(),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: _bannerIndicators(),
          )
        ],
      ),
    );
  }

  _adItems() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Image.asset(
        'assets/images/bannerHome.png',
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  _bannerIndicators() {
    return DotsIndicator(
      dotsCount: 3,
      decorator: DotsDecorator(
        size: const Size(6, 6),
        activeSize: const Size(16, 6),
        spacing: const EdgeInsets.all(6),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      position: _currentBannerIndex.toDouble(),
    );
  }

  _exclusOffer() {
    return Column(
      children: [
        _productsTitle(title: 'Exclusive Offer', onPressed: () {}),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Row(
              children: List<Widget>.generate(4, (index) {
            return _buildProducts(
                index: index,
                onAddPressed: () {
                  const ProductOverview();
                });
          })),
        )
      ],
    );
  }

  _bestSelling() {
    return Column(
      children: [
        _productsTitle(title: 'Best Selling', onPressed: () {}),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Row(
              children: List<Widget>.generate(4, (index) {
            return _buildProducts(
                index: index,
                onAddPressed: () {
                  const ProductOverview();
                });
          })),
        )
      ],
    );
  }

  _groceries() {
    return Column(
      children: [
        _productsTitle(title: 'Groceries', onPressed: () {}),
        const SizedBox(
          height: 16,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Row(
              children: List<Widget>.generate(4, (index) {
            return _buildProducts(index: index, onAddPressed: () {});
          })),
        )
      ],
    );
  }

  _productsTitle({required String title, required Function onPressed}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        Text('See all',
            style:
                TextStyle(fontSize: 14, color: Theme.of(context).primaryColor)),
      ],
    );
  }

  _buildProducts({required int index, required VoidCallback onAddPressed}) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: SizedBox(
        height: 280,
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child: Material(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: BorderSide(
                    width: 1, color: Theme.of(context).dividerColor)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Image.asset(
                        'assets/images/banana.png',
                        width: double.infinity,
                        height: 80,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Banana',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18)),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('7pcs, 1kg',
                          style: TextStyle(color: Colors.grey, fontSize: 14)),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('4.99\$',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      InkResponse(
                        onTap: onAddPressed,
                        child: Material(
                          borderRadius: BorderRadius.circular(16),
                          color: Theme.of(context).primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.add, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
