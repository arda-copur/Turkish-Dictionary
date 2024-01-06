class Kelimeler {
  List<AnlamlarList>? anlamlarList;
  Kelimeler({this.anlamlarList});

  Kelimeler.fromJson(Map<String,dynamic> json) {
    if (json['anlamlarListe'] != null) {
      json['anlamlarListe'].forEach((a)=> anlamlarList!.add(AnlamlarList.fromJson(a)));
    }
  }
}

class AnlamlarList {
  String? anlam;
  AnlamlarList({this.anlam});

  AnlamlarList.fromJson(Map<String,dynamic> json) {
    anlam = json['anlam'];
  }
}