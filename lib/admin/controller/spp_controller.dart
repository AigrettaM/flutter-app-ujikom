import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/spp_model.dart';

final CollectionReference _spp = FirebaseFirestore.instance.collection('spp');

class spp_controller {
  // add data to firebase
  Future add_spp(spp_model spp) async {
    await _spp.doc().set(spp.add_data());
  }

  // update data to firebase
  Future update_spp(spp_model spp) async {
    await _spp.doc(spp.id).update(spp.add_data());
  }

  // delete data to firebase
  Future delete_spp(spp_model spp) async {
    await _spp.doc(spp.id).delete();
  }

  //read data to firebase
}
