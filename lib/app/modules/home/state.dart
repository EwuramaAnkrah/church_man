import 'package:faith_fund/app/modules/pay/models/payment_info_model.dart';
import 'package:get/get_rx/get_rx.dart';

class HomeState {
  final RxList<PaymentPayload> _history = <PaymentPayload>[].obs;
  List<PaymentPayload> get history => _history.toList();
  set history(List<PaymentPayload> history) => _history.addAll(history);

  final RxInt _selectedPageIndex = 0.obs;
  int get selectedPageIndex => _selectedPageIndex.value;
  set selectedPageIndex(int index) => _selectedPageIndex.value = index;

  final RxBool _loadingDonations = false.obs;
  bool get loadingDonations => _loadingDonations.value;
  set loadingDonations(bool loading) => _loadingDonations.value = loading;
}
