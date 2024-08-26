import 'package:faith_fund/app/modules/home/index.dart';
import 'package:get/get.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

import '../../../../services/firebase/fire_storage_storage.dart';
import '../../../pay/models/payment_info_model.dart';

class HistoryController extends GetxController {
  final state = HomeState();
  final _fireStoreService = FireStorageService();
  var log = rmGetLogger("Home Controller");

  @override
  void onReady() {
    super.onReady();
    getDonationDate();
  }

  void getDonationDate() {
    state.loadingDonations = true;
    final donations = _fireStoreService.getUserDonations();

    donations.listen(
      (snapshot) {
        state.history = snapshot.docs
            .map(
              (donation) => PaymentPayload.fromMap(
                  donation.data() as Map<String, dynamic>),
            )
            .toList();
      },
      onError: (error) {
        state.loadingDonations = false;
        log.e(error);
      },
      cancelOnError: true,
    );
  }
}
