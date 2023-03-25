class pengguna_model {
  final id, name, nis, nisn, kelas, jurusan, rool;
  pengguna_model(
      {this.id,
      this.name,
      this.rool,
      this.nis,
      this.nisn,
      this.kelas,
      this.jurusan});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {
      'nama lengkap': name,
      'rool': rool,
      'nis': nis,
      'nisn': nisn,
      'kelas': kelas,
      'jurusan': jurusan
    };
  }
}
