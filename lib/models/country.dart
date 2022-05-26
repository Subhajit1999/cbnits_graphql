class Country {
  String code;
  String name;
  Continent continent;
  String currency;
  String emoji;
  String phoneCode;

  Country({this.code='', this.name='', required this.continent, this.currency='', this.emoji='', this.phoneCode=''});

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    code: json["code"] ?? '',
    name: json["name"] ?? '',
    continent: Continent.fromJson(json["continent"]),
    currency: json["currency"] ?? '',
    emoji: json["emoji"] ?? '',
    phoneCode: json["phone"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "continent": continent.toJson(),
    "currency": currency,
    "emoji": emoji,
    "phone": phoneCode,
  };
}

class Continent {
  String name;

  Continent({this.name=''});

  factory Continent.fromJson(Map<String, dynamic> json) => Continent(
    name: json["name"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}
