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

  Future<void> saveDonationToStore(PaymentPayload donation) async {
    try {
      await _store.collection("donations").add(donation.toJson());
      
    } on FirebaseException catch (e) {
      log.e("Error saving donation: ${e.message}");
      // Handle error appropriately (e.g., show error to user)
    }
  }
}
