import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rolebased/admin/models/pengguna_models.dart';
import 'package:rolebased/admin/siswa_data.dart';

final CollectionReference _pengguna =
    FirebaseFirestore.instance.collection('siswa');

class pengguna_controller {
  // add data to firebase
  Future add_pengguna(pengguna_model pengguna) async {
    await _pengguna.doc().set(pengguna.add_data());
  }

  // update data to firebase
  Future update_pengguna(pengguna_model pengguna) async {
    await _pengguna.doc(pengguna.id).update(pengguna.add_data());
  }

  // delete data to firebase
  Future delete_pengguna(pengguna_model pengguna) async {
    await _pengguna.doc(pengguna.id).delete();
  }

  //read data to firebase
}
