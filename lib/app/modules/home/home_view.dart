import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:faith_fund/app/modules/home/widgets/history/index.dart';
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
      body: Obx(() => IndexedStack(
            index: controller.state.selectedPageIndex,
            children: const [HomeBody(), HistoryPage()],
          )),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          currentIndex: controller.state.selectedPageIndex,
          selectedItemColor: Colors.white,
          unselectedItemColor: const Color(0xB8FFFFFF),
          backgroundColor: const Color(0xff4091a5),
          onTap: (index) => controller.updatePageIndex(index),
          items: navbarItems
              .asMap()
              .entries
              .map(
                (navbarItem) => BottomNavigationBarItem(
                  label: navbarItem.value.label,
                  icon: SvgPicture.asset(
                    navbarItem.value.icon,
                    colorFilter: ColorFilter.mode(
                        navbarItem.key == controller.state.selectedPageIndex
                            ? Colors.white
                            : const Color(0xB8FFFFFF),
                        BlendMode.srcIn),
                  ),
                ),
              )
              .toList(),
        );
      }),
    );
  }
}
