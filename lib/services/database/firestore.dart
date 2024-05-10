import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // Get collection of Orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  // Save order to Database
  Future<void> saveOrderToDatabase(String receipt) async {
    await orders.add({
      'date': DateTime.now(),
      'order': receipt,
      //! add more fields as necessary...
    });
  }
}
