import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _HistoryViewGetX();
  }
}

class _HistoryViewGetX extends GetView<HistoryController> {
  const _HistoryViewGetX({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("HistoryPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HistoryController>(
      init: HistoryController(),
      id: "history",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("history")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
