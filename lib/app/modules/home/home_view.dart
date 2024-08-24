import 'package:flutter/material.dart';
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
        items: List.generate(
          2,
          (index) => const BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home_filled),
          ),
        ),
      ),
    );
  }
}
