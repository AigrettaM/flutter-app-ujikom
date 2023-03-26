import 'package:flutter/material.dart';
import 'package:rolebased/admin/component/mytextfield.dart';
import 'package:rolebased/student/transaksi/transaksi.dart';
import 'package:intl/intl.dart';

import '../../admin/controller/transaksi_controller.dart';
import '../../admin/models/transaksi_models.dart';

class TransaksiTambahEdit extends StatefulWidget {
  final transaksi_model? transaksi;
  final index;
  TransaksiTambahEdit({this.index, this.transaksi});

  @override
  State<TransaksiTambahEdit> createState() => _TransaksiTambahEditState();
}

class _TransaksiTambahEditState extends State<TransaksiTambahEdit> {
  final _formKey = GlobalKey<FormState>();

  bool isEditingmode = false;

  final TextEditingController id = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController jumlah = TextEditingController();
  final TextEditingController date = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    if (widget.index != null) {
      isEditingmode = true;
      id.text = widget.transaksi?.id;
      name.text = widget.transaksi?.name;
      jumlah.text = widget.transaksi?.jumlah;
      date.text = widget.transaksi?.date;
    } else {
      isEditingmode = false;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    DateTime _initialDate = DateTime.now();
    date.text = DateFormat('yyyy-MM-dd').format(_initialDate);

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
                builder: (context) => const Transaksi(),
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
                        labeltext: "Jumlah",
                        hintedtext: "Jumlah..",
                        mycontroller: jumlah,
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: date,
                        decoration: InputDecoration(
                          labelText: 'Date',
                          contentPadding: const EdgeInsets.only(
                              left: 14.0, bottom: 8.0, top: 8.0),
                          labelStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Raleway_Semibold'),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.deepPurple),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                new BorderSide(color: Colors.deepPurple),
                            borderRadius: new BorderRadius.circular(20),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.redAccent),
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        onTap: () async {
                          DateTime? selectedDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime(1900),
                              initialDate: _initialDate,
                              lastDate: DateTime(2100));
                          if (selectedDate != null) {
                            date.text =
                                DateFormat('yyyy-MM-dd').format(selectedDate);
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            if (isEditingmode == true) {
                              transaksi_controller()
                                  .update_transaksi(transaksi_model(
                                id: id.text,
                                name: name.text,
                                jumlah: jumlah.text,
                                date: date.text,
                              ));
                            } else {
                              transaksi_controller()
                                  .add_transaksi(transaksi_model(
                                name: name.text,
                                jumlah: jumlah.text,
                                date: date.text,
                              ));
                            }
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Transaksi(),
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
