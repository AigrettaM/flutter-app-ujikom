import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/kelas_models.dart';

final CollectionReference _kelas =
    FirebaseFirestore.instance.collection('kelas');

class kelas_controller {
  // add data to firebase
  Future add_kelas(kelas_model kelas) async {
    await _kelas.doc().set(kelas.add_data());
  }

  // update data to firebase
  Future update_kelas(kelas_model kelas) async {
    await _kelas.doc(kelas.id).update(kelas.add_data());
  }

  // delete data to firebase
  Future delete_kelas(kelas_model kelas) async {
    await _kelas.doc(kelas.id).delete();
  }

  //read data to firebase
}
