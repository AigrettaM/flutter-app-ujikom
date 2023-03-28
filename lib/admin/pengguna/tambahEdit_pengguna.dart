import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:rolebased/admin/models/pengguna_models.dart';
import 'package:rolebased/admin/pengguna/pengguna.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class TambahEditPengguna extends StatefulWidget {
  final model_users? users;
  final index;
  TambahEditPengguna({this.users, this.index});

  @override
  State<TambahEditPengguna> createState() => _TambahEditPenggunaState();
}

class _TambahEditPenggunaState extends State<TambahEditPengguna> {
  bool showProgress = false;
  bool visible = false;

  final _formkey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool isEditingmode = false;
  bool login = false;

  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController newPasswordController =
      new TextEditingController();
  final TextEditingController confirmpassController =
      new TextEditingController();
  final TextEditingController name = new TextEditingController();
  final TextEditingController id = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController mobile = new TextEditingController();
  final TextEditingController nisn_npsnController = new TextEditingController();
  bool _isObscure = true;
  bool _isObscure2 = true;
  File? file;
  var options = [
    'Student',
    'Petugas',
    'Admin',
  ];
  var displayName = TextEditingController();
  var _currentItemSelected = "Student";
  var rools = "Student";

  @override
  void initState() {
    if (widget.index != null) {
      id.text = widget.users?.id;
      emailController.text = widget.users?.email;
      rools = widget.users?.rool;
      nisn_npsnController.text = widget.users?.nisn_npsn;
    }
  }

  final CollectionReference _users =
      FirebaseFirestore.instance.collection("users");
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tambah Pengguna",
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
                builder: (context) => PenggunaS(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(12),
                  child: Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Email',
                            hintText: 'Email..',
                            enabled: true,
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
                          validator: (value) {
                            if (value!.length == 0) {
                              return "Email cannot be empty";
                            }
                            if (!RegExp(
                                    "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                .hasMatch(value)) {
                              return ("Please enter a valid email");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.emailAddress,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nisn_npsnController,
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'NISN/NPSN',
                            hintText: 'NISN/NPSN..',
                            enabled: true,
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
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.length == 0) {
                              return "NISN/NPSN cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("Please enter a valid npsn");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure,
                          controller: passwordController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            filled: true,
                            labelText: 'Password',
                            hintText: 'Password..',
                            enabled: true,
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
                          validator: (value) {
                            RegExp regex = new RegExp(r'^.{6,}$');
                            if (value!.isEmpty) {
                              return "Password cannot be empty";
                            }
                            if (!regex.hasMatch(value)) {
                              return ("please enter valid password min. 6 character");
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: _isObscure2,
                          controller: confirmpassController,
                          decoration: InputDecoration(
                            suffixIcon: IconButton(
                                icon: Icon(_isObscure2
                                    ? Icons.visibility_off
                                    : Icons.visibility),
                                onPressed: () {
                                  setState(() {
                                    _isObscure2 = !_isObscure2;
                                  });
                                }),
                            filled: true,
                            labelText: 'Confirm Password',
                            hintText: 'Confirm Password..',
                            enabled: true,
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
                          validator: (value) {
                            if (confirmpassController.text !=
                                passwordController.text) {
                              return "Password did not match";
                            } else {
                              return null;
                            }
                          },
                          onChanged: (value) {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "Rool  >>  ",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'Raleway_Semibold',
                                  color: Colors.black,
                                ),
                              ),
                              DropdownButton<String>(
                                dropdownColor: Colors.white,
                                isDense: true,
                                isExpanded: false,
                                iconEnabledColor: Colors.black,
                                focusColor: Colors.white,
                                items: options.map((String dropDownStringItem) {
                                  return DropdownMenuItem<String>(
                                    value: dropDownStringItem,
                                    child: Text(
                                      dropDownStringItem,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Raleway_Semibold',
                                        fontSize: 20,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (newValueSelected) {
                                  setState(() {
                                    _currentItemSelected = newValueSelected!;
                                    rools = newValueSelected;
                                  });
                                },
                                value: _currentItemSelected,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                          elevation: 5.0,
                          height: 40,
                          minWidth: width - 200,
                          onPressed: () {
                            setState(() {
                              showProgress = true;
                            });
                            signUp(
                                emailController.text,
                                passwordController.text,
                                nisn_npsnController.text,
                                rools);
                          },
                          color: const Color.fromRGBO(49, 39, 79, 1),
                          child: const Text(
                            "Tambah",
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Raleway_Semibold',
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void signUp(
      String email, String password, String rool, String npsn_nisn) async {
    const CircularProgressIndicator();
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
              {postDetailsToFirestore(email, npsn_nisn.trim(), rool)})
          .catchError((e) {});
    }
  }

  postDetailsToFirestore(String email, String rool, String npsn_nisn) async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    var user = _auth.currentUser;
    CollectionReference ref = FirebaseFirestore.instance.collection('users');
    ref.doc(user!.uid).set({
      'email': emailController.text,
      'nisn/npsn': nisn_npsnController.text,
      'rool': rool,
    });
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => PenggunaS()));
  }
}
