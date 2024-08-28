import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:faith_fund/app/routes/app_pages.dart';
import 'package:faith_fund/app/services/firebase/fire_storage_storage.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../services/firebase/firebase_auth_service.dart';
import 'index.dart';

class PayController extends GetxController {
  PayController();

  final state = PayState();

  @override
  void onInit() {
    if (Get.arguments != null) {
      state.service = Get.arguments as OfferingServices;
    }
    super.onInit();
  }

  void onServiceProviderSelected(ServiceProvider provider) {
    state.networkController.text = provider.desc;
    state.serviceProvider = provider;
    state.paymentInfo = state.paymentInfo.copyWith(
      network: provider.code,
    );
    Get.back();
  }

  void onAmountChanged(String amount) {
    state.paymentInfo = state.paymentInfo.copyWith(
      amount: amount.toDouble(),
    );
  }

  void onPhoneNumberChanged(String phoneNumber) {
    if (phoneNumber.isNotEmpty) {
      state.paymentInfo = state.paymentInfo.copyWith(
        customerNumber: phoneNumber,
      );
    }
  }

  void onReferenceChanged(String reference) {
    if (reference.isNotEmpty) {
      state.paymentInfo = state.paymentInfo.copyWith(
        narration: reference,
      );
    }
  }

  void makeDonationRequest() async {
    if (state.payFormKey.currentState?.validate() ?? false) {
      state.isProcessing = true;

      var donation = state.paymentInfo.copyWith(
        transType: state.service.type?.code,
        uId: FirebaseAuthService().getUId,
        date: DateTime.now(),
      );

      await FireStorageService().saveDonationToStore(donation);
      state.isProcessing = false;
      Get.offNamed(Routes.processComplete);
    }
  }
}
