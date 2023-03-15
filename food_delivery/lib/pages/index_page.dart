import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../config/string.dart';
import 'home_page.dart';
import 'cart_page.dart';
import 'category_page.dart';
import 'number_page.dart';
import '../provider/current_index_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IndexPage extends StatelessWidget {
  final List<BottomNavigationBarItem> bottomTabes = [
    const BottomNavigationBarItem(
        icon: Icon(Icons.home), label: KString.homeTitle),
    const BottomNavigationBarItem(
        icon: Icon(Icons.category), label: KString.categoryTitle),
    const BottomNavigationBarItem(
        icon: Icon(Icons.shopping_cart), label: KString.shoppingCartTitle),
    const BottomNavigationBarItem(
        icon: Icon(Icons.person), label: KString.numberTitle),
  ];

  final List<Widget> tabBodies = [
    const HomePage(),
    const CategoryPage(),
    const CartPage(),
    const NumberPage()
  ];

  IndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(750, 1334),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return ListenableProvider<CurrentIndexProvide>(
          create: (context) => CurrentIndexProvide(),
          builder: (context, child) {
            int currentIndex =
                Provider.of<CurrentIndexProvide>(context).currentIndex;
            return Scaffold(
              backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
              bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                items: bottomTabes,
                onTap: (index) {
                  Provider.of<CurrentIndexProvide>(context, listen: false)
                      .changeIndex(index);
                },
              ),
              body: IndexedStack(
                index: currentIndex,
                children: tabBodies,
              ),
            );
          },
        );
      },
    );
  }
}
