import 'package:faith_fund/app/services/firebase/fire_storage_storage.dart';
import 'package:faith_fund/app/services/firebase/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

import 'index.dart';

class HomeController extends GetxController {
  final log = rmGetLogger("Home Controller");
  final state = HomeState();
  final _fireStoreService = FireStorageService();

  final Rxn<User?> _faithUser = Rxn<User?>(null);

  User? get faithUser => _faithUser.value;

  @override
  void onInit() {
    _faithUser.bindStream(FirebaseAuthService().userStateChanges());
    super.onInit();
  }

  @override
  void onReady() {
    getDonationSum();
    super.onReady();
  }


  void updatePageIndex(int selectedIndex) {
    state.selectedPageIndex = selectedIndex;
  }

  void getDonationSum () {
    state.loadingDonations = true;
    final sum = _fireStoreService.getDonationSum();

    sum.listen((snapshot) {
      state.sum = snapshot;
    });
  }
}
