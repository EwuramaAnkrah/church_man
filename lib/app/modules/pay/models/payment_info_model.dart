class PaymentPayload {
  String? customerNumber;
  String? network;
  double? amount;
  String? transType;
  String? narration;
  DateTime? date;
  String? uId;
  String? donationId;

  PaymentPayload({
    this.customerNumber,
    this.network,
    this.amount,
    this.transType,
    this.narration,
    this.date,
    this.uId,
    this.donationId,
  });

  PaymentPayload copyWith({
    String? customerNumber,
    String? network,
    double? amount,
    String? transType,
    String? narration,
    DateTime? date,
    String? uId,
    String? donationId,
  }) =>
      PaymentPayload(
        customerNumber: customerNumber ?? this.customerNumber,
        network: network ?? this.network,
        amount: amount ?? this.amount,
        transType: transType ?? this.transType,
        narration: narration ?? this.narration,
        date: date ?? this.date,
        uId: uId ?? this.uId,
        donationId: donationId ?? this.donationId,
      );

  factory PaymentPayload.fromMap(Map<String, dynamic>? map) => PaymentPayload(
      amount: map?['amount'] as double?,
      customerNumber: map?['customer_number'] as String?,
      narration: map?['narration'] as String?,
      network: map?['network'] as String?,
      transType: map?['trans_type'] as String?,
      date: DateTime.parse(map?["date"] as String? ?? ""),
      uId: map?["user_id"] as String?,
      donationId: map?["donation_id"] as String?);

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'customer_number': customerNumber,
        'narration': narration,
        "user_id": uId,
        'network': network,
        "donation_id": "donationId${DateTime.now().millisecondsSinceEpoch}",
        'trans_type': transType,
        'date': DateTime.now().toString(),
      };
}
