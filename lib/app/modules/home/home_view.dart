import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'index.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF063D7D),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff4091a5),
        title: Obx(() =>
            Text(controller.faithUser?.displayName?.split(" ").first ?? "")),
      ),
      body: const HomeBody(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        unselectedItemColor: const Color(0xFF063D7D),
        backgroundColor: const Color(0xff4091a5),
        items: navbarItems
            .map(
              (navbarItem) => BottomNavigationBarItem(
                label: navbarItem.label,
                icon: SvgPicture.asset(navbarItem.icon),
              ),
            )
            .toList(),
      ),
    );
  }
}
