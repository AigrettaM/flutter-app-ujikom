class pengguna_model {
  final id, name, nis, nisn, kelas, jurusan, email, rool;
  pengguna_model(
      {this.id,
      this.name,
      this.email,
      this.rool,
      this.nis,
      this.nisn,
      this.kelas,
      this.jurusan});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {
      'nama lengkap': name,
      'email': email,
      'rool': rool,
      'nis': nis,
      'nisn': nisn,
      'kelas': kelas,
      'jurusan': jurusan
    };
  }
}
