import 'dart:convert';

import 'package:coffee_app/common/app_routes.dart';
import 'package:coffee_app/models/category.dart';
import 'package:coffee_app/screens/widgets/bottom_navigation.dart';
import 'package:coffee_app/screens/widgets/category_item.dart';
import 'package:coffee_app/screens/widgets/item.dart';
import 'package:coffee_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  int selectedCategory = 0;
  int _selectedIndex = 1;
  BottomNavigationBarType _bottomNavType = BottomNavigationBarType.shifting;
  List<Map<String, dynamic>> products = [];
  List<CategoryData> categoryDataList = [];

  @override
  void initState() {
    super.initState();
    _loadCategories().then((value) {
      setState(() {
        categoryDataList = value;
      });
    });

    _loadProducts().then((value) {
      setState(() {
        products = value;
      });
    });
  }

  Future<List<CategoryData>> _loadCategories() async {
    try {
      var categoryUrl = Uri.parse(
          'https://oxigenapi-582117d502c0.herokuapp.com/api/menu-category');
      final categoryResponse = await http.get(categoryUrl);

      if (categoryResponse.statusCode == 200) {
        List<dynamic> categoryJsonResponse = json.decode(categoryResponse.body);
        return categoryJsonResponse
            .map((category) => CategoryData.fromJson(category))
            .toList();
      } else {
        throw Exception('Gagal mengambil data kategori dari API');
      }
    } catch (e) {
      throw e;
    }
  }

  Future<List<Map<String, dynamic>>> _loadProducts() async {
    try {
      var url =
          Uri.parse('https://oxigenapi-582117d502c0.herokuapp.com/api/menu');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.cast<Map<String, dynamic>>();
      } else {
        throw Exception('Gagal mengambil data dari API');
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.030,
            ),
            Container(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Menu',
                    style: GoogleFonts.sora(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, bottom: 8.0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    categoryDataList.length,
                    (index) => CategoryItem(
                      index: index,
                      title: categoryDataList[index].name,
                      image: categoryDataList[index].image,
                      selectedCategory: selectedCategory,
                      onClick: () {
                        setState(() => selectedCategory = index);
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            Expanded(
                child: GridView.builder(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: size.width / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                mainAxisExtent: 220,
              ),
              itemCount: products
                  .where((product) =>
                      product['category_name'] ==
                      categoryDataList[selectedCategory].name)
                  .toList()
                  .length,
              itemBuilder: (context, productIndex) {
                var filteredProducts = products
                    .where((product) =>
                        product['category_name'] ==
                        categoryDataList[selectedCategory].name)
                    .toList();
                return Item(
                  image:
                      'https://oxigenapi-582117d502c0.herokuapp.com/assets-admin/media/menus/' +
                          filteredProducts[productIndex]['product_image'],
                  name: filteredProducts[productIndex]['product_name'],
                  description: filteredProducts[productIndex]['product_desc'],
                  price: double.parse(
                      filteredProducts[productIndex]['product_price']),
                  onTap: (data) {
                    Navigator.pushNamed(
                      context,
                      Routes.detail,
                      arguments: data,
                    );
                  },
                );
              },
            )),
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
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
