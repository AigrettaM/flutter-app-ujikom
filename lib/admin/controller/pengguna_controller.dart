import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/pengguna_models.dart';

final CollectionReference _users =
    FirebaseFirestore.instance.collection('users');

class controller_pengguna {
  // update

  Future update_users(model_users pengguna) async {
    await _users.doc(pengguna.id).update(pengguna.add_data());
  }

  // delete
  Future delete_users(model_users users) async {
    await _users.doc(users.id).delete();
  }
  // read
}
