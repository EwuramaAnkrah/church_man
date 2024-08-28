import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:faith_fund/app/modules/pay/models/payment_info_model.dart';
import 'package:faith_fund/app/services/firebase/firebase_auth_service.dart';
import 'package:rmdev_widgets/network/log_all_the_time_filter.dart';

class FireStorageService {
  final log = rmGetLogger("FireStorageService");
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  final String uId = FirebaseAuthService().getUId;

  Stream<QuerySnapshot<Object?>> getUserDonations() {
    try {
      return _store
          .collection("donations")
          .where("user_id", isEqualTo: uId)
          .snapshots();
    } on FirebaseException catch (e) {
      log.e("Error fetching donations: ${e.message}");
      return const Stream.empty();
    }
  }

  Stream<double> getDonationSum() {
    try {
      return _store
          .collection("donations")
          .where("user_id", isEqualTo: uId)
          .where("trans_type", isEqualTo: "DON")
          .snapshots().map((snapshot) {
         double sum = 0.0;
         for (var doc in snapshot.docs) {
           double amount = (doc.data())["amount"] ?? 0.00;
           sum += amount;
         }
         return sum;
      });
    } on FirebaseException catch (e) {
      log.e("Error fetching donations: ${e.toString()}");
      return const Stream.empty();
    }
  }

  Future<void> saveDonationToStore(PaymentPayload donation) async {
    try {
      await _store.collection("donations").add(donation.toJson());
    } on FirebaseException catch (e) {
      log.e("Error saving donation: ${e.message}");
      // Handle error appropriately (e.g., show error to user)
    }
  }
}
