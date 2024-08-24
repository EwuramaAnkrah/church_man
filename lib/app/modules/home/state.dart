import 'package:faith_fund/app/modules/pay/models/payment_info_model.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeState {
  final RxList<PaymentPayload> _history = <PaymentPayload>[].obs;
  List<PaymentPayload> get history => _history.toList();
  set setHistory(List<PaymentPayload> history) {
    _history.addAll(history);
  }

  final RxBool _loadingDonations = false.obs;
  bool get loadingDonations => _loadingDonations.value;
  set loadingDonations(bool loading) => _loadingDonations.value = loading;
}
