import 'package:carousel_slider/carousel_slider.dart';
import 'package:coffee_app/screens/widgets/bottom_navigation.dart';
import 'package:coffee_app/screens/widgets/carousel_image.dart';
import 'package:coffee_app/screens/widgets/dashboard_icons.dart';
import 'package:coffee_app/screens/widgets/kupon.dart';
import 'package:coffee_app/screens/widgets/mission_container.dart';
import 'package:coffee_app/utils/colors.dart';
import 'package:coffee_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int activePageIndex = 0;
  int _selectedIndex = 0;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;

  static const List<Map<String, dynamic>> missions = [
    {
      'productName': 'Pizza',
      'productPrice': 'Rp 45.000',
      'imagePath': 'assets/images/pizza.jpg',
    },
    {
      'productName': 'Pasta',
      'productPrice': 'Rp 32.000',
      'imagePath': 'assets/images/pasta.jpg',
    },
  ];

  final List<Map<String, String>> foodOptions = [
    {
      'name': 'Foods',
      'image': 'assets/images/vegans.png',
    },
    {
      'name': 'Coffee',
      'image': 'assets/images/coffee-cup.png',
    },
    {
      'name': 'Tea',
      'image': 'assets/images/tea.png',
    },
    {
      'name': 'Dessert',
      'image': 'assets/images/dessert.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteSmoke,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 45),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 250,
                              viewportFraction: 1.0,
                              enlargeCenterPage: false,
                              autoPlayCurve: Curves.easeOutBack,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  activePageIndex = index;
                                });
                              },
                            ),
                            items: [
                              buildCarouselImage(ImageConstant.bg1),
                              buildCarouselImage(ImageConstant.bg2),
                              buildCarouselImage(ImageConstant.bg3),
                              buildCarouselImage(ImageConstant.bg4),
                              // Add more carousel items as needed
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 77,
                          right: 10,
                          child: AnimatedSmoothIndicator(
                            activeIndex: activePageIndex,
                            count: 4,
                            effect: WormEffect(
                              activeDotColor: Colors.blue,
                              dotColor: Colors.white,
                              dotHeight: 6.0,
                              dotWidth: 6.0,
                            ),
                          ),
                        ),
                        Positioned(
                          top: MediaQuery.of(context).size.height * 0.260,
                          left: 0,
                          right: 0,
                          child: CustomUserInfoWidget(
                            username: 'Hanzy',
                            voucherIconPath: 'assets/images/kupon.svg',
                            pointsIconPath: 'assets/images/points.svg',
                            voucherCount: '1',
                            pointsCount: '10',
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 18,
                      height: 250,
                      decoration: BoxDecoration(
                        color: whiteSmoke,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 20, 20, 20),
                        child: Container(
                          decoration: BoxDecoration(
                            color: white,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 15),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  DashboardItem(
                                                    imagePath:
                                                        'assets/images/shopping-bag1.png',
                                                    title: 'Pickup',
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            DashboardItem(
                                              imagePath:
                                                  'assets/images/deliver.png',
                                              title: 'Delivery',
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 5, 2, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/dessert.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Text(
                                                  'Dessert',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: "Joss",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/vegans.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Text(
                                                  'Foods',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: "Joss",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/coffee-cup.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Text(
                                                  'Coffee',
                                                  style: TextStyle(
                                                    fontFamily: "Joss",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Expanded(
                                              child: Container(
                                                width: 40,
                                                height: 40,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/tea.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 2, 0, 0),
                                                child: Text(
                                                  'Tea',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    fontFamily: "Joss",
                                                    fontSize: 13,
                                                    fontWeight: FontWeight.w400,
                                                  ),
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
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Stack(
                        children: [
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.grey.withOpacity(.3),
                            ),
                          ),
                          Container(
                            height: 100,
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 15,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "15% OFF",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: brownColor,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      "02 - 23 Mei",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black54,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 20),
                                Image.asset("assets/images/drink.png"),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, left: 25, bottom: 10),
                          child: Text(
                            "Best Product",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: black,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 25, right: 25, bottom: 10),
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.normal,
                              color: brownColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 95,
                      child: Swiper(
                        itemCount: missions.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> mission = missions[index];

                          return buildMissionContainer(
                            context,
                            mission['productName'],
                            mission['productPrice'],
                            mission['imagePath'],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SimpleBottomNavigation(
        currentIndex: _selectedIndex,
        selectedItemColor: brownColor,
        unselectedItemColor: const Color(0xff757575),
        type: _bottomNavType,
        onTap: (index) {
          setState(() {
            _selectedIndex = 0;
          });
        },
      ),
    );
  }

  void _showQRCodeDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("QR Code"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Close"),
            ),
          ],
        );
      },
    );
  }
}
