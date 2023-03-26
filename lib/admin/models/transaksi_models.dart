class transaksi_model {
  final id, name, jumlah, date;
  transaksi_model({this.id, this.name, this.jumlah, this.date});

  // Map data to firebase
  Map<String, dynamic> add_data() {
    return {'nama lengkap': name, 'jumlah': jumlah, 'date': date};
  }
}
