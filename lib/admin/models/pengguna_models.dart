class model_users {
  final id, email, nisn_npsn, rool;
  model_users({this.id, this.email, this.nisn_npsn, this.rool});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {
      'email': email,
      'rool': rool,
      'nisn/npsn': nisn_npsn,
    };
  }
}
