class spp_model {
  final id, tahun, jumlah, date;
  spp_model({this.id, this.tahun, this.jumlah, this.date});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {'tahun': tahun, 'jumlah': jumlah, 'date': date};
  }
}
