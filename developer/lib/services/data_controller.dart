import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class DataController extends GetxController {
  Future getData(String collection) async {
    var firebaseFirestore;
    QuerySnapshot snapshot =
        await firebaseFirestore.collection(collection).get();
    return snapshot.documents;
  }

  Future queryData(String queryString) async {
    // ignore: non_constant_identifier_names
    var FirebaseFirestore;
    return FirebaseFirestore.instance
        .collection('features')
        .where('title', isGreaterThanorEqualTo: queryString)
        .get();
  }
}
