import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rolebased/admin/controller/kelas_controller.dart';
import 'package:rolebased/admin/kelas/kelas.dart';

import '../component/mytextfield.dart';
import '../models/kelas_models.dart';

class KelasTambah extends StatefulWidget {
  final kelas_model? transaksi;
  final index;
  KelasTambah({this.index, this.transaksi});

  @override
  State<KelasTambah> createState() => _KelasTambahState();
}

class _KelasTambahState extends State<KelasTambah> {
  bool isEditingmode = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController id = TextEditingController();
  final TextEditingController kelas = TextEditingController();
  final TextEditingController jurusan = TextEditingController();

  void initState() {
    // TODO: implement initState
    if (widget.index != null) {
      isEditingmode = true;
      id.text = widget.transaksi?.id;
      jurusan.text = widget.transaksi?.jurusan;
      kelas.text = widget.transaksi?.kelas;
    } else {
      isEditingmode = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditingmode == true
            ? const Text(
                "Edit Data Kelas",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway_Semibold',
                  fontSize: 20,
                ),
              )
            : const Text(
                "Tambah Data Kelas",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway_Semibold',
                  fontSize: 20,
                ),
              ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        toolbarHeight: 80.0,
        centerTitle: true,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Kelas(),
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        labeltext: "Kelas",
                        hintedtext: "Romawi",
                        mycontroller: kelas,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "Jurusan",
                        hintedtext: "Huruf depan besar",
                        mycontroller: jurusan,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (isEditingmode == true) {
                              kelas_controller().update_kelas(kelas_model(
                                  id: id.text,
                                  kelas: kelas.text,
                                  jurusan: jurusan.text));
                            } else {
                              kelas_controller().add_kelas(kelas_model(
                                  kelas: kelas.text, jurusan: jurusan.text));
                            }
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Kelas(),
                            ),
                          );
                        },
                        child: isEditingmode == true
                            ? const Text(
                                "EDIT",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway_Semibold',
                                  fontSize: 14,
                                ),
                              )
                            : const Text(
                                "SIMPAN",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Raleway_Semibold',
                                  fontSize: 14,
                                ),
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
