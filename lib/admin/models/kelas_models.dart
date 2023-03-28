class kelas_model {
  final id, kelas, jurusan;
  kelas_model({this.id, this.kelas, this.jurusan});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {
      'kelas': kelas,
      'jurusan': jurusan,
    };
  }
}
