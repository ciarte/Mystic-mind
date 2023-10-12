class TarotDB {
  final String cbdDesc;
  final String desc;
  final String image;
  final String name;
  final String rdesc;
  final int sequence;

  TarotDB({
    required this.cbdDesc,
    required this.desc,
    required this.image,
    required this.name,
    required this.rdesc,
    required this.sequence,
  });

  factory TarotDB.fromJson(Map<String, dynamic> json) => TarotDB(
        cbdDesc: json["cbd_desc"] ?? 'nada',
        desc: json["desc"],
        image: json["image"],
        name: json["name"],
        rdesc: json["rdesc"],
        sequence: json["sequence"],
      );

  Map<String, dynamic> toJson() => {
        "cbd_desc": cbdDesc,
        "desc": desc,
        "image": image,
        "name": name,
        "rdesc": rdesc,
        "sequence": sequence,
      };
}
