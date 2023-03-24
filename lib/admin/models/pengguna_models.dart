class pengguna_model {
  final id, name, email, rool;
  pengguna_model({this.id, this.name, this.email, this.rool});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {'nama lengkap': name, 'email': email, 'rool': rool};
  }
}
