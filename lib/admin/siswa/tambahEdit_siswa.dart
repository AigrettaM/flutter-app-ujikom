import 'package:flutter/material.dart';
import 'package:rolebased/admin/component/mytextfield.dart';
import 'package:rolebased/admin/controller/pengguna_controller.dart';
import 'package:rolebased/admin/models/pengguna_models.dart';
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
  final TextEditingController email = TextEditingController();
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
      email.text = widget.pengguna?.email;
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
                builder: (context) => Pengguna(),
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
                padding: EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        labeltext: "Nama Lengkap",
                        mycontroller: name,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "Email Anda",
                        mycontroller: email,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "Rool",
                        mycontroller: rool,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextField(
                        labeltext: "NIS (KAPITAL)",
                        mycontroller: nis,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "NISN (KAPITAL)",
                        mycontroller: nisn,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      MyTextField(
                        labeltext: "KELAS (ROMAWI)",
                        mycontroller: kelas,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      MyTextField(
                        labeltext: "JURUSAN (KAPITAL)",
                        mycontroller: jurusan,
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
                                      email: email.text,
                                      rool: rool.text,
                                      nis: nis.text,
                                      nisn: nisn.text,
                                      kelas: kelas.text,
                                      jurusan: jurusan.text));
                            } else {
                              pengguna_controller().add_pengguna(pengguna_model(
                                  name: name.text,
                                  email: email.text,
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
                              builder: (context) => Pengguna(),
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
