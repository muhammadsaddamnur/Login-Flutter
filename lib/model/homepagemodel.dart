class Profil {
  final String id_pembeli;
  final String nama;
  final String email;
  final String alamat;
  final String no_hp;

  Profil({this.id_pembeli, this.nama, this.email, this.alamat, this.no_hp});

  factory Profil.fromJson(Map<String, dynamic> json) {
    return new Profil(
      id_pembeli: json['profil']['id_pembeli'],
      nama: json['profil']['nama'],
      email: json['profil']['email'],
      alamat: json['profil']['alamat'],
      no_hp: json['profil']['no_hp']
    );
  }
}