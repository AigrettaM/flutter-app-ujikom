import 'package:flutter/material.dart';
import 'package:rolebased/admin/component/mytextfield.dart';
import 'package:rolebased/admin/controller/siswa_controller.dart';
import 'package:rolebased/admin/models/siswa_models.dart';
import 'package:rolebased/admin/siswa/siswa_data.dart';

class TambahEdit extends StatefulWidget {
  final pengguna_model? pengguna;
  final index;
  TambahEdit({this.index, this.pengguna});

  @override
  State<TambahEdit> createState() => _TambahEditState();
}

class _TambahEditState extends State<TambahEdit> {
  final _formKey = GlobalKey<FormState>();
  bool isEditingmode = false;
  final TextEditingController id = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController rool = TextEditingController();
  final TextEditingController nis = TextEditingController();
  final TextEditingController nisn = TextEditingController();
  final TextEditingController kelas = TextEditingController();
  final TextEditingController jurusan = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.index != null) {
      isEditingmode = true;
      id.text = widget.pengguna?.id;
      name.text = widget.pengguna?.name;
      rool.text = widget.pengguna?.rool;
      nis.text = widget.pengguna?.nis;
      nisn.text = widget.pengguna?.nisn;
      kelas.text = widget.pengguna?.kelas;
      jurusan.text = widget.pengguna?.jurusan;
    } else {
      isEditingmode = false;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: isEditingmode == true
            ? const Text(
                "Edit Data",
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Raleway_Semibold',
                  fontSize: 20,
                ),
              )
            : const Text(
                "Tambah Data",
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
                builder: (context) => const Pengguna(),
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
                        labeltext: "Nama Lengkap",
                        hintedtext: "Kata depan kapital",
                        mycontroller: name,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "Rool",
                        hintedtext: "Student",
                        mycontroller: rool,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextField(
                        labeltext: "NIS",
                        hintedtext: "(KAPITAL)",
                        mycontroller: nis,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "NISN",
                        hintedtext: "(KAPITAL)",
                        mycontroller: nisn,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "KELAS",
                        hintedtext: "(ROMAWI)",
                        mycontroller: kelas,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextField(
                        labeltext: "JURUSAN",
                        hintedtext: "(KAPITAL)",
                        mycontroller: jurusan,
                        keyboardType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (isEditingmode == true) {
                              pengguna_controller().update_pengguna(
                                  pengguna_model(
                                      id: id.text,
                                      name: name.text,
                                      rool: rool.text,
                                      nis: nis.text,
                                      nisn: nisn.text,
                                      kelas: kelas.text,
                                      jurusan: jurusan.text));
                            } else {
                              pengguna_controller().add_pengguna(pengguna_model(
                                  name: name.text,
                                  rool: rool.text,
                                  nis: nis.text,
                                  nisn: nisn.text,
                                  kelas: kelas.text,
                                  jurusan: jurusan.text));
                            }
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Pengguna(),
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
