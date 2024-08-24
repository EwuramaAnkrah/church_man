import 'package:faith_fund/app/modules/home/home_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'models/payment_info_model.dart';

class PayState {
  /// Service
  final Rx<OfferingServices> _service = const OfferingServices().obs;
  set service(OfferingServices value) => _service.value = value;
  OfferingServices get service => _service.value;

  final _payFormKey = GlobalKey<FormState>().obs;
  GlobalKey<FormState> get payFormKey => _payFormKey.value;
  set payFormKey(GlobalKey<FormState> value) => _payFormKey.value = value;

  final _amountController = TextEditingController().obs;
  TextEditingController get amountController => _amountController.value;
  set amountController(TextEditingController value) =>
      _amountController.value = value;

  final _phoneNumberController = TextEditingController().obs;
  TextEditingController get phoneNumberController =>
      _phoneNumberController.value;
  set phoneNumberController(TextEditingController value) =>
      _phoneNumberController.value = value;

  final _networkController = TextEditingController().obs;
  TextEditingController get networkController => _networkController.value;
  set networkController(TextEditingController value) =>
      _networkController.value = value;

  final _referenceController = TextEditingController().obs;
  TextEditingController get referenceController => _referenceController.value;
  set referenceController(TextEditingController value) =>
      _referenceController.value = value;

  final Rx<ServiceProvider> _serviceProvider = ServiceProvider.empty.obs;
  ServiceProvider get serviceProvider => _serviceProvider.value;
  set serviceProvider(ServiceProvider value) => _serviceProvider.value = value;

  final Rx<PaymentPayload> _paymentPayload = PaymentPayload().obs;
  PaymentPayload get paymentInfo => _paymentPayload.value;
  set paymentInfo(PaymentPayload value) => _paymentPayload.value = value;

  final RxBool _isProcessing = false.obs;
  bool get isProcessing => _isProcessing.value;
  set isProcessing(bool processing) => _isProcessing.value = processing;
}

List<ServiceProvider> serviceProviderList = [
  ServiceProvider.mtnMomo,
  ServiceProvider.telecelCash,
  ServiceProvider.atMoney,
];

enum ServiceProvider {
  mtnMomo("MTN", "MTN Mobile Money"),
  telecelCash("VOD", "Telecel Cash"),
  atMoney("AIR", "AT Money"),
  empty("", ""),
  ;

  const ServiceProvider(this.code, this.desc);

  final String code;
  final String desc;
}
