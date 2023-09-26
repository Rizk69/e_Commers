import 'package:cloud_firestore/cloud_firestore.dart';

import '../../model/User_Model.dart';

class FireStoreUser {
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('Users');
  final CollectionReference _categoryCollection =
      FirebaseFirestore.instance.collection('Category');

  Future<void> addUserToFireStore(UserModel userModel) async {
    Map<String, dynamic> userJson = userModel.toJson();

    return await _userCollection.doc(userModel.userId).set(userJson);
  }
}
